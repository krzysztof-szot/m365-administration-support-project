# Day 01 validation record

Stage status: **IN_PROGRESS**. Evidence event date: **14 November 2026**. Screenshot capture times were not supplied.

The following manual results are supported by the owner's screenshots and report. They are not automated tests.

| Check | Kind | Observed result | State | Evidence |
| --- | --- | --- | --- | --- |
| Anna's license assignment | Configuration | Business Premium with Copilot selected; Poland usage location | VERIFIED | [01](../evidence/day-01/01-pilot-license-assignment.png) |
| Outbound mail record and reply | Functional | Synthetic mail appears in Sent Items to external Gmail; matching reply is present and owner reports delivery | PASS | [02](../evidence/day-01/02-pilot-mail-sent.png), [03](../evidence/day-01/03-pilot-mail-received.png) |
| Incoming external reply | Functional | Gmail reply is visible in Anna's Inbox | PASS | [03](../evidence/day-01/03-pilot-mail-received.png) |
| Ordinary-user administration boundary | Functional negative | Admin Center explicitly denies Anna access to view or manage the page | PASS | [04](../evidence/day-01/04-pilot-admin-center-denied.png) |
| Pre-change authentication | Diagnostic baseline | Interactive Exchange event is successful with Single-factor authentication; no method sequence is recorded; visible CA policies are Not applied/Disabled | OBSERVED | [05](../evidence/day-01/05-signin-before-basic-info.png), [06](../evidence/day-01/06-signin-before-authentication-details.png), [07](../evidence/day-01/07-signin-before-conditional-access.png) |
| MFA pilot membership | Configuration | SG-M365-MFA-Pilot contains Anna as its only direct member | VERIFIED | [08](../evidence/day-01/08-mfa-pilot-group-members.png) |
| Authenticator overview | Configuration baseline | Enabled=Yes and Target=All users; mode and effective exclusions not captured | PARTIAL | [09](../evidence/day-01/09-authenticator-method-scope.png) |
| Report-only MFA policy evaluation | Functional | Policy creation/evaluation not performed in the supplied record | NOT_RUN | None |
| Enforced MFA and user recovery | Functional | No after-change challenge or successful MFA policy result yet | NOT_RUN | None |
| Remaining services and admin/recovery checks | Functional | Teams, SharePoint, OneDrive, desktop activation, scoped admin context and recovery remain incomplete | NOT_RUN | None |

## Global matrix mapping

The [32-check global matrix](test-matrix.csv) now records **T02 PASS** for the Admin Center denial and **T03 PASS** for selected workload access (Exchange). T03 was exercised early during Stage 01; Stage 02's remaining learning work is still planned. The other **30 global checks remain NOT_RUN**.

The additional rows above document configuration, baseline and mail observations. They are not added to the global check count and do not establish Stage 01 completion.

## Evidence limits

The successful sign-in captured at 07:15:27Z is not necessarily the original password-change interaction or the exact mail-send request. The mail client's displayed timezone was not recorded. No tenant-wide MFA conclusion, full session trace, Copilot output, new CA policy, service-health check or desktop-client activation is claimed.

The reported denial is a Microsoft 365 Admin Center boundary check, not exhaustive testing of all administration APIs. No Pester or CI tests have been run for this project.
