#requires -Version 7.6
<#
.SYNOPSIS
Read licenses and every returned service plan for explicitly selected users.
.DESCRIPTION
Authenticate outside this script. Pass an independently confirmed tenant ID and
the expected signed-in UPN. Raw rows, component status and metadata go only to
the repository's ignored local-output directory. Exit codes: 0 complete, 2 partial, 1 failed.
#>
[CmdletBinding()]
param(
    [Parameter(Mandatory)][ValidateCount(1,50)][ValidateNotNullOrEmpty()][string[]]$UserId,
    [Parameter(Mandatory)][guid]$ExpectedTenantId,
    [Parameter(Mandatory)][ValidatePattern('^[^@\s]+@[^@\s]+$')][string]$ExpectedAccount,
    [version]$GraphModuleVersion='2.40.0'
)
Import-Module (Join-Path $PSScriptRoot 'M365Lab.Reporting.psm1') -ErrorAction Stop
$run=New-LabReportRun -Name 'licenses' -Targets $UserId -ExpectedTenantId $ExpectedTenantId -ExpectedAccount $ExpectedAccount -SourcePath $PSCommandPath -Coverage 'Selected users: all returned licenseDetails and service plans; no effective workload or direct-versus-group assignment-path audit.' -Fields @('UserId','LicenseDetailsId','SkuId','SkuPartNumber','ServicePlanId','ServicePlanName','ProvisioningStatus','AppliesTo')
try {
    Initialize-LabGraphRead $run -Modules @('Microsoft.Graph.Authentication','Microsoft.Graph.Users') -Version $GraphModuleVersion -RequiredScopes @('LicenseAssignment.Read.All')
    foreach ($target in $UserId) {
        try {
            if ([string]::IsNullOrWhiteSpace($target) -or [System.Management.Automation.WildcardPattern]::ContainsWildcardCharacters($target)) { throw '[UNSUPPORTED_TARGET] Supply a selected UPN or object ID, not a wildcard.' }
            $licenses=@(Get-MgUserLicenseDetail -UserId $target -All -ErrorAction Stop)
            $count=0; $limited=$false
            if ($licenses.Count -eq 0) { Add-LabRow $run $target 'LicenseDetails' -Kind EMPTY -Status EMPTY -Data @{UserId=$target} }
            foreach ($license in $licenses) {
                $plans=@($license.ServicePlans)
                if ([string]::IsNullOrWhiteSpace([string]$license.SkuPartNumber) -or $plans.Count -eq 0) {
                    $limited=$true; $count++
                    Add-LabRow $run $target 'LicenseDetails' -Status LIMITED -Data @{UserId=$target;LicenseDetailsId=$license.Id;SkuId=[string]$license.SkuId;SkuPartNumber=$license.SkuPartNumber}
                    continue
                }
                foreach ($plan in $plans) {
                    $rowLimited=[string]::IsNullOrWhiteSpace([string]$plan.ServicePlanName) -or [string]::IsNullOrWhiteSpace([string]$plan.ProvisioningStatus)
                    if ($rowLimited) { $limited=$true }
                    $count++
                    Add-LabRow $run $target 'LicenseDetails' -Status $(if ($rowLimited) {'LIMITED'} else {'READ'}) -Data @{
                        UserId=$target; LicenseDetailsId=$license.Id; SkuId=[string]$license.SkuId; SkuPartNumber=$license.SkuPartNumber
                        ServicePlanId=[string]$plan.ServicePlanId; ServicePlanName=$plan.ServicePlanName
                        ProvisioningStatus=$plan.ProvisioningStatus; AppliesTo=$plan.AppliesTo
                    }
                }
            }
            Add-LabComponent $run $target 'LicenseDetails' -Status $(if ($limited) {'PARTIAL'} else {'COMPLETE'}) -RowCount $count
        }
        catch { Add-LabReadFailure $run $target 'LicenseDetails' $_ }
    }
}
catch { Add-LabReadFailure $run '<context>' 'Preflight' $_ }
try { $summary=Save-LabReport $run; $summary; exit $summary.ExitCode }
catch { Write-Error -ErrorRecord $_ -ErrorAction Continue; exit 1 }
