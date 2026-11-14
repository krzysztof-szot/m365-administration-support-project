# Environment baseline and current lab state

Current state after **Stages 01–04 COMPLETE**, executed **14 November 2026**. Stage/day labels identify learning units; the roadmap's target-day ranges are estimates.

| Area | Recorded state and source |
| --- | --- |
| Products | Owner's active views: Standard 25 seats; Premium 25; Premium with Copilot 1. Recurring billing off reported privately |
| Historical context | Existing Baltic Finance identity lab; E5/Suite disabled/expired according to owner; historical users, policies and assignments retained |
| Anna | m365.anna; Business Premium with Copilot; Poland captured; browser workloads verified in Day 01 |
| Piotr | m365.piotr; Poland; initially no product license, then ordinary Premium with Exchange Online Plan 1; mailbox and two-way mail verified |
| Marek | m365.marek; ordinary Premium; internal DL test sender; Poland setup follows owner report |
| Job information | Piotr Operations / Operations Specialist; Marek IT / IT Support Trainee, owner-reported without screenshots. Anna's Finance attribute remains a design value |
| MFA method and scope | Authenticator enabled for All users / Any mode; completed Anna method captured in Day 01; Piotr/Marek registration owner-reported; pilot group now has all three |
| CA policy | CA-M365-001-Require-MFA-Pilot remains On; All resources; Multifactor authentication strength; emergency accounts excluded |
| CA observations | Day 01 Exchange MFA satisfied by prior claim; Day 02 policy Success for Piotr / My Signins and Marek / One Outlook Web. No fresh-approval inference |
| Configuration role cleanup | Additional CA Administrator on adm-lab removed in Day 01 |
| Exchange operator role | adm-lab Exchange Recipient Administrator: last captured Direct/Active, tenant scope, Permanent; retained for Exchange lab work. No removal reported in Day 04; review the task role for Stage 05 |
| Historical admin context | User Administrator and other roles on reused adm-lab were background; not an overall least-privilege redesign. Some actions lack independent operator audit attribution |
| Private collaboration group | BFL-M365-Finance; owner Anna; members Anna/Piotr; site link captured; Teams not added |
| Distribution list | DL-M365-Finance; owner Anna; members restored to Anna/Piotr after Day 03 fault |
| DL settings | Internal senders only; Specified senders empty; moderation off, owner-reported. Closed join/leave not confirmed |
| Alias | Secondary m365.finance on Anna's mailbox; primary m365.anna retained; external sent/received pair verifies alias delivery |
| Controlled recovery | Piotr excluded from DL: direct mail works; no DL copy reported for ten minutes; re-addition restores delivery to both members |
| Helpdesk shared mailbox | BFL-M365-Helpdesk; direct sign-in blocked captured; Piotr Full Access/Send As; Anna Full Access/Send on behalf; Marek opening denied with owner-reported working own Inbox |
| Calendar sharing | Anna Calendar: Marek reader tested, editor change verified, reader restored. Saved change and post-login inability to edit are owner-reported |
| Room policy | BFL-M365-Room-01, capacity metadata 6; automatic accept/decline; 30-day window; 2-hour maximum; recurrence and working-hours-only off; decline outside limits on |
| Room outcomes | 16 November 2026, Warsaw: Anna 11:00–11:30 accepted; Marek 11:15–11:45 declined with conflict reason; same Marek request 12:00–12:30 accepted |
| Room closure | Sign-in blocked and Anna's retained 11:00–11:30 reservation explicitly owner-confirmed |
| Reused collaboration site | Existing Baltic Finance Lab Public group / 28 members seen in Day 01; distinct from the new Private Finance group |
| Service health | Day 01: five Microsoft 365 suite advisories; separate Exchange/SharePoint/Teams rows unavailable in owner's view. No all-services-healthy conclusion |
| Clients | Owner reports Windows 11; Chrome 157.0.8103.52 for users; Edge 157.0.4341.46 for admins; both 64-bit. OS edition/build not recorded |
| Recovery accounts | Owner reports fresh bg01/bg02 sign-ins and active Global Administrator in Day 01; no recovery secrets published |

## Scope and evidence limits

Five resolved lab cases cover licensing, alias delivery, distribution membership, Helpdesk sender permission and room booking conflict. The current global matrix is **13 PASS / 19 NOT_RUN**. Client versions, job attributes, recovery-account checks, bounded non-receipt, selected calendar/session controls and room-account blocking include owner-reported data. Provisioning elapsed time, exact group/delegation propagation and room processing latency were not measured.

The first internal alias message's private headers name the primary recipient. Only the subsequent external pair is used as alias-target delivery proof. No tenant-wide sending-from-alias change, transport trace or independently audited sequence of every portal operation is claimed.

The Finance group's membership is configured, but direct private-site allowed/denied tests, Teams attachment/private channels, desktop activation, OneDrive sync/recovery, PowerShell reports and deliberate Copilot exercises remain future work. Day 04 covers shared-mailbox delegation and room/calendar behavior; it does not establish those later outcomes.

[Day 01](stages/01-tenant-and-roles.md) · [Day 02](stages/02-users-licenses-and-groups.md) · [Day 03](stages/03-exchange-recipients-and-mail.md) · [Day 04](stages/04-delegation-calendars-and-rooms.md) · [Current results](../tests/README.md) · [Evidence](../evidence/README.md)
