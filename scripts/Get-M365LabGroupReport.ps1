#requires -Version 7.6
<#
.SYNOPSIS
Read selected Microsoft 365 groups, human owners and direct human members.
.DESCRIPTION
This deliberately reports user identities, not service principals, nested groups
or effective SharePoint/Teams file access. Graph v1.0 also has documented
service-principal relationship limitations. Authenticate outside the report.
#>
[CmdletBinding()]
param(
    [Parameter(Mandatory)][ValidateCount(1,50)][ValidateNotNullOrEmpty()][string[]]$GroupName,
    [Parameter(Mandatory)][guid]$ExpectedTenantId,
    [Parameter(Mandatory)][ValidatePattern('^[^@\s]+@[^@\s]+$')][string]$ExpectedAccount,
    [version]$GraphModuleVersion='2.40.0'
)
Import-Module (Join-Path $PSScriptRoot 'M365Lab.Reporting.psm1') -ErrorAction Stop
$run=New-LabReportRun -Name 'groups' -Targets $GroupName -ExpectedTenantId $ExpectedTenantId -ExpectedAccount $ExpectedAccount -SourcePath $PSCommandPath -Coverage 'Selected Microsoft 365 groups: group properties, human owners and direct human members only. No recursive membership, non-user-principal or effective resource-access audit.' -Fields @('GroupId','GroupDisplayName','Visibility','Relation','MemberId','DisplayName','UserPrincipalName')
$run.Warnings.Add('Human-only relationship coverage; COMPLETE does not establish absence of service principals or other non-user identities.')
try {
    Initialize-LabGraphRead $run -Modules @('Microsoft.Graph.Authentication','Microsoft.Graph.Groups') -Version $GraphModuleVersion -RequiredScopes @('GroupMember.Read.All','User.ReadBasic.All')
    foreach ($target in $GroupName) {
        try {
            if ([string]::IsNullOrWhiteSpace($target)) { throw '[UNSUPPORTED_TARGET] Supply an explicit group name.' }
            $escaped=$target.Replace("'", "''")
            $groups=@(Get-MgGroup -Filter "displayName eq '$escaped'" -Property Id,DisplayName,GroupTypes,Visibility -All -ErrorAction Stop)
            if ($groups.Count -eq 0) { throw '[NOT_FOUND_OR_NOT_VISIBLE] No visible group matches the selected name.' }
            if ($groups.Count -ne 1) { throw '[AMBIGUOUS_TARGET] Multiple groups match; the report will not choose the first one.' }
            $group=$groups[0]
            if ($group.GroupTypes -notcontains 'Unified') { throw '[UNSUPPORTED_TARGET] The selected object is not a Microsoft 365 group.' }
            if ([string]::IsNullOrWhiteSpace([string]$group.Id)) { throw '[INCOMPLETE_DATA] Group ID is missing.' }
            Add-LabRow $run $target 'Group' -Data @{GroupId=$group.Id;GroupDisplayName=$group.DisplayName;Visibility=$group.Visibility}
            Add-LabComponent $run $target 'Group' -Status COMPLETE -RowCount 1
        }
        catch {
            Add-LabReadFailure $run $target 'Group' $_
            Add-LabComponent $run $target 'Owners' -Status NOT_RUN
            Add-LabComponent $run $target 'Members' -Status NOT_RUN
            continue
        }
        foreach ($relation in @('Owners','Members')) {
            try {
                if ($relation -eq 'Owners') {
                    $users=@(Get-MgGroupOwnerAsUser -GroupId $group.Id -Property Id,DisplayName,UserPrincipalName -All -ConsistencyLevel eventual -CountVariable labOwnersCount -ErrorAction Stop)
                }
                else {
                    $users=@(Get-MgGroupMemberAsUser -GroupId $group.Id -Property Id,DisplayName,UserPrincipalName -All -ConsistencyLevel eventual -CountVariable labMembersCount -ErrorAction Stop)
                }
                $limited=$false
                if ($users.Count -eq 0) {
                    Add-LabRow $run $target $relation -Kind EMPTY -Status EMPTY -Data @{GroupId=$group.Id;GroupDisplayName=$group.DisplayName;Visibility=$group.Visibility;Relation=$relation}
                }
                foreach ($user in $users) {
                    $rowLimited=[string]::IsNullOrWhiteSpace([string]$user.Id) -or [string]::IsNullOrWhiteSpace([string]$user.DisplayName) -or [string]::IsNullOrWhiteSpace([string]$user.UserPrincipalName)
                    if ($rowLimited) { $limited=$true }
                    Add-LabRow $run $target $relation -Status $(if ($rowLimited) {'LIMITED'} else {'READ'}) -Data @{
                        GroupId=$group.Id;GroupDisplayName=$group.DisplayName;Visibility=$group.Visibility
                        Relation=$relation;MemberId=$user.Id;DisplayName=$user.DisplayName;UserPrincipalName=$user.UserPrincipalName
                    }
                }
                Add-LabComponent $run $target $relation -Status $(if ($limited) {'PARTIAL'} else {'COMPLETE'}) -RowCount $users.Count
            }
            catch { Add-LabReadFailure $run $target $relation $_ }
        }
    }
}
catch { Add-LabReadFailure $run '<context>' 'Preflight' $_ }
try { $summary=Save-LabReport $run; $summary; exit $summary.ExitCode }
catch { Write-Error -ErrorRecord $_ -ErrorAction Continue; exit 1 }
