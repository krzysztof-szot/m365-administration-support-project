# Day 02 validation record

Status: **COMPLETE**. Execution date: **14 November 2026**. Evidence: [21 screenshots](../evidence/day-02/README.md). Checks are manual.

| Check | Result and evidence |
| --- | --- |
| User baseline | Anna has the Copilot bundle; Marek has Premium; Piotr initially unlicensed (01/02) |
| Identity authentication | Piotr opens My Account without a product license (03) |
| Expected workload failure | HTTP 500 / OwaUserHasNoMailboxAndNoLicenseAssignedException at 10:50:51.023Z (04) |
| Licensing repair | Premium assigned and Exchange Online Plan 1 enabled (05/05a) |
| Functional recovery | Piotr opens Outlook, sends to Anna and receives reply (06–08); **T04 PASS** |
| User attributes | Department/title completion owner-reported; images 04a/04b intentionally waived |
| MFA group | Three direct members (09) |
| CA policy evaluation | Success for Piotr / My Signins and Marek / One Outlook Web (10/11); no fresh approval or Basic info requirement captured |
| Collaboration group | Private BFL-M365-Finance; owner Anna; members Anna/Piotr; site link; Teams not added (12–14) |
| Operator role | adm-lab Exchange Recipient Administrator: Direct/Active/Permanent, tenant scope (15) |
| DL configuration | DL-M365-Finance; owner Anna; members Anna/Piotr (16/17) |
| Distribution delivery | Marek sends to the DL; Anna/Piotr receive (18–20) |
| Excluded recipient | Owner reports Marek received no Inbox/Junk copy in ten minutes; **T06 PASS** with that bounded observation |
| Delivery restrictions | Internal senders only; Specified senders empty; moderation off, owner-reported |

T03 is inherited from Day 01 rather than counted again. At Day 02 closure the cumulative snapshot is **6 PASS / 26 NOT_RUN**; [current totals](README.md) include later stages. T06 carries forward to Day 03 removal/recovery without a second global entry.

Provisioning elapsed time, exact membership propagation and an independent audit attribution for every operator action were not recorded. Mail UI times have no captured timezone. Closed DL join/leave is unconfirmed. No private-site excluded-user test or deliberate Copilot validation was performed.

[Stage implementation](../docs/stages/02-users-licenses-and-groups.md) · [M365-001 case](../tickets/M365-001-pilot-license-recovery.md)
