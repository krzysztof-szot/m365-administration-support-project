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
