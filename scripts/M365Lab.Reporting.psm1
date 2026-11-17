#requires -Version 7.6
Set-StrictMode -Version Latest
$script:LabCommonSourcePath = $PSCommandPath
$script:LabCommonLoadedHash = (Get-FileHash -LiteralPath $PSCommandPath -Algorithm SHA256).Hash

function Get-LabField {
    param([AllowNull()][object]$Object, [string]$Name)
    if ($null -eq $Object) { return $null }
    if ($Object -is [System.Collections.IDictionary]) { return $Object[$Name] }
    $property = $Object.PSObject.Properties[$Name]
    if ($property) { return $property.Value }
    return $null
}

function New-LabReportRun {
    param([string]$Name, [string[]]$Targets, [guid]$ExpectedTenantId,
          [string]$ExpectedAccount, [string[]]$Fields, [string]$SourcePath,
          [string]$Coverage)
    $id = [guid]::NewGuid().ToString()
    $root = Split-Path $PSScriptRoot -Parent
    [pscustomobject]@{
        Name=$Name; RunId=$id; StartedUtc=[datetime]::UtcNow.ToString('o')
        Targets=@($Targets); ExpectedTenantId=$ExpectedTenantId.ToString()
        ExpectedAccount=$ExpectedAccount; Coverage=$Coverage; Fields=@($Fields)
        SourcePath=$SourcePath; EntrySourceHash=(Get-FileHash -LiteralPath $SourcePath -Algorithm SHA256).Hash; Auth=$null
        Rows=[System.Collections.Generic.List[object]]::new()
        Components=[System.Collections.Generic.List[object]]::new()
        Warnings=[System.Collections.Generic.List[string]]::new()
        Directory=(Join-Path $root "local-output/$Name/$([datetime]::UtcNow.ToString('yyyyMMddTHHmmssfffZ'))-$($id.Substring(0,8))")
    }
}

function Get-LabErrorInfo {
    param([System.Management.Automation.ErrorRecord]$Record)
    $message = $Record.Exception.Message
    $http = $null
    $candidates = @(
        (Get-LabField $Record.Exception 'ResponseStatusCode')
        (Get-LabField $Record.Exception 'StatusCode')
        (Get-LabField (Get-LabField $Record.Exception 'Response') 'StatusCode')
    )
    foreach ($candidate in $candidates) {
        if ($null -ne $candidate) {
            try { $number=[int]$candidate; if ($number -ge 100 -and $number -le 599) { $http=$number; break } } catch { }
        }
    }
    $detail = [string](Get-LabField (Get-LabField $Record 'ErrorDetails') 'Message')
    $all = "$message $detail $($Record.FullyQualifiedErrorId) $($Record.Exception.GetType().Name)"
    $category = 'REMOTE_OR_LOCAL_ERROR'
    if ($all -match '\[(AUTH_REQUIRED|CONTEXT_MISMATCH|CONTEXT_AMBIGUOUS|SCOPE_MISSING|AMBIGUOUS_TARGET|NOT_FOUND_OR_NOT_VISIBLE|UNSUPPORTED_TARGET|INCOMPLETE_DATA|DEPENDENCY_MISSING)\]') {
        $category=$Matches[1]
    }
    elseif ($http -eq 403 -or $all -match 'Authorization_RequestDenied|AccessDenied|Access.Denied|UnauthorizedAccess|Insufficient.privileges|\b403\b') { $category='ACCESS_DENIED' }
    elseif ($http -eq 404 -or $all -match 'Request_ResourceNotFound|ManagementObjectNotFound|\b404\b') { $category='NOT_FOUND_OR_NOT_VISIBLE' }
    elseif ($http -eq 401 -or $all -match 'InvalidAuthenticationToken|\b401\b') { $category='AUTH_REQUIRED' }
    elseif ($http -eq 429 -or $all -match 'TooManyRequests|\b429\b') { $category='THROTTLED' }
    elseif ($all -match 'ManagementObjectAmbiguous') { $category='AMBIGUOUS_TARGET' }
    elseif ($all -match 'CouldNotAutoloadMatchingModule|Modules_ModuleNotFound|Modules_ModuleWithVersionNotFound|CommandNotFoundException') { $category='DEPENDENCY_MISSING' }
    [pscustomobject]@{ Category=$category; HttpStatus=$http; Message=$message }
}

function Add-LabRow {
    param($Run, [string]$Target, [string]$Component,
          [ValidateSet('DATA','EMPTY','ERROR')][string]$Kind='DATA',
          [ValidateSet('READ','LIMITED','EMPTY','ERROR')][string]$Status='READ',
          [hashtable]$Data=@{}, $ErrorInfo=$null)
    $row=[ordered]@{
        RunId=$Run.RunId; Target=$Target; Component=$Component
        RecordType=$Kind; ReadStatus=$Status; ErrorCategory=''; HttpStatus=''; ErrorMessage=''
    }
    foreach ($field in $Run.Fields) { $row[$field]='' }
    foreach ($key in $Data.Keys) {
        if ($key -notin $Run.Fields) { throw "Unknown report field: $key" }
        $row[$key]=$Data[$key]
    }
    if ($ErrorInfo) {
        $row.ErrorCategory=$ErrorInfo.Category
        $row.HttpStatus=$ErrorInfo.HttpStatus
        $row.ErrorMessage=$ErrorInfo.Message
    }
    $Run.Rows.Add([pscustomobject]$row)
}

function Add-LabComponent {
    param($Run, [string]$Target, [string]$Component,
          [ValidateSet('COMPLETE','PARTIAL','FAILED','NOT_RUN')][string]$Status,
          [int]$RowCount=0, $ErrorInfo=$null)
    $Run.Components.Add([pscustomobject]@{
        RunId=$Run.RunId; Target=$Target; Component=$Component; Status=$Status
        DataRows=$RowCount
        ErrorCategory=if ($ErrorInfo) { $ErrorInfo.Category } else { '' }
        HttpStatus=if ($ErrorInfo) { $ErrorInfo.HttpStatus } else { '' }
        ErrorMessage=if ($ErrorInfo) { $ErrorInfo.Message } else { '' }
    })
}

function Add-LabReadFailure {
    param($Run, [string]$Target, [string]$Component, [System.Management.Automation.ErrorRecord]$Record)
    $info=Get-LabErrorInfo $Record
    Add-LabRow $Run $Target $Component -Kind ERROR -Status ERROR -ErrorInfo $info
    Add-LabComponent $Run $Target $Component -Status FAILED -ErrorInfo $info
}

function Assert-LabExpectedContext {
    param($Run, [string]$Account, [string]$TenantId)
    if ([string]::IsNullOrWhiteSpace($Account) -or [string]::IsNullOrWhiteSpace($TenantId)) {
        throw '[AUTH_REQUIRED] No usable tenant/account context; authenticate interactively first.'
    }
    if ($Account -ine $Run.ExpectedAccount -or $TenantId -ine $Run.ExpectedTenantId) {
        throw '[CONTEXT_MISMATCH] Actual account or tenant differs from the explicitly supplied expected context.'
    }
}

function Get-LabModuleVersions {
    param([string[]]$Names)
    @(
        foreach ($name in $Names) {
            foreach ($module in @(Get-Module -Name $name)) {
                [pscustomobject]@{ Name=$module.Name; Version=$module.Version.ToString() }
            }
        }
    )
}

function Import-LabSdkModule {
    param([string]$Name, [version]$Version)
    $loaded=@(Get-Module -Name $Name -All)
    if (@($loaded | Where-Object Version -EQ $Version).Count -gt 0) { return }
    if ($loaded.Count -gt 0) {
        throw "[DEPENDENCY_MISSING] A different $Name version is already loaded. Use a fresh PowerShell window with version $Version."
    }
    Import-Module $Name -RequiredVersion $Version -Global -ErrorAction Stop
}

function Initialize-LabGraphRead {
    param($Run, [string[]]$Modules, [version]$Version, [string[]]$RequiredScopes)
    foreach ($module in $Modules) { Import-LabSdkModule -Name $module -Version $Version }
    $context=Get-MgContext -ErrorAction Stop
    if (-not $context) { throw '[AUTH_REQUIRED] No Graph session; run Connect-MgGraph outside the report.' }
    $scopes=@(Get-LabField $context 'Scopes')
    $Run.Auth=[ordered]@{
        Service='Microsoft Graph'; Account=[string]$context.Account; TenantId=[string]$context.TenantId
        AuthType=[string]$context.AuthType; ContextScope=[string]$context.ContextScope
        ClientId=[string](Get-LabField $context 'ClientId')
        Environment=[string](Get-LabField $context 'Environment')
        ActualScopes=$scopes; RequiredReadScopes=@($RequiredScopes)
        WriteScopes=@($scopes | Where-Object { $_ -match 'ReadWrite|(^|\.)Write(\.|$)' })
        Modules=@(Get-LabModuleVersions $Modules)
    }
    Assert-LabExpectedContext $Run $context.Account $context.TenantId
    if ($context.AuthType -ne 'Delegated') { throw '[AUTH_REQUIRED] This report requires delegated user authentication.' }
    foreach ($scope in $RequiredScopes) {
        if ($scopes -notcontains $scope) { throw "[SCOPE_MISSING] Missing required delegated read scope: $scope" }
    }
    if ($Run.Auth.WriteScopes.Count -gt 0) {
        $warning='Actual Graph context includes write scopes. This report calls read APIs only; the context is not evidence of least-privilege authorization.'
        $Run.Warnings.Add($warning)
        Write-Warning $warning
    }
}

function Initialize-LabExchangeRead {
    param($Run, [version]$Version)
    Import-LabSdkModule -Name ExchangeOnlineManagement -Version $Version
    $connections=@(Get-ConnectionInformation -ErrorAction Stop | Where-Object {
        $_.State -eq 'Connected' -and $_.IsEopSession -eq $false
    })
    if ($connections.Count -ne 1) { throw '[CONTEXT_AMBIGUOUS] Use one connected Exchange Online session in this PowerShell process.' }
    $connection=$connections[0]
    $Run.Auth=[ordered]@{
        Service='Exchange Online'; Account=[string]$connection.UserPrincipalName
        TenantId=[string]$connection.TenantID; State=[string]$connection.State
        TokenStatus=[string]$connection.TokenStatus
        CertificateAuthentication=$connection.CertificateAuthentication
        ConnectionUri=[string]$connection.ConnectionUri
        ConnectionId=[string]$connection.ConnectionId
        ModulePrefix=[string]$connection.ModulePrefix
        Modules=@(Get-LabModuleVersions @('ExchangeOnlineManagement'))
        Authorization='Exchange RBAC; effective role assignments are not audited by this report.'
    }
    Assert-LabExpectedContext $Run $connection.UserPrincipalName $connection.TenantID
    if ($connection.CertificateAuthentication -eq $true) { throw '[AUTH_REQUIRED] This report expects a delegated user connection.' }
    if (-not [string]::IsNullOrWhiteSpace([string]$connection.ModulePrefix)) {
        throw '[UNSUPPORTED_TARGET] Use an unprefixed Exchange connection for these report command names.'
    }
}

function Save-LabReport {
    param($Run)
    if ($Run.Components.Count -eq 0 -or $Run.Rows.Count -eq 0) { throw 'Report implementation produced no explicit result; refusing a success export.' }
    $incomplete=@($Run.Components | Where-Object Status -NE 'COMPLETE')
    $usable=@($Run.Components | Where-Object { $_.Status -in @('COMPLETE','PARTIAL') })
    $outcome=if ($incomplete.Count -eq 0) { 'COMPLETE' } elseif ($usable.Count -gt 0) { 'PARTIAL' } else { 'FAILED' }
    $exitCode=switch ($outcome) { COMPLETE { 0 } PARTIAL { 2 } default { 1 } }
    $null=New-Item -ItemType Directory -Path $Run.Directory -Force -ErrorAction Stop
    $rowsPath=Join-Path $Run.Directory 'rows.csv'
    $componentsPath=Join-Path $Run.Directory 'components.csv'
    $metadataPath=Join-Path $Run.Directory 'metadata.json'
    $Run.Rows.ToArray() | Export-Csv -LiteralPath $rowsPath -Encoding utf8BOM -ErrorAction Stop
    $Run.Components.ToArray() | Export-Csv -LiteralPath $componentsPath -Encoding utf8BOM -ErrorAction Stop
    $metadata=[ordered]@{
        SchemaVersion='1.0'; Report=$Run.Name; RunId=$Run.RunId
        StartedUtc=$Run.StartedUtc; CompletedUtc=[datetime]::UtcNow.ToString('o')
        PowerShellVersion=$PSVersionTable.PSVersion.ToString(); PSEdition=$PSVersionTable.PSEdition
        ExpectedContext=@{ Account=$Run.ExpectedAccount; TenantId=$Run.ExpectedTenantId }
        AuthContext=$Run.Auth; Targets=$Run.Targets; Coverage=$Run.Coverage
        Warnings=@($Run.Warnings.ToArray()); Outcome=$outcome; ExitCode=$exitCode
        DataRows=@($Run.Rows | Where-Object RecordType -EQ 'DATA').Count
        Components=@($Run.Components.ToArray())
        SourceHashes=@{
            EntryScript=$Run.EntrySourceHash
            CommonModule=$script:LabCommonLoadedHash
        }
        OutputHashes=@{
            RowsCsv=(Get-FileHash -LiteralPath $rowsPath -Algorithm SHA256).Hash
            ComponentsCsv=(Get-FileHash -LiteralPath $componentsPath -Algorithm SHA256).Hash
        }
        Limitations=@('A successful read is not a functional entitlement/delegation test.',
            'Raw output contains private identifiers and must not be published.',
            'COMPLETE applies only to the declared targets and coverage, not a tenant-wide audit.')
    }
    $metadata | ConvertTo-Json -Depth 20 | Set-Content -LiteralPath $metadataPath -Encoding utf8 -ErrorAction Stop
    [pscustomobject]@{
        Report=$Run.Name; Outcome=$outcome; ExitCode=$exitCode
        DataRows=$metadata.DataRows; OutputDirectory=$Run.Directory
        RowsCsv=$rowsPath; ComponentsCsv=$componentsPath; MetadataJson=$metadataPath
    }
}

Export-ModuleMember -Function Get-LabField,New-LabReportRun,Get-LabErrorInfo,Add-LabRow,Add-LabComponent,Add-LabReadFailure,Initialize-LabGraphRead,Initialize-LabExchangeRead,Save-LabReport
