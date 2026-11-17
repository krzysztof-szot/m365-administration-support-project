# Verified lab runbook — employee lifecycle

Status: verified with guided owner execution on 17 November 2026. Scope: existing synthetic Piotr, approved custodian Anna and active-owner Marek. This is a reproducible record, not authority to offboard arbitrary users or bypass organizational approvals. [Actual results and exceptions](../docs/stages/12-employee-lifecycle.md).

## 1. Establish identity, readiness and recovery

Use the correct tenant and task-authorized admin; compare full logins and stable object identities rather than display names alone. Keep secrets/raw identifiers private. Record current license, block state, Department/JobTitle, relevant Team/DL/site/mailbox grants and a return-to-work path. Check two-way synthetic mail, the existing Finance document and the designated OneDrive source as the ordinary user. This lab reused an existing provisioned Piotr.

## 2. Move with explicit added and removed access

1. In the user's profile set Department IT and title IT Support Specialist; save/reopen. Record the real old value if observed; do not reconstruct it from memory.
2. Create Private BFL-M365-IT as Marek Owner; add Piotr Member. Create LAB-D12-IT-01 in a standard channel, edit/save as Piotr, and reopen as Marek.
3. Remove Piotr from BFL-M365-Finance Team/backing group and separately DL-M365-Finance. Reopen the lists; retain Anna.
4. During the still-active mover session, test the old direct Finance URL in a fresh Piotr context, with working Anna Finance and Piotr IT controls. Do not generate a new access-granting link just to test removal.
5. Send marked direct/DL controls; record actual recipients and a bounded non-receipt window. A ten-minute absence is not indefinite non-delivery or a Message Trace result.

## 3. Secure the designated file copy

As Piotr, grant intended Anna Can view on the designated TXT. As Anna, open the source, download it and upload a separate copy into her own work OneDrive `My files/M365-Lab-D12-Handover`. Close/reopen from that destination and compare every line with the approved baseline. Record source, destination, custodian, content scope and retention dependencies. Do not claim a whole-drive migration, retained version history or independent backup.

## 4. Block sign-in and record session effects separately

As adm-lab save Block sign-in and reopen to confirm, then request Sign out of all sessions. Attempt a genuinely fresh sign-in and record the exact message/time. Separately record how the pre-existing Outlook tab behaves after refresh. Do not infer universal instantaneous revocation. Reopen Anna's own copy while the source identity is blocked.

## 5. Preserve mailbox and verify the correct delegate

While the user mailbox is still licensed, use Microsoft 365 admin center → Users → Active users → Piotr → Mail → Convert to shared mailbox. Refresh EAC Recipients → Mailboxes and verify Shared mailbox; a success button alone is insufficient. Keep the blocked account as its anchor.

In that Piotr mailbox's Mailbox delegation → Read and manage / FullAccess, add the intended Anna after comparing the full address. Reopen and verify. FullAccess is management access; it does not imply Send As. As Anna, use own Outlook → Open another mailbox → Piotr, and read the pre-existing LAB-D12-MAIL-01.

If own Outlook works but delegated opening fails, inspect selected mailbox identity/type, FullAccess allow/deny and principal resolution, hidden-from-GAL and OWA flags. A failed ACL read is not an empty ACL. Preserve system entries. In this execution a namesake from an old project was corrected and the wrong grant removed; the intended grant then appeared in a successful ACL read and opening recovered. Private error frames with session/request identifiers stay unpublished.

## 6. Remove obsolete scoped resource grants

Remove Piotr from IT after the mover test. Remove his Helpdesk FullAccess and SendAs separately; retain Anna's existing grants. As Knowledge owner, remove the intended Visitors membership and inspect any actually observed remaining direct grants. Keep the deliberate MFA security scope and the blocked anchoring account.

For a site query use Site permissions → Advanced permissions settings → Check Permissions, enter the full login and Check Now. In this execution the attempted query returned a sharing-policy message; no effective levels were obtained. Record that uncertainty. Do not weaken policy, re-add or unblock the former user to manufacture a pass. A blocked identity's fresh-login failure is distinct from a complete item-level ACL inventory.

## 7. Make the license decision, then recheck custody

Before unassignment, inspect actual mailbox size, archive status, archive GUIDs/auto-expansion, mailbox holds and organization holds using authorized reads such as Get-Mailbox, Get-EXOMailboxStatistics and Get-OrganizationConfig. Missing/unread fields are unknown, not false. The recorded selected observations are in [this curated extract](../samples/lifecycle-mailbox-observations.csv); raw outputs remain private. No broad Purview clearance is implied.

A standard shared mailbox without a license has a 50-GB limit; archive/hold or other paid features can require licensing. Retain suitable licensing if a real dependency exists or cannot be cleared. Here the selected 2.248-MB mailbox had no archive/hold dependency indicated, so the owner removed Business Premium through Users → Active users → Piotr → Licenses and apps, saved/reopened, and captured Licenses (0) with Sign-in blocked.

Reopen retained mail as Anna, her own complete V1 copy, Marek's IT document and Anna's Helpdesk. Record actual outcomes after unassignment. Do not delete the anchor account. License unassignment is distinct from cancelling subscriptions. Source OneDrive follows unlicensed-account storage/archival rules; exact tenant settings must be recorded or left unknown rather than promised indefinite preservation.

## 8. Close or recover deliberately

Publish actual access/data state, source attribution, failed/inconclusive checks, remaining resources and recovery steps. If the user returns, separately authorize appropriate license/type restoration, only the required memberships/delegation, then sign-in enablement. This lab ends blocked/unlicensed with custody verified; rollback is a plan, not an executed result.

[Case M365-015](../tickets/M365-015-employee-offboarding.md) · [Acceptance](../tests/day-12.md) · [Evidence](../evidence/day-12/README.md) · [Microsoft sources](../docs/sources.md#stage-12--employee-lifecycle)
