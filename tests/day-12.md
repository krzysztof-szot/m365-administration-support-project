# Day 12 — Lifecycle verification

Execution: 17 November 2026, Europe/Warsaw. Guided manual tenant operations plus owner-run read-only Exchange diagnostics inspected locally. This is not the independent capstone.

| Matrix ID | Expected result | Observed result | Result |
| --- | --- | --- | --- |
| T26 | New sign-in denied after blocking | Saved/reopened Block sign-in; fresh Piotr login at 13:45 Poland gives the captured account-locked message | PASS |
| T27 | Approved delegate opens retained mail after verified conversion and licensing decisions | Existing mailbox SharedMailbox in EAC/API; wrong Anna corrected and wrong grant removed; correct FullAccess read; size/archive/hold observations reviewed; license removed; Anna still reads LAB-D12-MAIL-01 | PASS |
| T28 | Custodian accesses designated data and preservation limits recorded | Source Can view and separate copy in Anna My files; full three-line V1 reopened before/after block and after unassignment; source unlicensed OneDrive limits documented | PASS |

Global total: **32 IDs, 31 PASS / 1 NOT_RUN** (T32 only). Mover, existing-user readiness, owner controls and diagnostic phases support these entries without adding IDs. The 25 earlier synthetic code cases remain separate and are not rerun for this documentation update.

## Supporting controls

- Baseline two-way mail and Finance file access worked as Piotr; the synthetic source TXT reopened.
- Department IT and Job title IT Support Specialist saved; exact immediate old title not freshly captured.
- New Private IT Team: Marek Owner, Piotr Member, edit/save followed by Marek reopen. Later removal from IT owner-confirmed, with Marek file access still working.
- Finance Team/backing group and DL end Anna-only per owner. Piotr's old site URL denied, Anna's Finance and Piotr's new IT controls work during mover. Direct mail arrives; DL absence is only the reported ten-minute Inbox/Junk window.
- Sign out of all sessions requested; old Outlook exits after refresh per owner. No universal session latency is inferred.
- Helpdesk Piotr FullAccess/SendAs removed per owner; Anna still opens it. Correct Anna, rather than an old-project namesake, opens retained Piotr mail.

## Actual diagnostic and license evidence

The pre-repair selected-mailbox ACL has zero correct Anna grants, with a different resolved human. Owner identifies wrong-account selection and confirms its removal. Post-repair read at 15:55:54–15:55:59 UTC verifies one intended Anna FullAccess Allow, zero Anna deny/unresolved principals. Both stable identities match historical directory references; those references are not current group-membership data.

Primary mailbox 2,357,435 bytes; archive None, no active/disabled archive GUID, auto-expansion false, listed mailbox hold flags false, mailbox and organization InPlaceHolds read empty. Default MRM Policy is preserved as a returned value. These are selected Exchange facts, not exhaustive Purview/licensing certification. Product unassignment, blocked status, mail/copy reopening and active-owner regressions are supported by capture 09 and explicit owner confirmations after the change. No new post-unassignment API license export is claimed.

## Auxiliary Knowledge check — inconclusive

Piotr removal/absence from Knowledge Visitors is owner-confirmed. The attributed Check Permissions attempt instead returns `Your organization's policies don't allow you to share with these users. Please contact your IT department for help`. No permission levels were obtained; the exact dialog/policy cause is unknown. This is neither a PASS for complete permission removal nor a new global test failure. Direct/item-level grants were not exhaustively audited, and the account was not unblocked for a fresh resource test.

## Evidence boundary and retained state

[Captures 01–09](../evidence/day-12/README.md) distinguish visible state from owner-attributed actor, timing and reopen controls. The raw OWA diagnostic with private identifiers is excluded. [Curated API observations](../samples/lifecycle-mailbox-observations.csv) distinguish pre-repair, post-repair/pre-unassignment and owner-confirmed final state.

Piotr remains a blocked unlicensed shared-mailbox anchor, with deliberate MFA group scope retained. Anna's own licensed OneDrive holds one approved copy, not a full migration or independent backup; the source follows current unlicensed-account policy and unknown tenant-specific retention settings. No account deletion or automatic rollback occurred. See the [stage record](../docs/stages/12-employee-lifecycle.md) and [runbook](../runbooks/employee-lifecycle.md).
