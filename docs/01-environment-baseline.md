# Environment baseline

Status: **DAY 01 BASELINE COMPLETE**, 14 November 2026. This project reuses an existing identity lab and adds a distinct M365 pilot.

| Field | Recorded state and source |
| --- | --- |
| Products | Owner-supplied active subscription views: Business Standard 25 seats; Business Premium 25; Business Premium with Copilot 1 |
| Billing decisions | Recurring billing off reported privately; billing records are not published |
| Historical subscriptions | E5 and Entra Suite reported disabled/expired; old assignments and policies remain background state |
| Ordinary pilot | M365 Anna Finance / m365.anna; Business Premium with Copilot and Poland usage location captured in 01 |
| Service plans | Exchange, SharePoint, Teams, Apps, Entra P1 and Copilot reported enabled; expanded service plans not captured |
| Administrator | Existing adm-lab; ordinary Premium assignment reported; historical broad role set remains |
| Temporary use of CA role | Direct/Active/Permanent Conditional Access Administrator captured in 09b; manually removed in 21 |
| Browser workload results | Exchange round trip; OneDrive/Word web and SharePoint create/save/reopen; Teams self-chat persistence |
| User/admin boundary | Anna explicitly denied Admin Center before and after MFA; adm-lab access after cleanup reported and list shown in 22 |
| Baseline Exchange sign-in | 07:15:27Z: Success, single-factor, no method events; visible CA policies Not applied/Disabled |
| Pilot group | SG-M365-MFA-Pilot; Anna is sole captured direct member |
| Authenticator | Enabled, All users, Any mode, registration Optional, no excluded groups; Anna's completed push method captured |
| Pilot CA policy | CA-M365-001-Require-MFA-Pilot; pilot group; both emergency accounts excluded; All resources; Multifactor authentication strength |
| Policy evaluation | 08:36:27Z Report-only: User action required; later saved On |
| Enforced sign-in | 08:54:24Z: MFA requirement, claim reuse and pilot policy Success; no fresh push approval captured |
| Existing collaboration site | Baltic Finance Lab > Documents > General; Public group, 28 members visible; reused rather than provisioned in this stage |
| Service health | Microsoft 365 suite: five advisories. Separate Exchange/SharePoint/Teams service rows not present in the owner's available view |
| OS | Windows 11, owner-reported; edition/build not recorded |
| User browser | Chrome 157.0.8103.52, 64-bit, owner-reported |
| Admin browser | Edge 157.0.4341.46, 64-bit, owner-reported |
| Recovery validation | Owner reports fresh bg01/bg02 sign-ins and active Global Administrator for both; no screenshots or secrets published |

## Baseline conclusion and later work

The Day 01 baseline exit checks are complete. License assignment and configuration are distinguished from functional tests; reported recovery/refresh actions are explicitly attributed.

The reused administrator's wider roles are background state, not a newly implemented least-privilege design. Removing the added CA role does not establish removal of all possible administrative access. The public team's membership and permission model will be examined later.

Desktop Office activation, deliberate Copilot exercises/output validation, explicit permission-role comparisons, private-channel isolation, synchronization and data recovery are not established by this baseline. Client versions are recorded as supplied, without a compatibility audit or OS build inventory.

[Stage 01 notes](stages/01-tenant-and-roles.md) · [31 evidence captions](../evidence/day-01/README.md) · [Results](../tests/day-01.md) · [Copilot pilot plan](copilot-pilot-plan.md)
