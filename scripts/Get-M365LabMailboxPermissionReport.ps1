#requires -Version 7.6
<#
.SYNOPSIS
Read Full Access, Send As and Send on behalf for selected shared mailboxes.
.DESCRIPTION
Retains all returned FullAccess ACL entries, including SELF, duplicates, deny
and inheritance flags. Reads configured grants, not effective group-expanded
access, automapping, calendar ACLs or a new functional sending test.
#>
[CmdletBinding()]
param(
    [Parameter(Mandatory)][ValidateCount(1,50)][ValidateNotNullOrEmpty()][string[]]$MailboxIdentity,
    [Parameter(Mandatory)][guid]$ExpectedTenantId,
    [Parameter(Mandatory)][ValidatePattern('^[^@\s]+@[^@\s]+$')][string]$ExpectedAccount,
    [version]$ExchangeModuleVersion='3.11.1'
)
Import-Module (Join-Path $PSScriptRoot 'M365Lab.Reporting.psm1') -ErrorAction Stop
$run=New-LabReportRun -Name 'mailbox-permissions' -Targets $MailboxIdentity -ExpectedTenantId $ExpectedTenantId -ExpectedAccount $ExpectedAccount -SourcePath $PSCommandPath -Coverage 'Selected shared mailboxes: returned FullAccess and SendAs ACLs plus GrantSendOnBehalfTo and referenced-recipient resolution. No effective/group-expanded permissions or new mail-flow test.' -Fields @('MailboxAlias','MailboxAddress','MailboxType','Permission','SourceIndex','PrincipalRaw','ResolvedDisplayName','ResolvedSmtpAddress','IdentityStatus','SourceAccessRights','AccessControlType','Deny','IsInherited')

function Resolve-LabDelegate {
    param([string]$Reference)
    if ($Reference -in @('NT AUTHORITY\SELF','S-1-5-10')) {
        return @{ ResolvedDisplayName='NT AUTHORITY\SELF';ResolvedSmtpAddress='';IdentityStatus='SYSTEM_SELF';ErrorInfo=$null }
    }
    try {
        $recipients=@(Get-Recipient -Identity $Reference -ErrorAction Stop)
        if ($recipients.Count -ne 1 -or [string]::IsNullOrWhiteSpace([string]$recipients[0].PrimarySmtpAddress)) { throw '[INCOMPLETE_DATA] Delegate could not be uniquely resolved.' }
        return @{ResolvedDisplayName=[string]$recipients[0].DisplayName;ResolvedSmtpAddress=[string]$recipients[0].PrimarySmtpAddress;IdentityStatus='RESOLVED';ErrorInfo=$null}
    }
    catch {
        return @{ResolvedDisplayName='';ResolvedSmtpAddress='';IdentityStatus='UNRESOLVED';ErrorInfo=(Get-LabErrorInfo $_)}
    }
}

try {
    Initialize-LabExchangeRead $run -Version $ExchangeModuleVersion
    foreach ($target in $MailboxIdentity) {
        try {
            if ([string]::IsNullOrWhiteSpace($target) -or [System.Management.Automation.WildcardPattern]::ContainsWildcardCharacters($target)) { throw '[UNSUPPORTED_TARGET] Supply one exact mailbox identity, not a wildcard.' }
            $mailboxes=@(Get-Mailbox -Identity $target -ErrorAction Stop)
            if ($mailboxes.Count -eq 0) { throw '[NOT_FOUND_OR_NOT_VISIBLE] No visible mailbox matches the selected identity.' }
            if ($mailboxes.Count -ne 1) { throw '[AMBIGUOUS_TARGET] Mailbox identity is not unique.' }
            $mailbox=$mailboxes[0]
            if ($mailbox.RecipientTypeDetails -ne 'SharedMailbox') { throw '[UNSUPPORTED_TARGET] This report is restricted to shared mailboxes.' }
            if ([string]::IsNullOrWhiteSpace([string]$mailbox.PrimarySmtpAddress)) { throw '[INCOMPLETE_DATA] Shared mailbox address is missing.' }
            $base=@{MailboxAlias=$mailbox.Alias;MailboxAddress=[string]$mailbox.PrimarySmtpAddress;MailboxType=[string]$mailbox.RecipientTypeDetails}
            Add-LabComponent $run $target 'Mailbox' -Status COMPLETE -RowCount 0
        }
        catch {
            Add-LabReadFailure $run $target 'Mailbox' $_
            foreach ($part in @('FullAccess','SendAs','SendOnBehalf')) { Add-LabComponent $run $target $part -Status NOT_RUN }
            continue
        }
        foreach ($part in @('FullAccess','SendAs','SendOnBehalf')) {
            try {
                $data=@(); $limited=$false; $index=0
                if ($part -eq 'FullAccess') {
                    $acl=@(Get-EXOMailboxPermission -Identity ([string]$mailbox.PrimarySmtpAddress) -ResultSize Unlimited -ErrorAction Stop)
                    foreach ($entry in $acl) {
                        if (-not $entry.PSObject.Properties['AccessRights']) { throw '[INCOMPLETE_DATA] Mailbox ACL AccessRights is missing.' }
                    }
                    $data=@($acl | Where-Object { $_.AccessRights -contains 'FullAccess' })
                }
                elseif ($part -eq 'SendAs') {
                    $data=@(Get-EXORecipientPermission -Identity ([string]$mailbox.PrimarySmtpAddress) -AccessRights SendAs -ResultSize Unlimited -ErrorAction Stop)
                }
                else {
                    if (-not $mailbox.PSObject.Properties['GrantSendOnBehalfTo']) { throw '[INCOMPLETE_DATA] GrantSendOnBehalfTo is absent; an empty grant list cannot be confirmed.' }
                    $data=@($mailbox.GrantSendOnBehalfTo | Where-Object { $null -ne $_ })
                }
                if ($data.Count -eq 0) { Add-LabRow $run $target $part -Kind EMPTY -Status EMPTY -Data ($base + @{Permission=$part}) }
                foreach ($entry in $data) {
                    $index++
                    $flagsLimited=$false
                    if ($part -eq 'FullAccess') {
                        $principal=[string]$entry.User
                        $rights=@($entry.AccessRights) -join ';'
                        $deny=Get-LabField $entry 'Deny'; $inherited=Get-LabField $entry 'IsInherited'
                        if ($null -eq $deny -or $null -eq $inherited) { $flagsLimited=$true }
                        $control=if ($null -eq $deny) {'NOT_RETURNED'} elseif ($deny -eq $true) {'Deny'} else {'Allow'}
                    }
                    elseif ($part -eq 'SendAs') {
                        $principal=[string]$entry.Trustee
                        $rights=@($entry.AccessRights) -join ';'
                        $control=[string]$entry.AccessControlType
                        $inherited=Get-LabField $entry 'IsInherited'; $deny='NOT_APPLICABLE'
                        if ([string]::IsNullOrWhiteSpace($control) -or $entry.AccessRights -notcontains 'SendAs') { $flagsLimited=$true }
                    }
                    else {
                        $principal=[string]$entry; $rights='GrantSendOnBehalfTo'; $control='Grant'
                        $deny='NOT_APPLICABLE'; $inherited='NOT_APPLICABLE'
                    }
                    $identity=if ([string]::IsNullOrWhiteSpace($principal)) {
                        @{ResolvedDisplayName='';ResolvedSmtpAddress='';IdentityStatus='UNRESOLVED';ErrorInfo=[pscustomobject]@{Category='INCOMPLETE_DATA';HttpStatus='';Message='Permission record omitted the principal identity.'}}
                    } else { Resolve-LabDelegate $principal }
                    $rowLimited=$flagsLimited -or $identity.IdentityStatus -eq 'UNRESOLVED'
                    if ($rowLimited) { $limited=$true }
                    $rowError=$identity.ErrorInfo
                    $identity.Remove('ErrorInfo')
                    if ($flagsLimited -and -not $rowError) {
                        $rowError=[pscustomobject]@{Category='INCOMPLETE_DATA';HttpStatus='';Message='Required ACL flags or access-right fields were not returned.'}
                    }
                    $payload=$base + $identity + @{
                        Permission=$part;SourceIndex=$index;PrincipalRaw=$principal;SourceAccessRights=$rights
                        AccessControlType=$control;Deny=if ($null -eq $deny) {'NOT_RETURNED'} else {[string]$deny}
                        IsInherited=if ($null -eq $inherited) {'NOT_RETURNED'} else {[string]$inherited}
                    }
                    Add-LabRow $run $target $part -Status $(if ($rowLimited) {'LIMITED'} else {'READ'}) -Data $payload -ErrorInfo $rowError
                }
                Add-LabComponent $run $target $part -Status $(if ($limited) {'PARTIAL'} else {'COMPLETE'}) -RowCount $data.Count
            }
            catch { Add-LabReadFailure $run $target $part $_ }
        }
    }
}
catch { Add-LabReadFailure $run '<context>' 'Preflight' $_ }
try { $summary=Save-LabReport $run; $summary; exit $summary.ExitCode }
catch { Write-Error -ErrorRecord $_ -ErrorAction Continue; exit 1 }
