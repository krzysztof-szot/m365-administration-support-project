# Stage 01 — Tenant baseline and administrative roles

Status: **IN_PROGRESS**  
Target days: 1  
Evidence event date: 14 November 2026  
Published screenshots: 9

## Learning objective

Establish the actual service baseline, separate administrative work from ordinary user activity and verify authentication/authorization through user behavior and sign-in records.

## Recorded environment

This project reuses the owner's existing Baltic Finance identity lab. Historical E5/Entra Suite assignments and CA policies are background configuration, not newly implemented M365 project results. The owner reported that E5 and Entra Suite are disabled/expired.

The owner supplied subscription screens showing Business Standard (25 seats), Business Premium (25 seats) and Business Premium with Copilot (1 seat) active. Subscription/billing details stay private. The owner reported disabling recurring billing and assigning ordinary Business Premium to the existing adm-lab identity.

Anna was created as the distinct m365.anna pilot. The published [license capture](../../evidence/day-01/01-pilot-license-assignment.png) shows Business Premium with Copilot and Poland usage location. Service-plan availability was reported by the owner; Apps is collapsed in that image. Client versions and all workload behaviors are not yet recorded.

## Implementation and observed behavior

1. Created/licensed the ordinary Anna pilot and performed the reported first sign-in/password change.
2. Tested email with an **external Gmail mailbox**. Anna's Sent Items shows a synthetic message at displayed time 08:41, and her Inbox shows the corresponding Gmail reply at 08:44 on 14 November 2026. The client timezone was not captured.
3. Confirmed a direct Microsoft 365 Admin Center denial for Anna.
4. Inspected an interactive One Outlook Web / Office 365 Exchange Online event at **2026-11-14T07:15:27Z**. It succeeded with a Single-factor authentication requirement.
5. Retained the empty Authentication Details message and visible CA results of Not applied/Disabled for that same record. These tabs do not reconstruct a complete password/MFA sequence; the separate Report only tab was not captured.
6. Created SG-M365-MFA-Pilot with Anna as its one direct member.
7. Inspected Authentication methods: Microsoft Authenticator is enabled for All users in the overview. Detailed mode, exclusions and Anna's registration status still need verification.

See the [result record](../../tests/day-01.md) and [nine screenshots](../../evidence/day-01/README.md).

## Finding and next action

The selected Exchange event did not require MFA and shows no applied policy in the captured Conditional Access tab. The exact scope/condition reason for each Not applied result has not been established. Enabling an authentication method and requiring MFA are separate controls.

Next: capture the detailed Authenticator mode/scope, confirm a task-appropriate CA operator role, create a policy restricted to the licensed M365 pilot in Report-only, observe its evaluation, then deliberately enforce and verify MFA with a recovery path. These are planned actions, not completed results.

## Exit checks

- [ ] An authorized administrative operation is recorded with the actual operator role/scope; the owner reported use of adm-lab but no dedicated operator-role capture is published.
- [x] An ordinary pilot is denied Microsoft 365 Admin Center access.
- [ ] The required workloads are functionally verified; Exchange works but other service checks remain.
- [ ] Pilot MFA is enforced and verified through the matching user experience and logs.
- [ ] Administrative recovery, relevant client versions and Service health are recorded.

## Evidence and recording rules

Every guided action has an explicit screenshot checkpoint and filename. See the [Day 01 checklist](../../evidence/day-01/README.md). Never capture enrollment QR codes, passwords or authentication secrets.

Do not infer functioning Copilot from its visible Outlook button or working Office desktop activation from an assigned product. Keep the baseline and after-change evidence distinct.

[Back to stage index](README.md) · [Environment baseline](../01-environment-baseline.md)
