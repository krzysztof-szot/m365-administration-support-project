# Microsoft sources

Reviewed for project planning on 14 November 2026. Availability, interfaces and commercial terms must be checked again when the environment is provisioned.

| Area | Official source |
| --- | --- |
| Business Standard trial and plan variants | [Polish Microsoft trial page](https://www.microsoft.com/pl-pl/microsoft-365/business/microsoft-365-business-standard-one-month-trial) |
| Business trial setup and renewal | [Try or buy Microsoft 365 for business](https://learn.microsoft.com/en-us/microsoft-365/commerce/try-or-buy-microsoft-365?view=o365-worldwide) |
| Service plan comparison | [Microsoft 365 and Office 365 plan options](https://learn.microsoft.com/en-us/office365/servicedescriptions/office-365-platform-service-description/office-365-plan-options) |
| Developer sandbox eligibility | [Welcome to the Developer Program](https://learn.microsoft.com/en-us/office/developer-program/microsoft-365-developer-program) |
| Shared mailbox conversion and license limitations | [Convert a user mailbox to a shared mailbox](https://learn.microsoft.com/en-us/microsoft-365/admin/email/convert-user-mailbox-to-shared-mailbox?view=o365-worldwide) |
| Mailbox delegation and license removal | [Create a shared mailbox](https://learn.microsoft.com/en-us/microsoft-365/admin/email/create-a-shared-mailbox?view=o365-worldwide) |
| Teams and SharePoint storage | [Teams and SharePoint integration](https://learn.microsoft.com/en-us/sharepoint/teams-connected-sites) |
| Channel types | [Teams and channels overview](https://learn.microsoft.com/en-us/microsoftteams/teams-channels-overview) |
| Service health | [Check Microsoft 365 service health](https://learn.microsoft.com/en-us/microsoft-365/enterprise/view-service-health?view=o365-worldwide) |
| Email troubleshooting | [Find and fix email delivery issues](https://learn.microsoft.com/en-us/troubleshoot/exchange/email-delivery/email-delivery-issues) |

## Day 01 implementation references

These references support the interpretation of the observed lab results; they do not independently verify the owner's tenant or reported client versions.

| Area | Official source |
| --- | --- |
| MFA pilot with authentication strength | [Require MFA with Conditional Access](https://learn.microsoft.com/en-us/entra/identity/conditional-access/policy-all-users-mfa-strength) |
| Report-only results | [Conditional Access report-only mode](https://learn.microsoft.com/en-us/entra/identity/conditional-access/concept-conditional-access-report-only) |
| Authentication details and existing MFA claims | [Microsoft Entra MFA reporting](https://learn.microsoft.com/en-us/entra/identity/authentication/howto-mfa-reporting) |
| Administrative role changes | [Manage Microsoft Entra user roles](https://learn.microsoft.com/en-us/azure/active-directory/fundamentals/users-assign-role-azure-portal) |
| Recovery-account validation | [Manage emergency access accounts](https://learn.microsoft.com/en-us/entra/identity/role-based-access-control/security-emergency-access) |
| Word web document workflow | [Create a document from OneDrive for work or school](https://support.microsoft.com/en-gb/onedrive/create-a-document-from-onedrive-for-work-or-school?wt.mc_id=otc_onedrive) |
| Teams standard-channel storage | [Standard channels](https://learn.microsoft.com/en-us/microsoftteams/standard-channels) |
| Opening channel files in SharePoint | [Collaborate on files in Teams](https://support.microsoft.com/en-gb/teams/files/collaborate-on-files-in-microsoft-teams) |

## Day 02–03 implementation references

These sources explain the procedures and concepts; actual outcomes come from the lab evidence and attributed owner reports.

| Area | Official source |
| --- | --- |
| User creation and profile setup | [Create users](https://learn.microsoft.com/en-us/microsoft-365/admin/add-users/add-users?view=o365-worldwide) and [edit profile properties](https://learn.microsoft.com/en-us/entra/fundamentals/how-to-manage-user-profile-info) |
| Product/service entitlement | [Assign licenses](https://learn.microsoft.com/en-us/microsoft-365/admin/manage/assign-licenses-to-users?view=o365-worldwide) |
| Mailbox provisioning | [Diagnose provisioning delays](https://learn.microsoft.com/troubleshoot/exchange/user-and-shared-mailboxes/delays-provision-mailbox-sync-changes) |
| Group types and ownership | [Compare groups](https://learn.microsoft.com/en-us/microsoft-365/admin/create-groups/compare-groups?view=o365-worldwide) and [create a Microsoft 365 group](https://learn.microsoft.com/en-us/microsoft-365/admin/create-groups/create-groups?view=o365-worldwide) |
| Recipient administration | [Exchange Recipient Administrator](https://learn.microsoft.com/en-us/entra/identity/role-based-access-control/permissions-reference#exchange-recipient-administrator) and [Exchange role mapping](https://learn.microsoft.com/en-us/exchange/permissions-exo/permissions-exo) |
| Distribution membership | [Manage distribution lists](https://learn.microsoft.com/en-us/exchange/recipients-in-exchange-online/manage-distribution-groups/manage-distribution-groups) |
| Additional SMTP addresses | [Mailbox email addresses](https://learn.microsoft.com/en-us/exchange/recipients-in-exchange-online/manage-user-mailboxes/add-or-remove-email-addresses) |
| Header interpretation | [View message headers](https://support.microsoft.com/en-us/outlook/view-internet-message-headers-in-outlook) |

## Day 04 implementation references

Reviewed during the 14 November 2026 exercise. These sources explain the intended behavior; screenshots and attributed owner reports establish the lab results.

| Area | Official source |
| --- | --- |
| Full Access, Send As and Send on behalf | [Manage permissions for recipients](https://learn.microsoft.com/en-us/exchange/recipients-in-exchange-online/manage-permissions-for-recipients) |
| Mailbox permission propagation | [Give mailbox permissions](https://learn.microsoft.com/en-us/microsoft-365/admin/add-users/give-mailbox-permissions-to-another-user?view=o365-worldwide) |
| Delegated web access | [Open and use a shared mailbox in Outlook](https://support.microsoft.com/en-us/outlook/sharing/open-and-use-a-shared-mailbox-in-outlook) |
| Calendar reader/editor permissions | [Share your calendar in Outlook on the web](https://support.microsoft.com/en-us/outlook/share-your-calendar-in-outlook-on-the-web) |
| Calendar timezone | [Manage time zone settings](https://support.microsoft.com/en-us/outlook/getstarted/manage-time-zone-settings-in-outlook) |
| Room creation and booking policy | [Manage resource mailboxes](https://learn.microsoft.com/en-us/exchange/recipients-in-exchange-online/manage-resource-mailboxes) |
| Resource booking and account block | [Room and equipment mailboxes](https://learn.microsoft.com/en-us/microsoft-365/admin/manage/room-and-equipment-mailboxes?view=o365-worldwide) |

The observed EAC exposed a Send on behalf control for Helpdesk; its actual captured panel and successful message are recorded. The exercise used that interface, not an invented PowerShell result. Advanced retention, archive and resource-device licensing scenarios were not tested.

## Day 05 implementation references

Reviewed during the **16 November 2026** exercise and documentation review. The sources explain service behavior and permission models; they do not independently verify the tenant, operator identity, effective delegating assignments or elapsed propagation.

| Area | Official source |
| --- | --- |
| Current service advisories | [Check Microsoft 365 service health](https://learn.microsoft.com/en-us/microsoft-365/enterprise/view-service-health?view=o365-worldwide) |
| Trace filters, statuses, events and time context | [Message Trace in Exchange Online](https://learn.microsoft.com/en-us/exchange/monitoring/trace-an-email-message/message-trace-modern-eac) |
| NDR contents and error interpretation | [Email nondelivery reports and SMTP errors](https://learn.microsoft.com/en-us/troubleshoot/exchange/email-delivery/ndr/non-delivery-reports-in-exchange-online) |
| Captured invalid-recipient response | [Fix NDR error 550 5.1.10](https://learn.microsoft.com/en-us/troubleshoot/exchange/email-delivery/ndr/fix-error-code-550-5-1-10-in-exchange-online) |
| Rule creation, saved state and enable/disable | [Manage mail-flow rules](https://learn.microsoft.com/en-us/exchange/security-and-compliance/mail-flow-rules/manage-mail-flow-rules) |
| AND logic and enabled-state distinction | [Mail-flow rule components and processing](https://learn.microsoft.com/en-us/exchange/security-and-compliance/mail-flow-rules/mail-flow-rules) |
| Sender, recipient and subject scope | [Conditions and exceptions](https://learn.microsoft.com/en-us/exchange/security-and-compliance/mail-flow-rules/conditions-and-exceptions) |
| Rejection explanation and configured code | [Mail-flow rule actions](https://learn.microsoft.com/en-us/exchange/security-and-compliance/mail-flow-rules/mail-flow-rule-actions) |
| Exchange roles and Entra mapping | [Permissions in Exchange Online](https://learn.microsoft.com/en-us/exchange/permissions-exo/permissions-exo) |
| Custom role groups and delegating assignments | [Manage role groups](https://learn.microsoft.com/en-us/exchange/permissions-exo/role-groups) |
| Account role inspection | [List Microsoft Entra role assignments](https://learn.microsoft.com/en-us/entra/identity/role-based-access-control/view-assignments) |

PowerShell connection and role-group read commands were proposed for diagnosis but deferred by the owner. They are not recorded as executed procedures or Stage 11 report validation.


## Day 06 implementation references

Reviewed during the **16 November 2026** exercise. These primary sources explain the supported procedures; actual client results and limits come from the captures and owner reports.

| Area | Official source |
| --- | --- |
| Desktop installation | [Install Microsoft 365 applications](https://learn.microsoft.com/en-us/microsoft-365/admin/setup/install-applications?view=o365-worldwide) |
| Product license refresh | [Update License button in Microsoft 365 apps](https://support.microsoft.com/en-us/microsoft-365-activation-licensing/update-license-button-in-microsoft-365-apps) |
| Office accounts and same-tenant sign-in | [About accounts in Office](https://support.microsoft.com/en-us/accounts-billing/subscriptions/about-accounts-in-office) |
| Sign-out and application restart | [Sign out of Office](https://support.microsoft.com/en-us/accounts-billing/subscriptions/sign-out-of-office) |
| App-only work account sign-in | [Add your work or school account to a Windows device](https://support.microsoft.com/en-us/windows/security/identity-signin/add-your-work-or-school-account-to-a-windows-device) |
| Mailbox configuration | [Add an email account to Outlook for Windows](https://support.microsoft.com/en-us/outlook/getstarted/add-an-email-account-to-outlook-for-windows) |
| Client offline/online state | [How to work offline in Outlook for Windows](https://support.microsoft.com/en-us/outlook/getstarted/how-to-work-offline-in-outlook-for-windows) |
| Separate Outlook profile | [Create a profile in classic Outlook for Windows](https://support.microsoft.com/en-us/outlook/create-an-outlook-profile) |
| Delegated mailbox and sender selection | [Open and use a shared mailbox in Outlook](https://support.microsoft.com/en-us/outlook/sharing/open-and-use-a-shared-mailbox-in-outlook) |
| Shared calendar opening | [Open another person's Exchange Calendar](https://support.microsoft.com/en-us/outlook/open-another-person-s-exchange-calendar) |
| Version, build and architecture | [What version of Outlook do I have?](https://support.microsoft.com/en-us/outlook/getstarted/what-version-of-outlook-do-i-have) |

App-only sign-in was the instructed option when offered; it is not proof of the VM's complete existing device-registration or management state. The initial connectivity cause, activation-cache mechanism and exact synchronization latency were not established. No Microsoft outage, licensing purchase or automatic permission change is inferred from the documentation.


## Day 07 implementation references

Reviewed during the **16 November 2026** guided exercise. These official sources describe the model and procedures; the captures and attributed owner reports supply the actual lab outcomes.

| Area | Official source |
| --- | --- |
| Existing-group Team creation | [Create a team from an existing team or group](https://support.microsoft.com/en-us/teams/teams-channels/create-a-team-from-an-existing-team-or-group-in-microsoft-teams) |
| Channel creation/type | [Create a standard, private, or shared channel](https://support.microsoft.com/en-us/teams/teams-channels/create-a-standard-private-or-shared-channel-in-microsoft-teams) |
| Channel files and Shared/In library | [Share files in Microsoft Teams](https://support.microsoft.com/en-us/teams/files/share-files-in-microsoft-teams) |
| Private membership and channel site | [Private channels in Microsoft Teams](https://learn.microsoft.com/en-us/microsoftteams/private-channels) |
| Navigation and ownership boundary | [Manage integrated Teams/SharePoint settings and permissions](https://learn.microsoft.com/en-us/sharepoint/manage-teams-sharepoint-experiences) |
| Link without a new permission grant | [Sharing files, folders, and list items](https://support.microsoft.com/en-us/sharepoint/libraries/sharing-files-folders-and-list-items) |
| Instant channel meeting | [Start an instant meeting](https://support.microsoft.com/en-us/teams/meetings/start-an-instant-meeting-in-microsoft-teams) |
| Meeting audio selection | [Manage audio settings](https://support.microsoft.com/en-us/teams/meetings/manage-audio-settings-in-microsoft-teams-meetings) |
| Browser presentation | [Present content in Teams meetings](https://support.microsoft.com/en-us/teams/meetings/present-content-in-microsoft-teams-meetings) |

The record does not infer exact membership-propagation latency, audit unseen direct grants or treat a still image as audio-quality proof. It uses the observed channel libraries without assuming that every new private channel must expose a particular folder layout. A visible Word summary panel is not validation of the optional Copilot extension.


## Day 08 implementation references

Reviewed during the **16 November 2026** exercise. Official behavior references are separate from the actual captures and owner confirmations.

| Area | Official source |
| --- | --- |
| Independent communication site | [Create a communication site](https://support.microsoft.com/en-us/sharepoint/sites-in-sharepoint/create-a-communication-site-in-sharepoint) |
| Role assignments | [Share a site](https://support.microsoft.com/en-us/sharepoint/sharepoint-sharing-and-permissions/share-a-site) and [Understanding permission levels](https://learn.microsoft.com/en-us/sharepoint/understanding-permission-levels) |
| Metadata | [View and edit file information](https://support.microsoft.com/en-us/sharepoint/libraries/view-and-edit-information-about-a-file-folder-or-link-in-a-document-library) |
| Read/download/upload diagnostics | [Download files](https://support.microsoft.com/en-us/onedrive/download-files-and-folders-from-onedrive-or-sharepoint) and [Upload to a library](https://support.microsoft.com/en-us/sharepoint/documents-and-library/upload-files-and-folders-to-a-library) |
| Check-out distinction | [Check out or check in files](https://support.microsoft.com/en-us/sharepoint/libraries/check-out-or-check-in-files-in-a-document-library) |
| Link audience and access sources | [Share SharePoint files or folders](https://support.microsoft.com/en-us/sharepoint/sharepoint-sharing-and-permissions/share-sharepoint-files-or-folders) and [Manage sharing and permissions](https://support.microsoft.com/en-us/onedrive/sharepoint/manage-sharing-and-permissions-in-onedrive-and-sharepoint) |
| Unique permissions and restoration | [Customize permissions](https://support.microsoft.com/en-us/sharepoint/lists/sharepoint-sharing-and-permissions/customize-permissions-for-a-sharepoint-list-or-library) and [Manage permission scopes](https://learn.microsoft.com/en-us/sharepoint/manage-permission-scope) |
| Editor-lock background | [WOPI concepts and lock expiry](https://learn.microsoft.com/en-us/microsoft-365/cloud-storage-partner-program/rest/concepts#lock) |

The WOPI reference describes a protocol mechanism; its generic expiry rule is not proof of this tenant's exact lock type or a measured SharePoint recovery interval. The owner attributes the original file's recovery to time after closing Word. Link removal and restoring inheritance are distinct operations; inherited entries can be copied to an item's unique scope when it is shared. A visible Copilot button is not a validated Copilot session.

## Day 09 implementation references

Reviewed during the **16 November 2026** exercise. These official behavior references are separate from the owner's captures and functional confirmations.

| Area | Official source |
| --- | --- |
| Work sync client and propagation | [Sync your computer's files and folders with OneDrive](https://support.microsoft.com/en-us/onedrive/sync-your-computer-s-files-and-folders-with-onedrive?ad=US&rs=en-US&ui=en-US) |
| Client context and settings | [Access OneDrive settings](https://support.microsoft.com/en-us/onedrive/how-to-access-onedrive-settings) |
| Availability states | [Files On-Demand for Windows](https://support.microsoft.com/en-gb/onedrive/save-disk-space-with-onedrive-files-on-demand-for-windows?ad=gb&rs=en-gb&ui=en-us) and [OneDrive icons](https://support.microsoft.com/en-us/onedrive/what-do-the-onedrive-icons-mean) |
| Controlled pause and Resume | [Pause and resume OneDrive sync](https://support.microsoft.com/en-us/onedrive/how-to-pause-and-resume-onedrive-sync) |
| Browser replacement | [Upload problems and Replace](https://support.microsoft.com/en-us/onedrive/fix-problems-uploading-files-on-the-onedrive-website) |
| Earlier contents | [Restore a previous version](https://support.microsoft.com/en-gb/onedrive/restore-a-previous-version-of-a-file-stored-in-onedrive) |
| Deleted item | [Restore your OneDrive files](https://support.microsoft.com/en-us/onedrive/restore-your-onedrive-files) |
| User workspace and shared sites | [Organize documents and sites in Microsoft 365](https://support.microsoft.com/en-us/onedrive/sharepoint/organize-documents-and-sites-in-microsoft-365) |

No generic retention period is asserted as this tenant's configured policy. The exercise verifies text recovery of one synthetic item, not independent backup coverage or a measured recovery SLA.

## Day 10 implementation references

Reviewed **17 November 2026**. Tenant status and Message center post contents come from the owner's captures and attributed reports, not from a public status-page inference.

| Area | Official reference |
| --- | --- |
| Current service review | [Check Microsoft 365 service health](https://learn.microsoft.com/en-us/microsoft-365/enterprise/view-service-health?view=o365-worldwide) |
| Change review | [Microsoft 365 Message center](https://learn.microsoft.com/en-us/microsoft-365/admin/manage/message-center?view=o365-worldwide) |
| User procedures | Microsoft support links are included in each [knowledge article](../knowledge-base/README.md) |
| Version entry menu | [View version history](https://support.microsoft.com/en-us/sharepoint/data-and-lists/view-the-version-history-of-an-item-or-file-in-a-list-or-library) |
| RBAC expectations | [Exchange Online permissions and role mapping](https://learn.microsoft.com/en-us/exchange/permissions-exo/permissions-exo) |
| Role-group context | [Manage role groups](https://learn.microsoft.com/en-us/exchange/permissions-exo/role-groups) |
| Proposed assignment read | [Get ManagementRoleAssignment](https://learn.microsoft.com/en-us/powershell/module/exchangepowershell/get-managementroleassignment?view=exchange-ps) |

The documented Global Administrator mapping and regular/delegating-assignment distinction guide a proposed second-line read; they do not establish this session's effective assignments, scopes or root cause. No diagnostic command ran for Stage 10. Microsoft's future rollout and repair forecasts remain forecasts.


## Day 11 implementation references

Reviewed 17 November 2026. Official behavior and permission references are separate from owner-run exports and portal confirmations.

| Area | Official source |
| --- | --- |
| Graph submodules/runtime | [SDK installation](https://learn.microsoft.com/en-us/powershell/microsoftgraph/installation) |
| Delegated authentication/context | [Authentication commands](https://learn.microsoft.com/en-us/powershell/microsoftgraph/authentication-commands) |
| Returned consented scopes | [Resources and scopes](https://learn.microsoft.com/en-us/entra/msal/javascript/browser/resources-and-scopes) |
| License API and roles | [List licenseDetails](https://learn.microsoft.com/en-us/graph/api/user-list-licensedetails?view=graph-rest-1.0) |
| SPB product mapping | [Product/service-plan reference](https://learn.microsoft.com/en-us/entra/identity/users/licensing-service-plan-reference) |
| Human group relations | [Owners](https://learn.microsoft.com/en-us/graph/api/group-list-owners?view=graph-rest-1.0) and [direct members](https://learn.microsoft.com/en-us/graph/api/group-list-members?view=graph-rest-1.0) |
| Exchange runtime | [EXO module requirements](https://learn.microsoft.com/en-us/powershell/exchange/exchange-online-powershell-v2) |
| Exchange connection/RBAC | [Connect](https://learn.microsoft.com/en-us/powershell/exchange/connect-to-exchange-online-powershell) and [permissions](https://learn.microsoft.com/en-us/exchange/permissions-exo/permissions-exo) |
| ACL data | [Mailbox permission](https://learn.microsoft.com/en-us/powershell/module/exchangepowershell/get-exomailboxpermission) and [recipient permission](https://learn.microsoft.com/en-us/powershell/module/exchangepowershell/get-exorecipientpermission) |
| Named delegation | [Manage recipient permissions](https://learn.microsoft.com/en-us/exchange/recipients-in-exchange-online/manage-permissions-for-recipients) |
| Connection metadata | [Get ConnectionInformation](https://learn.microsoft.com/en-us/powershell/module/exchangepowershell/get-connectioninformation) |
| Expected tenant ID | [Find tenant ID](https://learn.microsoft.com/en-us/entra/fundamentals/how-to-find-tenant) |
| Persistent setup consent | [Grant admin consent](https://learn.microsoft.com/en-us/entra/identity/enterprise-apps/grant-admin-consent) |

Actual scopes must be inspected; requesting fewer scopes is not proof that previously consented scopes disappeared. Generic permission tables do not establish the exact roles assigned to a specific user. The observed Helpdesk visibility contrast and supplemental nested 401 are not relabelled a captured 403. A generic delegation UI statement is not substituted for the owner's actual fresh portal view.

## Stage 12 — Employee lifecycle

Sources checked against the observed 17 November 2026 workflow; general product rules do not prove actual tenant state. Selected Exchange facts, owner execution and evidence boundaries are in the stage/test records.

- [Manage user profile information](https://learn.microsoft.com/en-us/entra/fundamentals/how-to-manage-user-profile-info) — Department/JobTitle are separate from resource authorization.
- [Remove someone from a Team](https://support.microsoft.com/en-au/teams/teams-channels/remove-someone-from-a-team-in-microsoft-teams) and [Microsoft 365 group membership](https://learn.microsoft.com/en-us/microsoft-365/admin/create-groups/add-or-remove-members-from-groups?view=o365-worldwide) — targeted removals and retained owners.
- [Distribution groups](https://learn.microsoft.com/en-us/exchange/recipients-in-exchange-online/manage-distribution-groups/manage-distribution-groups) — DL membership is separate from the Finance Microsoft 365 group.
- [Block a former employee](https://learn.microsoft.com/en-us/microsoft-365/admin/add-users/remove-former-employee-step-1?view=o365-worldwide) and [revoke user access](https://learn.microsoft.com/en-us/entra/identity/users/users-revoke-access) — new authentication and existing app sessions are distinct.
- [Convert user mailbox to shared](https://learn.microsoft.com/en-us/microsoft-365/admin/email/convert-user-mailbox-to-shared-mailbox?view=o365-worldwide) — convert before unassigning, keep anchor, standard 50-GB unlicensed limit and archive/hold licensing conditions.
- [Recipient delegation](https://learn.microsoft.com/en-us/exchange/recipients-in-exchange-online/manage-permissions-for-recipients), [Get-MailboxPermission](https://learn.microsoft.com/en-us/powershell/module/exchangepowershell/get-mailboxpermission?view=exchange-ps), [Get-CASMailbox](https://learn.microsoft.com/en-us/powershell/module/exchangepowershell/get-casmailbox?view=exchange-ps), [Get-EXOMailboxStatistics](https://learn.microsoft.com/en-us/powershell/module/exchangepowershell/get-exomailboxstatistics?view=exchange-ps) and [Get-OrganizationConfig](https://learn.microsoft.com/en-us/powershell/module/exchangepowershell/get-organizationconfig?view=exchange-ps) — selected read-only observations, not an exhaustive effective-access or Purview audit.
- [Open a shared mailbox](https://support.microsoft.com/en-us/outlook/sharing/open-and-use-a-shared-mailbox-in-outlook) — use the custodian's own Outlook and correct target identity.
- [Assign or unassign licenses](https://learn.microsoft.com/en-us/microsoft-365/admin/manage/assign-licenses-to-users?view=o365-worldwide) — saved/reopened product unassignment is distinct from account deletion or subscription cancellation. Generic user-mailbox removal guidance is bounded by the specific shared-mailbox procedure above.
- [Former employee OneDrive access](https://learn.microsoft.com/en-us/microsoft-365/admin/add-users/remove-former-employee-step-5?view=o365-worldwide), [OneDrive sharing](https://support.microsoft.com/en-us/onedrive/share-files-and-folders-in-microsoft-onedrive) and [unlicensed OneDrive accounts](https://learn.microsoft.com/en-us/sharepoint/unlicensed-onedrive-accounts) — approved selected copy, correct recipient and current source-storage limits. The specific current unlicensed-account policy takes precedence over older generic indefinite-access wording; exact tenant settings remain unknown.
- [Customize SharePoint permissions](https://learn.microsoft.com/en-us/sharepoint/customize-sharepoint-site-permissions) and [Check Permissions procedure](https://learn.microsoft.com/en-us/troubleshoot/sharepoint/administration/access-denied-or-need-permission-error-sharepoint-online-or-onedrive-for-business) — group removal and effective-level query are separate. The observed policy message did not return levels and is not explained by these general instructions alone.

## Portfolio review and retained lab

[Manage recurring billing](https://learn.microsoft.com/en-us/microsoft-365/commerce/subscriptions/renew-your-subscription?view=o365-worldwide) distinguishes switching renewal off from immediate cancellation. Actual owner expiry/renewal information is private; no billing action is inferred. The [current sharing controls](https://support.microsoft.com/en-us/onedrive/sharepoint/manage-sharing-and-permissions-in-onedrive-and-sharepoint) distinguish targeted user/link removal from making an item private. [Files On-Demand](https://support.microsoft.com/en-us/onedrive/save-disk-space-with-onedrive-files-on-demand-for-windows) distinguishes online-only from locally retained content. General documentation does not prove this tenant's effective permissions, retention policy or exact client timing.
