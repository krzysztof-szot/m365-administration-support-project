# Environment baseline and current lab state

Current state after **Stages 01–10 COMPLETE**. Stages 01–04 were executed **14 November 2026**; Stages 05–09 were executed **16 November 2026**. Stage 10 was executed **17 November 2026**. Stage/day labels identify learning units; the roadmap's target-day ranges are estimates.

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
| Exchange operator role | adm-lab Exchange Recipient Administrator: last captured Direct/Active, tenant scope, Permanent; retained for Exchange lab work. No removal reported through Day 05. Trace worked as adm-lab per owner; rule creation control was absent |
| Historical admin context | User Administrator and other roles on reused adm-lab were background; not an overall least-privilege redesign. Some actions lack independent operator audit attribution |
| Stage 05 rule operator | Rule configuration and disable operations attributed to bg01 by owner; current Global Administrator and selected Role Management/Transport Rules in Organization Management owner-confirmed |
| Stage 05 delegation exception | RG-M365-Lab-Transport-Rules creation/grant not verified after a delegating-role-assignment error; effective assignments and possible partial state not audited; Exchange PowerShell deferred |
| Transport rule retained | TR-M365-001-Lab-Block-Marek-To-Piotr: final Disabled / mode Enforce; Marek AND Piotr AND subject [LAB-BLOCK]; rejection/control/recovery verified |
| Private collaboration group and Team | BFL-M365-Finance; From a group and Private confirmed in Stage 07; Anna Owner, Piotr Member, Marek not listed; parent site /sites/bfl-m365-finance |
| Standard-channel files | Finance-Operations; Piotr opens/edits/saves STANDARD-01 through Teams and SharePoint; Anna sees saved change after reopening |
| Private-channel boundary | Finance-Confidential at /sites/BFL-M365-Finance-Finance-Confidential; initial Piotr denial, temporary membership access, removal and fresh denial with working standard control; final Anna only, owner-confirmed |
| Knowledge communication site | /sites/BFL-M365-Knowledge; Anna Full Control, Marek Edit, Piotr Read; independent of Finance; Day 08 01/02 |
| Knowledge document | Original LAB-D08-KB-01.docx with Mail/Draft; Marek save and Anna reopen owner-confirmed; Piotr Viewing/edit unavailable in 04; T18/T19 PASS |
| Knowledge link and folder boundary | Specific people/Piotr/Can view owner-confirmed; selected link removed and old URL invalid while library access remains; folder Visitors grant temporarily removed, Piotr denied with controls, inheritance/TXT access restored; T20 PASS |
| DOCX lock and cleanup | Original recovers after Anna closes Word/waits per owner; exact release interval/service mechanism not measured; helpers KB-02 and LOCK-CONTROL removed per owner |
| Meeting | Anna computer / Piotr phone with Teams app; received screen share captured; two-way audio, view change and meeting closure owner-confirmed |
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
| Service health | Day 01: five suite advisories; separate Exchange/SharePoint/Teams rows unavailable then. Day 05: Exchange two advisories concerning cross-tenant free/busy and contacts/Speed Dial; no broad delivery-outage inference |
| Original browser clients | Owner reports Windows 11; Chrome 157.0.8103.52 for users; Edge 157.0.4341.46 for admins; both 64-bit. Original browser host edition/build not recorded; Stage 06 VM recorded separately below |
| Stage 06 workstation | BFL-WKS01 on VMware Workstation Pro; lab-only VM, Windows 11 Enterprise Evaluation build 26100 and 4 GB RAM per owner; initial connectivity later reported restored, exact cause/repair unverified |
| Desktop clients | Apps installed inside VM; Microsoft 365 Apps for business active as Marek; Word and classic Outlook Version 2610 / Build 20527.20196 / Current Channel; Outlook 64-bit owner-confirmed; new Outlook installed but not tested |
| Desktop identity and recovery | Piotr active Word user while subscription still names Marek; Marek restored and document/mail checks pass. Work Offline discrepancy corrected; same OFFLINE-01 and new SYNC-02 succeed |
| Desktop delegated resources | Marek opens Anna CAL-01 as Read-Only; Piotr reads/replies in Helpdesk and completes return reply flow. Marek profile/active Word restored per owner; extra Piotr profile deletion not reported |
| OneDrive client | BFL-WKS01 / Marek work account; 26.204.1019.0007, 64-bit owner-reported; initial and final Backed up and synced |
| OneDrive recovery state | M365-Lab-D09/LAB-D09-SYNC-01.txt restored to full V1 through history and recycle bin; T21/T22 PASS; separate V2 helper retained in VM Downloads outside OneDrive |
| Support review | Day 10 adm-lab 05:40 Poland; MO1489432 Service degradation owner-reported, lab occurrence not checked; MC1545696 future PDF announcement reviewed |
| User knowledge | Four DOCX procedures visible in Knowledge; Piotr reads without editing; Helpdesk, sharing and scoped EN/DE recovery branches reproduced with attributed limits |
| Stage 10 recovery and escalation | Separate D10 TXT at full V1 with healthy sync; case review and RBAC second-line package prepared, not externally submitted; original RBAC error remains unresolved |
| Recovery accounts | Owner reports fresh bg01/bg02 sign-ins and active Global Administrator in Day 01; no recovery secrets published |

## Scope and evidence limits

Fourteen resolved lab cases cover licensing, alias delivery, distribution membership, Helpdesk sender permission, room booking conflict, expected unknown-recipient diagnosis, scoped rule recovery, wrong active Office identity, offline-client synchronization, private-channel authorization/restoration, knowledge reader/editor roles, retained access after link revocation, paused OneDrive sync and version/deleted-file recovery. The current global matrix is **26 PASS / 6 NOT_RUN**. Client versions, job attributes, recovery-account checks, bounded non-receipt, selected calendar/session controls and room-account blocking include owner-reported data. Provisioning elapsed time, exact group/delegation propagation and room processing latency were not measured.

The first internal alias message's private headers name the primary recipient. Only the subsequent external pair is used as alias-target delivery proof. No tenant-wide sending-from-alias change or Day 03 alias transport trace is claimed; Stage 05 separately provides Trace for baseline, invalid-recipient and rule tests. An independently audited sequence of every portal operation is not established.

Stage 06 verifies desktop activation and classic Outlook operation, not device registration/MDM enrollment or a Copilot exercise. Local Word save/reopen does not validate OneDrive synchronization.

Stage 07 adds actual Finance Team and private-channel access tests, separate SharePoint site roots and a computer/phone meeting. Stage 08 verifies the independent knowledge site, roles, sharing-link revocation and an isolated folder boundary restored at closure. Stage 09 verifies Marek's work OneDrive client, Files On-Demand, pause/resume and full-content version/recycle-bin restoration. PowerShell reports and deliberate Copilot exercises remain future work. The original DOCX lock recovery follows closure/waiting according to the owner; no precise release time is claimed. Day 04 covers shared-mailbox delegation and room/calendar behavior; it does not establish those later outcomes. Day 05 confirms transport delivery after rule disable; RULE-03 opening is not separately confirmed, exact rule-propagation time was not measured, and the custom-role-group delegation exception remains unresolved.

[Day 01](stages/01-tenant-and-roles.md) · [Day 02](stages/02-users-licenses-and-groups.md) · [Day 03](stages/03-exchange-recipients-and-mail.md) · [Day 04](stages/04-delegation-calendars-and-rooms.md) · [Day 05](stages/05-mail-flow-troubleshooting.md) · [Day 06](stages/06-outlook-and-microsoft-365-apps.md) · [Day 07](stages/07-teams-and-connected-sites.md) · [Day 08](stages/08-sharepoint-and-sharing.md) · [Day 09](stages/09-onedrive-sync-and-recovery.md) · [Day 10](stages/10-support-operations-and-knowledge.md) · [Current results](../tests/README.md) · [Evidence](../evidence/README.md)

Day 09 text comparisons do not establish byte/hash equality, final pin retention, configured retention, Known Folder Move or independent backup coverage. The corrected paused frame shows label mismatch with a mixed third line; full baseline recovery is visible separately.

Stage 10 adds user knowledge validation and T23/T31. Capture 04 shows full local V1 and cloud file presence; full cloud contents, deletion propagation and final health are owner-confirmed. The EN procedure used extra chat guidance and DE reproduced its deleted-file branch. Article metadata approval, current protected-PDF annotation, independent assessment and external escalation submission are not claimed.
