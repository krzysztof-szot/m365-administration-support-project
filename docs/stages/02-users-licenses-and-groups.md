# Stage 02 — Users, licenses and group types

Status: **COMPLETE**  
Execution date: **14 November 2026**  
Target days: 2–3 (planning estimate)  
Evidence: **21 screenshots**

## Objective and starting state

Prepare ordinary users, distinguish identity authentication from workload entitlement, and choose suitable group types. Anna and her licensed Exchange test T03 carry forward from Day 01. The existing tenant contains older lab objects, so new identities use the m365 prefix.

## Users and service recovery

| Pilot | Login alias | Final product | Department / Job title |
| --- | --- | --- | --- |
| M365 Anna Finance | m365.anna | Business Premium with Copilot | Finance is the design department; actual profile attributes not captured here |
| M365 Piotr Operations | m365.piotr | Business Premium | Operations / Operations Specialist, owner-reported |
| M365 Marek IT | m365.marek | Business Premium | IT / IT Support Trainee, owner-reported |

Piotr initially has Poland usage location and no license. He can open My Account, while Outlook reports HTTP 500 with **OwaUserHasNoMailboxAndNoLicenseAssignedException** at **10:50:51.023Z**. This separates a working identity from missing Exchange entitlement.

Assigned ordinary Premium and verified Exchange Online Plan 1 enabled. Piotr's mailbox then opens; a message to Anna and her reply are captured at displayed 12:09/12:12. Provisioning elapsed time was not supplied. [M365-001](../../tickets/M365-001-pilot-license-recovery.md) is resolved and **T04 PASS**. Marek's Premium assignment is also captured; Anna keeps the single Copilot seat.

## MFA scope and administrative role

Both new users registered Authenticator according to the owner and joined SG-M365-MFA-Pilot. The group now has three direct members. The existing CA policy returns Success for Piotr's **My Signins** event and Marek's **One Outlook Web** event. Those tabs do not show Authentication requirement or a fresh approval method.

For Exchange recipient work, adm-lab receives **Exchange Recipient Administrator**, Direct/Active/Permanent at tenant scope (15). It remains assigned for upcoming Exchange tasks and requires manual review/removal when that scope ends. The wider historical role set is not a new least-privilege redesign. The original group-view capture was viewed as bg01; not all setup actions have independent operator audit evidence.

## Group types and actual configuration

| Type / resource | Recorded purpose and configuration |
| --- | --- |
| Security: SG-M365-MFA-Pilot | Defines the three users targeted by the existing MFA policy |
| Microsoft 365: BFL-M365-Finance | Private; owner Anna; explicit members Anna/Piotr; alias bfl-m365-finance; site link captured; Teams not added |
| Distribution: DL-M365-Finance | Owner Anna; members Anna/Piotr; alias dl-m365-finance; distributes messages to member mailboxes |

DL delivery settings are owner-reported: internal senders only, no specified-sender restriction, moderation off. Marek sends to the DL at displayed 13:01. Anna/Piotr receive; Marek reports no Inbox/Junk copy after ten minutes. This exercises **T06 early**, without equating recipient membership with sender permission. Stage 03 adds removal/recovery.

## Exit checks and final state

- [x] Correct entitlement restores the selected workload.
- [x] Group owners and members match the recorded configuration.
- [x] Provisioning delay is distinguished from configuration failure; elapsed time is recorded as unmeasured.
- [x] Ordinary-user testing verifies mail behavior after the change.

The owner waived job-profile screenshots; profile completion is reported. Closed DL join/leave was requested but not explicitly confirmed. No full SharePoint permission boundary, private channel, desktop activation or validated Copilot exercise is claimed.

All three pilots, both new Finance groups and the extended MFA scope remain. Stage 07 will add Teams to the existing Microsoft 365 group rather than create another group.

[Results](../../tests/day-02.md) · [21 evidence captions](../../evidence/day-02/README.md) · [Access matrix](../access-matrix.md) · [Next: Stage 03](03-exchange-recipients-and-mail.md)
