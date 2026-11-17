# Stage 12 — Employee onboarding, access change and offboarding

Status: COMPLETE  
Target days: 24–25  
Execution date: 17 November 2026, Europe/Warsaw

## Requirement and scope

Revalidate an existing synthetic employee's usable services, move Piotr from Operations to IT, then offboard him while Anna retains approved mail and one designated business file. This is a guided service request, not a newly created employee, production incident or independent assessment.

The owner performed the tenant UI, authentication and PowerShell actions. The assistant prepared instructions/local diagnostics and inspected their output. Actual administrative roles were not comprehensively audited; earlier broad Graph consent is not presented as least-privilege authorization. No new role or sharing-policy exception was introduced for this stage.

## Baseline and mover

Piotr initially had sign-in allowed and Business Premium. Marek's `LAB-D12-MAIL-01 — Lifecycle baseline` reached him, his reply reached Marek, and the existing Finance `LAB-D07-STANDARD-01` opened. Piotr created and reopened the three-line handover TXT in his own work OneDrive. These checks revalidate an existing user's onboarding readiness.

Department changed from Operations to **IT**, and Job title to **IT Support Specialist**. The exact immediately preceding title was not freshly recorded; earlier `Operations Specialist` is historical. Display name `M365 Piotr Operations` and login alias `m365.piotr` intentionally remain stable.

| Mover phase | Observed outcome | Source |
| --- | --- | --- |
| New Private BFL-M365-IT Team | Marek Owner, Piotr Member | Capture 02; privacy owner-confirmed |
| New LAB-D12-IT-01 document | Piotr saved `Edited by Piotr - mover access verified.`; Marek saw it after reopening | Capture 03 and owner controls |
| Old Finance Team/backing group and DL | Piotr removed; Anna remains in both final lists | Owner confirmations |
| Old Finance URL | Piotr receives `You need access` / `don't have access to this site`; Anna's original still opens | Capture 04 and positive control |
| Working IT access | Piotr still opens the IT document after Finance removal | Owner confirmation before offboarding |
| Distribution control | Anna receives MOVE-DL-01; Piotr receives direct MOVE-CONTROL-01 but no DL copy in Inbox/Junk for ten minutes | Bounded owner observation, not transport-trace proof |

Changing a profile field alone did not change access: Team and DL memberships were changed separately. Finance-Confidential remains Anna-only; it was not used as the IT workspace.

## Approved file custody before entitlement removal

Piotr granted the intended Anna **Can view** on the designated source `My files/M365-Lab-D12/LAB-D12-HANDOVER-01.txt`. Anna opened it, downloaded that source and uploaded a separate copy to her own work OneDrive:

`My files/M365-Lab-D12-Handover/LAB-D12-HANDOVER-01.txt`

```text
LAB-D12-HANDOVER-01
Version: V1
Synthetic business data for handover to Anna.
```

Anna closed/reopened the destination through her own My files and verified all three lines before Piotr's block, after his block and after license removal. Capture 05 shows her OneDrive context and contents; exact folder, source/copy lineage and later reopen checks are owner-confirmed. This is one approved copy, not a whole-OneDrive migration, preserved version history or an independent backup.

## Block and session actions

adm-lab saved Block sign-in and confirmed it after reopening, then requested Sign out of all sessions. A fresh Piotr login at **13:45 Poland time** displayed:

> Your account has been locked. Contact your support person to unlock it, then try again.

Capture 06 supports the literal message. No AADSTS code is visible or invented. Combined with the controlled saved block, it supports T26. Separately, the owner reports that refreshing the old Outlook session exited it. No precise revocation latency, all-mobile logout or detailed Smart Lockout diagnosis is claimed.

## Mailbox preservation and wrong-delegate diagnosis

The existing licensed Piotr mailbox was converted to **SharedMailbox** before licensing changes. Capture 07 shows Shared mailbox. Read-only Exchange diagnostics also verified the intended stable Anna/Piotr identities, Piotr's actual type, OWA enabled and neither mailbox hidden from address lists.

Anna's own Outlook worked, but Open another mailbox → Piotr initially failed for hours. The private error contained `BootResult accessDenied`, `Microsoft.Exchange.Data.StoreObjects.AccessDeniedException` and HTTP 500. It was not treated as a captured 403 or a confirmed Microsoft outage. The raw frame contains private session/client/request identifiers and is not published.

An initial diagnostic failed while a deferred OData response was inadvertently enumerated in the local helper; that failed read was retained, not interpreted as an empty ACL. The corrected selected-mailbox ACL read returned two SELF entries and a different resolved human, **zero FullAccess entries for the intended Anna**, and no unresolved principals. The owner identified an Anna account from an older project as the mistaken delegate, replaced it with current `m365.anna`, and confirmed the wrong grant was removed.

The fresh post-fix ACL read at **15:55:54–15:55:59 UTC** returned one correct Anna FullAccess Allow, zero Anna deny, zero unresolved principals and no other resolved human delegate. Anna then opened Piotr via her own Outlook → Open another mailbox and read retained **LAB-D12-MAIL-01** (capture 08 plus owner identity attribution). FullAccess permits management as well as reading; no new Send As was requested for this custody task. See [curated observations](../../samples/lifecycle-mailbox-observations.csv).

## Licensing decision and final controls

The same pre-unassignment read returned:

| Observation | Actual result |
| --- | --- |
| Primary mailbox usage | 2.248 MB / 2,357,435 bytes; 138 items |
| Deleted-item size | 468.8 KB / 480,092 bytes |
| ArchiveStatus / ArchiveState | None / None; active and disabled archive GUIDs empty |
| Auto-expanding archive | False |
| LitigationHold / retention-label hold / delay holds / RetentionHold | Present fields, all False |
| Mailbox InPlaceHolds / organization InPlaceHolds | Both successfully read, zero entries |
| RetentionPolicy | Default MRM Policy; not reported as a litigation hold |

The inspected size is below the standard 50-GB unlicensed shared-mailbox threshold and no archive/hold dependency was indicated by these Exchange observations. This is not a complete Purview/premium-feature audit. For this scoped lab, **Business Premium was deliberately unassigned**, with the blocked account retained as the shared mailbox anchor. Capture 09 shows saved changes, Licenses (0), the cleared product and Sign-in blocked; the owner reopened the panel and confirmed persistence.

After unassignment the owner confirmed Anna could again read the retained mail and the complete V1 copy under her own My files. Marek's IT document and Anna's Helpdesk remained usable. No account deletion, subscription cancellation or tenant-wide retention-policy change occurred in this exercise.

## Final scoped access state and inspection limit

| Resource | Final recorded state |
| --- | --- |
| Piotr identity | Exists, sign-in blocked, no assigned product licenses; Department IT / title IT Support Specialist |
| Finance Team/backing group and DL | Anna retained; Piotr removed |
| IT Team | Marek Owner retained; Piotr removed after the successful mover test |
| Helpdesk | Piotr FullAccess and SendAs removed; Anna's existing FullAccess / Send on behalf retained and opening works |
| Knowledge Visitors | Piotr removal/group absence owner-confirmed; Anna/Marek existing roles retained |
| Piotr retained mailbox | SharedMailbox; correct Anna FullAccess, wrong legacy delegate removed; post-unassignment mail reading confirmed |
| Handover copy | Separate V1 TXT in Anna's own work OneDrive, reopened after unassignment |
| SG-M365-MFA-Pilot | Piotr membership deliberately retained as security scope; it is not a functional resource grant or proof of a new licensed CA sign-in |

The owner-attributed Knowledge Check Permissions attempt returned:

> Your organization's policies don't allow you to share with these users. Please contact your IT department for help

No effective permission levels were obtained. Exact dialog/policy cause is unconfirmed; this is an **inconclusive auxiliary inspection**, not proof of no direct/item-level grants. The site group removal and the independently verified account sign-in block are distinct facts. No sharing policy was weakened or Piotr unblocked to manufacture the check. This stage does not claim a tenant-wide effective-access purge or a complete inventory of old item links.

## Preservation, remaining resources and recovery

- Keep the blocked Piotr account anchoring the shared mailbox. Anna's own licensed account and the retained mailbox remain needed for ongoing custody.
- The source Piotr OneDrive is now unlicensed; do not describe it as indefinite storage. Current Microsoft defaults describe read-only at 60 unlicensed days and archiving at 93, with tenant/storage settings and other retention mechanisms affecting the lifecycle. Applicable billing and the cumulative unpaid-account policy also matter. Exact tenant policy was not audited or changed. The selected copy under Anna is the verified handover result.
- IT/Finance documents, the source TXT, Anna's copy and both shared mailboxes remain. No bulk data deletion or cleanup of unrelated old-project accounts was performed.
- If Piotr later returns, separately authorize and record restoration: correct licensing before UserMailbox conversion, explicitly approved memberships/delegation and then sign-in enablement. Restoring every old grant is not the default. No such rollback has run.
- The Stage 05 custom Exchange role-delegation exception remains unresolved. Stage 13 independent tasks and optional Copilot work remain unexecuted.

## Exit checks and evidence

- [x] Existing-user onboarding readiness has working mail and collaboration controls.
- [x] Mover adds IT access and removes Finance access with positive and negative controls.
- [x] T26 PASS — saved block and fresh sign-in denial; existing session behavior separate.
- [x] T27 PASS — verified conversion, corrected custody, reviewed licensing decision and retained-mail reading after unassignment.
- [x] T28 PASS — selected-file copy and complete V1 checks, with preservation limits recorded.

Stage 12 closes [M365-015](../../tickets/M365-015-employee-offboarding.md). The global matrix now has **31 PASS / 1 NOT_RUN**; only T32 remains. Historical day totals and Stage 11 report snapshots are preserved. The 25 prior isolated report-code checks are not rerun or counted as new workload checks.

[Nine captures](../../evidence/day-12/README.md) · [Day 12 test record](../../tests/day-12.md) · [Verified runbook](../../runbooks/employee-lifecycle.md) · [Current access matrix](../access-matrix.md) · [Microsoft references](../sources.md#stage-12--employee-lifecycle)

[Back to stage index](README.md)
