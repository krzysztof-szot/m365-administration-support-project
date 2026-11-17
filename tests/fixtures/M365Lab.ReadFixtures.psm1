# Offline-only SDK replacements, loaded in a separate test process.
if (Get-Variable -Name M365LabOfflineFixtureState -Scope Global -ErrorAction SilentlyContinue) {
    $global:M365LabOfflineFixtureState.ModuleInitializations++
}
function Register-FixtureRead {
    param([string]$Name,[string]$Target,[bool]$All=$false)
    if (-not $global:M365LabOfflineFixtureState.FixtureOnly) { throw 'Offline fixture state is required.' }
    $global:M365LabOfflineFixtureState.Calls.Add([pscustomobject]@{Name=$Name;Target=$Target;All=$All})
}
function Stop-FixtureHttp {
    param([int]$Status)
    throw [System.Net.Http.HttpRequestException]::new("SIMULATED HTTP $Status",$null,[System.Net.HttpStatusCode]$Status)
}
function Get-MgContext {
    [CmdletBinding()]param()
    $s=$global:M365LabOfflineFixtureState
    if ($s.Case -eq 'NoContext') { return }
    [pscustomobject]@{
        Account=$s.Account;TenantId=$s.TenantId;AuthType='Delegated';ContextScope='Process'
        ClientId='offline-fixture-client';Environment='OFFLINE_FIXTURE_ONLY'
        Scopes=if ($s.Case -eq 'MissingScope') {@('User.Read')} elseif ($s.Case -eq 'BroadScopes') {@('LicenseAssignment.Read.All','GroupMember.Read.All','User.ReadBasic.All','Directory.ReadWrite.All')} else {@('LicenseAssignment.Read.All','GroupMember.Read.All','User.ReadBasic.All')}
    }
}
function Get-MgUserLicenseDetail {
    [CmdletBinding()]param([string]$UserId,[switch]$All)
    Register-FixtureRead 'License' $UserId ([bool]$All)
    $s=$global:M365LabOfflineFixtureState
    if ($UserId -match 'not-present') { Stop-FixtureHttp 404 }
    if ($s.Case -eq 'LicenseDenied') { Stop-FixtureHttp 403 }
    if ($s.Case -eq 'EmptyLicense') { return }
    [pscustomobject]@{
        Id='offline-license';SkuId='55555555-5555-4555-8555-555555555555';SkuPartNumber='SPB'
        ServicePlans=@(
            [pscustomobject]@{ServicePlanId='66666666-6666-4666-8666-666666666666';ServicePlanName='EXCHANGE_S_STANDARD';ProvisioningStatus='Success';AppliesTo='User'}
            [pscustomobject]@{ServicePlanId='77777777-7777-4777-8777-777777777777';ServicePlanName='OFFICE_BUSINESS';ProvisioningStatus='Disabled';AppliesTo='User'}
        )
    }
    if ($s.Case -eq 'PageFailure') { Stop-FixtureHttp 429 }
}
function Get-MgGroup {
    [CmdletBinding()]param([string]$Filter,[string[]]$Property,[switch]$All)
    Register-FixtureRead 'Group' $Filter ([bool]$All)
    $name=$Filter.Substring(16,$Filter.Length-17).Replace("''", "'")
    $group=[pscustomobject]@{Id='22222222-2222-4222-8222-222222222222';DisplayName=$name;GroupTypes=@('Unified');Visibility='Private'}
    $group
    if ($global:M365LabOfflineFixtureState.Case -eq 'DuplicateGroup') { $group }
}
function Get-MgGroupOwnerAsUser {
    [CmdletBinding()]param([string]$GroupId,[string[]]$Property,[switch]$All,[string]$ConsistencyLevel,[string]$CountVariable)
    Register-FixtureRead 'Owners' $GroupId ([bool]$All)
    [pscustomobject]@{
        Id='33333333-3333-4333-8333-333333333333';DisplayName='M365 Anna Finance'
        UserPrincipalName=if ($global:M365LabOfflineFixtureState.Case -eq 'LimitedIdentity') {$null} else {'m365.anna@lab.example.invalid'}
    }
}
function Get-MgGroupMemberAsUser {
    [CmdletBinding()]param([string]$GroupId,[string[]]$Property,[switch]$All,[string]$ConsistencyLevel,[string]$CountVariable)
    Register-FixtureRead 'Members' $GroupId ([bool]$All)
    if ($global:M365LabOfflineFixtureState.Case -eq 'MembersDenied') { Stop-FixtureHttp 403 }
    if ($global:M365LabOfflineFixtureState.Case -eq 'EmptyMembers') { return }
    [pscustomobject]@{Id='33333333-3333-4333-8333-333333333333';DisplayName='M365 Anna Finance';UserPrincipalName='m365.anna@lab.example.invalid'}
    [pscustomobject]@{Id='44444444-4444-4444-8444-444444444444';DisplayName='M365 Piotr Operations';UserPrincipalName='m365.piotr@lab.example.invalid'}
}
function Get-ConnectionInformation {
    [CmdletBinding()]param()
    $s=$global:M365LabOfflineFixtureState
    [pscustomobject]@{
        State='Connected';TokenStatus='Active';IsEopSession=$false
        UserPrincipalName=$s.Account;TenantID=$s.TenantId;CertificateAuthentication=$false
        ConnectionUri='https://outlook.office365.com';ConnectionId='offline-connection';ModulePrefix=''
    }
}
function Get-Mailbox {
    [CmdletBinding()]param([string]$Identity)
    Register-FixtureRead 'Mailbox' $Identity
    $p=@{
        Alias='bfl-m365-helpdesk';PrimarySmtpAddress='bfl-m365-helpdesk@lab.example.invalid'
        RecipientTypeDetails=if ($global:M365LabOfflineFixtureState.Case -eq 'WrongMailboxType') {'UserMailbox'} else {'SharedMailbox'}
    }
    if ($global:M365LabOfflineFixtureState.Case -ne 'MissingBehalfProperty') {
        $p.GrantSendOnBehalfTo=if ($global:M365LabOfflineFixtureState.Case -eq 'EmptyBehalf') {@()} else {@('m365.anna@lab.example.invalid')}
    }
    [pscustomobject]$p
}
function Get-EXOMailboxPermission {
    [CmdletBinding()]param([string]$Identity,[string]$ResultSize)
    Register-FixtureRead 'FullAccess' $Identity ($ResultSize -eq 'Unlimited')
    [pscustomobject]@{User='NT AUTHORITY\SELF';AccessRights=@('FullAccess','ReadPermission');Deny=$false;IsInherited=$false}
    [pscustomobject]@{User='NT AUTHORITY\SELF';AccessRights=@('FullAccess');Deny=$false;IsInherited=$false}
    [pscustomobject]@{User='m365.anna@lab.example.invalid';AccessRights=@('FullAccess');Deny=$false;IsInherited=$false}
    [pscustomobject]@{User='m365.piotr@lab.example.invalid';AccessRights=@('FullAccess');Deny=$false;IsInherited=$false}
    if ($global:M365LabOfflineFixtureState.Case -eq 'DenyInherited') {
        [pscustomobject]@{User='test-deny@lab.example.invalid';AccessRights=@('FullAccess');Deny=$true;IsInherited=$true}
    }
}
function Get-EXORecipientPermission {
    [CmdletBinding()]param([string]$Identity,[string]$AccessRights,[string]$ResultSize)
    Register-FixtureRead 'SendAs' $Identity ($ResultSize -eq 'Unlimited')
    if ($global:M365LabOfflineFixtureState.Case -eq 'SendAsDenied') { Stop-FixtureHttp 403 }
    [pscustomobject]@{Trustee='NT AUTHORITY\SELF';AccessRights=@('SendAs');AccessControlType='Allow';IsInherited=$false}
    [pscustomobject]@{Trustee='m365.piotr@lab.example.invalid';AccessRights=@('SendAs');AccessControlType='Allow';IsInherited=$false}
}
function Get-Recipient {
    [CmdletBinding()]param([string]$Identity)
    Register-FixtureRead 'ResolveRecipient' $Identity
    if ($global:M365LabOfflineFixtureState.Case -eq 'UnresolvedDelegate' -and $Identity -match 'anna') { Stop-FixtureHttp 403 }
    [pscustomobject]@{DisplayName=($Identity -split '@')[0];PrimarySmtpAddress=$Identity}
}
Export-ModuleMember -Function Get-MgContext,Get-MgUserLicenseDetail,Get-MgGroup,Get-MgGroupOwnerAsUser,Get-MgGroupMemberAsUser,Get-ConnectionInformation,Get-Mailbox,Get-EXOMailboxPermission,Get-EXORecipientPermission,Get-Recipient
