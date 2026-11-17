#requires -Version 7.6
<#
.SYNOPSIS
Exercise report/export failure boundaries using synthetic SDK replacements.
.DESCRIPTION
Always launch SDK fixtures in a fresh child process. No live authentication,
network calls or tenant configuration changes. Outputs remain in ignored
local-output. Passing these tests does not pass live T24/T25.
#>
[CmdletBinding()]
param([switch]$ChildProcess)
if (-not $ChildProcess) {
    $executable=Join-Path $PSHOME $(if ($IsWindows) {'pwsh.exe'} else {'pwsh'})
    & $executable -NoLogo -NoProfile -NonInteractive -File $PSCommandPath -ChildProcess
    exit $LASTEXITCODE
}
$ErrorActionPreference='Stop'
$repo=Split-Path $PSScriptRoot -Parent
$fixtureSource=Join-Path $PSScriptRoot 'fixtures/M365Lab.ReadFixtures.psm1'
$fixtureRoot=Join-Path $repo ('local-output/_offline-fixtures/' + [guid]::NewGuid().ToString())
$fakeModuleRoot=Join-Path $fixtureRoot 'modules'
foreach ($spec in @(
    @{Name='Microsoft.Graph.Authentication';Version='2.40.0';Exports=@('Get-MgContext')},
    @{Name='Microsoft.Graph.Users';Version='2.40.0';Exports=@('Get-MgUserLicenseDetail')},
    @{Name='Microsoft.Graph.Groups';Version='2.40.0';Exports=@('Get-MgGroup','Get-MgGroupOwnerAsUser','Get-MgGroupMemberAsUser')},
    @{Name='ExchangeOnlineManagement';Version='3.11.1';Exports=@('Get-ConnectionInformation','Get-Mailbox','Get-EXOMailboxPermission','Get-EXORecipientPermission','Get-Recipient')}
)) {
    $directory=Join-Path $fakeModuleRoot "$($spec.Name)/$($spec.Version)"
    $null=New-Item -ItemType Directory -Path $directory -Force
    $rootModule="$($spec.Name).psm1"
    Copy-Item -LiteralPath $fixtureSource -Destination (Join-Path $directory $rootModule)
    New-ModuleManifest -Path (Join-Path $directory "$($spec.Name).psd1") -RootModule $rootModule -ModuleVersion $spec.Version -FunctionsToExport $spec.Exports -CmdletsToExport @() -AliasesToExport @() -Description 'OFFLINE TEST FIXTURE; never authenticate or call a network.'
}
$oldModulePath=$env:PSModulePath
$env:PSModulePath=$fakeModuleRoot + [IO.Path]::PathSeparator + $oldModulePath
$global:M365LabOfflineFixtureState=@{
    FixtureOnly=$true;Case='Baseline';Account='adm-lab@lab.example.invalid';ModuleInitializations=0
    TenantId='11111111-1111-4111-8111-111111111111'
    Calls=[System.Collections.Generic.List[object]]::new()
}

function Assert-Fixture {
    param([bool]$Condition,[string]$Message)
    if (-not $Condition) { throw $Message }
}
function Invoke-FixtureReport {
    param([string]$Script,[string]$Case,[hashtable]$Extra=@{},[string]$Outcome='COMPLETE',[int]$Rows=-1,[string]$ErrorCategory='')
    $global:M365LabOfflineFixtureState.Case=$Case
    $global:M365LabOfflineFixtureState.Calls.Clear()
    $arguments=@{ExpectedTenantId='11111111-1111-4111-8111-111111111111';ExpectedAccount='adm-lab@lab.example.invalid'}
    switch ($Script) {
        'License' { $file='Get-M365LabLicenseReport.ps1';$arguments.UserId=@('m365.marek@lab.example.invalid') }
        'Group' { $file='Get-M365LabGroupReport.ps1';$arguments.GroupName=@('BFL-M365-Finance') }
        'Mailbox' { $file='Get-M365LabMailboxPermissionReport.ps1';$arguments.MailboxIdentity=@('bfl-m365-helpdesk') }
    }
    foreach ($key in $Extra.Keys) { $arguments[$key]=$Extra[$key] }
    $summary=& (Join-Path $repo "scripts/$file") @arguments
    $code=$LASTEXITCODE
    Assert-Fixture ($null -ne $summary) "No summary: $Script / $Case"
    Assert-Fixture ($summary.Outcome -eq $Outcome) "Unexpected outcome $($summary.Outcome): $Script / $Case"
    $expectedCode=switch ($Outcome) { COMPLETE {0} PARTIAL {2} default {1} }
    Assert-Fixture ($code -eq $expectedCode -and $summary.ExitCode -eq $expectedCode) "Wrong exit code: $Script / $Case"
    $metadata=Get-Content -LiteralPath $summary.MetadataJson -Raw | ConvertFrom-Json
    $rowsData=@(Import-Csv -LiteralPath $summary.RowsCsv)
    $components=@(Import-Csv -LiteralPath $summary.ComponentsCsv)
    Assert-Fixture ($metadata.Outcome -eq $Outcome) 'Metadata outcome mismatch.'
    Assert-Fixture ($metadata.OutputHashes.RowsCsv -eq (Get-FileHash -LiteralPath $summary.RowsCsv).Hash) 'Export hash mismatch.'
    Assert-Fixture ($metadata.SourceHashes.EntryScript -eq (Get-FileHash -LiteralPath (Join-Path $repo "scripts/$file")).Hash) 'Source hash mismatch.'
    Assert-Fixture ($rowsData.Count -gt 0 -and $components.Count -gt 0) 'Missing explicit output rows.'
    $bytes=[IO.File]::ReadAllBytes($summary.RowsCsv)
    Assert-Fixture ($bytes[0] -eq 239 -and $bytes[1] -eq 187 -and $bytes[2] -eq 191) 'CSV should be UTF-8 with BOM.'
    if ($Rows -ge 0) { Assert-Fixture ($metadata.DataRows -eq $Rows) "Wrong data-row count: $Script / $Case" }
    if ($ErrorCategory) { Assert-Fixture (@($rowsData | Where-Object ErrorCategory -EQ $ErrorCategory).Count -gt 0) "Missing diagnostic $ErrorCategory : $Script / $Case" }
    [pscustomobject]@{Summary=$summary;Metadata=$metadata;Rows=$rowsData;Components=$components;Calls=@($global:M365LabOfflineFixtureState.Calls.ToArray())}
}

try {
    $count=0
    $r=Invoke-FixtureReport License Baseline -Rows 2
    Assert-Fixture (@($r.Rows | Where-Object ProvisioningStatus -EQ 'Disabled').Count -eq 1) 'Disabled service was lost or confused with a failed read.'
    Assert-Fixture ($r.Calls[0].All) 'License pagination flag was omitted.'
    $count++
    $r=Invoke-FixtureReport License EmptyLicense -Rows 0
    Assert-Fixture ($r.Rows[0].RecordType -eq 'EMPTY') 'Empty licenses must be explicit.'
    $count++
    $r=Invoke-FixtureReport License Baseline -Extra @{UserId=@('m365.marek@lab.example.invalid','not-present@lab.example.invalid')} -Outcome PARTIAL -Rows 2 -ErrorCategory NOT_FOUND_OR_NOT_VISIBLE
    Assert-Fixture (@($r.Rows | Where-Object HttpStatus -EQ '404').Count -eq 1) 'Missing HTTP 404 detail.'
    $count++
    $r=Invoke-FixtureReport License LicenseDenied -Outcome FAILED -Rows 0 -ErrorCategory ACCESS_DENIED
    Assert-Fixture ($r.Rows[0].HttpStatus -eq '403') 'Missing HTTP 403 detail.'
    $count++
    $null=Invoke-FixtureReport License PageFailure -Outcome FAILED -Rows 0 -ErrorCategory THROTTLED
    $count++
    foreach ($case in @('MissingScope','NoContext')) {
        $category=if ($case -eq 'MissingScope') {'SCOPE_MISSING'} else {'AUTH_REQUIRED'}
        $r=Invoke-FixtureReport License $case -Outcome FAILED -Rows 0 -ErrorCategory $category
        Assert-Fixture ($r.Calls.Count -eq 0) 'Preflight failure still queried a target.'
        $count++
    }
    foreach ($extra in @(@{ExpectedTenantId='99999999-9999-4999-8999-999999999999'},@{ExpectedAccount='other@lab.example.invalid'})) {
        $r=Invoke-FixtureReport License Baseline -Extra $extra -Outcome FAILED -Rows 0 -ErrorCategory CONTEXT_MISMATCH
        Assert-Fixture ($r.Calls.Count -eq 0) 'Mismatched context still queried a target.'
        $count++
    }
    $r=Invoke-FixtureReport License BroadScopes -Rows 2
    Assert-Fixture ($r.Metadata.AuthContext.WriteScopes -contains 'Directory.ReadWrite.All') 'Actual write scope was not recorded.'
    Assert-Fixture ($r.Metadata.Warnings.Count -gt 0) 'Broad-context warning missing.'
    $count++
    $r=Invoke-FixtureReport Group Baseline -Rows 4
    Assert-Fixture (@($r.Rows | Where-Object Relation -EQ 'Members').Count -eq 2) 'Wrong direct membership count.'
    Assert-Fixture (@($r.Calls | Where-Object { $_.Name -in @('Group','Owners','Members') -and -not $_.All }).Count -eq 0) 'Group pagination flag omitted.'
    $count++
    $r=Invoke-FixtureReport Group DuplicateGroup -Outcome FAILED -Rows 0 -ErrorCategory AMBIGUOUS_TARGET
    Assert-Fixture (@($r.Calls | Where-Object Name -IN @('Owners','Members')).Count -eq 0) 'Ambiguous group was chosen anyway.'
    $count++
    $null=Invoke-FixtureReport Group MembersDenied -Outcome PARTIAL -Rows 2 -ErrorCategory ACCESS_DENIED
    $count++
    $r=Invoke-FixtureReport Group LimitedIdentity -Outcome PARTIAL -Rows 4
    Assert-Fixture (@($r.Rows | Where-Object ReadStatus -EQ 'LIMITED').Count -eq 1) 'Limited directory information was reported complete.'
    $count++
    $r=Invoke-FixtureReport Group EmptyMembers -Rows 2
    Assert-Fixture (@($r.Rows | Where-Object { $_.Component -eq 'Members' -and $_.RecordType -eq 'EMPTY' }).Count -eq 1) 'Empty membership is not explicit.'
    $count++
    $r=Invoke-FixtureReport Group Baseline -Extra @{GroupName=@("O'Brien")}
    Assert-Fixture ($r.Calls[0].Target -eq "displayName eq 'O''Brien'") 'Literal group name was not escaped.'
    $count++
    $r=Invoke-FixtureReport Mailbox Baseline -Rows 7
    $self=@($r.Rows | Where-Object { $_.Component -eq 'FullAccess' -and $_.PrincipalRaw -eq 'NT AUTHORITY\SELF' })
    Assert-Fixture ($self.Count -eq 2 -and $self[0].SourceAccessRights -match 'ReadPermission') 'SELF rows/full source rights were lost.'
    Assert-Fixture (@($r.Calls | Where-Object { $_.Name -in @('FullAccess','SendAs') -and -not $_.All }).Count -eq 0) 'Exchange result limit was not explicit.'
    $count++
    $null=Invoke-FixtureReport Mailbox SendAsDenied -Outcome PARTIAL -Rows 5 -ErrorCategory ACCESS_DENIED
    $count++
    $null=Invoke-FixtureReport Mailbox MissingBehalfProperty -Outcome PARTIAL -Rows 6 -ErrorCategory INCOMPLETE_DATA
    $count++
    $r=Invoke-FixtureReport Mailbox UnresolvedDelegate -Outcome PARTIAL -Rows 7 -ErrorCategory ACCESS_DENIED
    Assert-Fixture (@($r.Rows | Where-Object IdentityStatus -EQ 'UNRESOLVED').Count -eq 2) 'Unresolved grant references were discarded.'
    $count++
    $r=Invoke-FixtureReport Mailbox EmptyBehalf -Rows 6
    Assert-Fixture (@($r.Rows | Where-Object { $_.Component -eq 'SendOnBehalf' -and $_.RecordType -eq 'EMPTY' }).Count -eq 1) 'Empty SendOnBehalf list not explicit.'
    $count++
    $r=Invoke-FixtureReport Mailbox DenyInherited -Rows 8
    Assert-Fixture (@($r.Rows | Where-Object { $_.Deny -eq 'True' -and $_.IsInherited -eq 'True' }).Count -eq 1) 'Deny/inherited ACL was lost.'
    $count++
    $r=Invoke-FixtureReport Mailbox WrongMailboxType -Outcome FAILED -Rows 0 -ErrorCategory UNSUPPORTED_TARGET
    Assert-Fixture (@($r.Calls | Where-Object Name -IN @('FullAccess','SendAs','ResolveRecipient')).Count -eq 0) 'Wrong mailbox type still queried delegates.'
    $count++
    $r=Invoke-FixtureReport Mailbox Baseline -Extra @{ExpectedTenantId='99999999-9999-4999-8999-999999999999'} -Outcome FAILED -Rows 0 -ErrorCategory CONTEXT_MISMATCH
    Assert-Fixture ($r.Calls.Count -eq 0) 'Wrong Exchange tenant still queried a mailbox.'
    $count++
    $beforeStarts=$global:M365LabOfflineFixtureState.ModuleInitializations
    $beforeAuthModule=(Get-Command Get-MgContext).Module
    $null=Invoke-FixtureReport License Baseline -Rows 2
    $null=Invoke-FixtureReport Group Baseline -Rows 4
    Assert-Fixture ($global:M365LabOfflineFixtureState.ModuleInitializations -eq $beforeStarts) 'Sequential reports reinitialized a loaded SDK module.'
    Assert-Fixture ([object]::ReferenceEquals($beforeAuthModule,(Get-Command Get-MgContext).Module)) 'Sequential reports replaced the existing authentication module instance.'
    $count++
    $result=[ordered]@{Kind='OFFLINE_FIXTURES_ONLY';Passed=$count;Failed=0;PowerShellVersion=$PSVersionTable.PSVersion.ToString();LiveTenantCalls=0;T24='NOT_EVALUATED';T25='NOT_EVALUATED'}
    $result | ConvertTo-Json | Set-Content -LiteralPath (Join-Path $fixtureRoot 'result.json') -Encoding utf8
    "PASS: $count offline report/export cases. No live tenant calls; no T24/T25 claim."
}
finally {
    $env:PSModulePath=$oldModulePath
    Remove-Variable M365LabOfflineFixtureState -Scope Global -ErrorAction SilentlyContinue
}
