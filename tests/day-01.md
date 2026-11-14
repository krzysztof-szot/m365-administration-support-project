# Day 01 validation record

Stage status: **COMPLETE**. Execution date: **14 November 2026**. Evidence: **31 published screenshots**. These are manual functional checks and observations, supplemented by the owner's explicit report.

## Recorded checks

| Check | Kind | Actual result | State | Source |
| --- | --- | --- | --- | --- |
| Pilot license | Configuration | Business Premium with Copilot; Poland usage location | VERIFIED | [01](../evidence/day-01/01-pilot-license-assignment.png) |
| Outbound and inbound mail | Functional | Message sent to external Gmail; matching reply received | PASS | [02](../evidence/day-01/02-pilot-mail-sent.png), [03](../evidence/day-01/03-pilot-mail-received.png), owner delivery report |
| Ordinary-user admin attempt | Negative functional | Anna denied Microsoft 365 Admin Center access before and after MFA | PASS | [04](../evidence/day-01/04-pilot-admin-center-denied.png), [16](../evidence/day-01/16-pilot-admin-denied-after-mfa.png) |
| Pre-change sign-in | Diagnostic baseline | 07:15:27Z Exchange event: Success, single-factor, no authentication events; visible CA results Not applied/Disabled | OBSERVED | [05–07](../evidence/day-01/README.md) |
| MFA group | Configuration | Anna is sole direct member of SG-M365-MFA-Pilot | VERIFIED | [08](../evidence/day-01/08-mfa-pilot-group-members.png) |
| Authenticator availability | Configuration | Enabled for All users; Any mode; Optional registration; no excluded groups | VERIFIED | [09–09c](../evidence/day-01/README.md) |
| CA operator | Configuration | adm-lab: Direct, Active, Permanent Conditional Access Administrator at tenant scope | VERIFIED | [09b](../evidence/day-01/09b-ca-operator-role-assignment.png) |
| Pilot policy | Configuration | Pilot group; emergency accounts excluded; All resources; Multifactor authentication strength; Report-only then On | VERIFIED | [10–12](../evidence/day-01/README.md) |
| Report-only evaluation | Functional | 08:36:27Z: User action required; overall sign-in succeeds without enforcement by that report-only policy | PASS | [11](../evidence/day-01/11-report-only-signin-evaluation.png) |
| Authenticator registration | Configuration | Completed push MFA method shown in Anna's Security info | VERIFIED | [13](../evidence/day-01/13-pilot-registered-method.png) |
| Enforced pilot MFA | Functional | 08:54:24Z: MFA requirement satisfied by existing claim; pilot policy Success | PASS | [14](../evidence/day-01/14-signin-after-authentication-details.png), [14a](../evidence/day-01/14a-signin-after-basic-info.png), [15](../evidence/day-01/15-signin-after-conditional-access.png) |
| Fresh Authenticator approval | Optional diagnostic | Captured after-change records say Previously satisfied; no fresh approval method captured | NOT_CAPTURED | [14b](../evidence/day-01/14b-signin-mfa-claim-reuse.png) is supplementary claim reuse |
| Service health baseline | Observation | Microsoft 365 suite: five advisories; no separate Exchange/SharePoint/Teams rows in the available view | OBSERVED | [17](../evidence/day-01/17-service-health-baseline.png) |
| OneDrive and Word web | Functional | Document created and saved; contents retained after closing/reopening from OneDrive | PASS | [18](../evidence/day-01/18-onedrive-word-web-test.png) plus explicit owner confirmation of reopen |
| Teams self-chat | Functional | Sent message remains after refreshing | PASS | [19](../evidence/day-01/19-teams-web-self-chat-test.png) plus explicit owner confirmation of refresh |
| Standard-channel SharePoint files | Functional | Teams General files lead to SharePoint; document created in Documents > General and contents retained after reopen | PASS | [20](../evidence/day-01/20-sharepoint-library-file-test.png), [20a](../evidence/day-01/20a-sharepoint-library-location.png), owner confirmation |
| Added CA role cleanup | Configuration read-back | No matching active Conditional Access Administrator assignment on adm-lab | VERIFIED | [21](../evidence/day-01/21-ca-operator-role-removed.png) |
| Admin access after cleanup | Functional | adm-lab can open Microsoft 365 Active users after new sign-in | PASS | [22](../evidence/day-01/22-admin-access-after-role-removal.png) plus owner identification of the operator |
| Emergency access 01 | Recovery functional | New sign-in succeeds; active Global Administrator checked | PASS — REPORTED | Owner report; no screenshot or recovery secret published |
| Emergency access 02 | Recovery functional | New sign-in succeeds; active Global Administrator checked | PASS — REPORTED | Owner report; no screenshot or recovery secret published |
| Client context | Inventory observation | Windows 11; Chrome 157.0.8103.52 for Anna; Edge 157.0.4341.46 for admins; both 64-bit | RECORDED | Owner version-page report |

## Global matrix mapping

At Day 01 closure, the [32-check matrix](test-matrix.csv) snapshot was **4 PASS / 28 NOT_RUN**:

- **T01:** baseline functional access to Exchange, OneDrive/Word web, Teams web and SharePoint.
- **T02:** ordinary-user administrative attempt denied.
- **T03:** licensed pilot workload access, exercised early via the Exchange mail round trip.
- **T16:** standard-channel parent-site folder access, exercised early through the existing Baltic Finance Lab team.

T03 and T16 carried forward to Stages 02 and 07. Stage 02 has since completed; Stage 07 remains planned. The [current matrix summary](README.md) includes later execution. The detailed rows above are supporting checks, not extra global entries.

T19 remains NOT_RUN: Anna's baseline SharePoint write succeeded, but the planned explicit Member/Reader/Excluded permission comparison has not been performed. T23 remains NOT_RUN: viewing Service health alone does not complete the later support-triage exercise.

## Evidence limits and final state

MFA enforcement is supported by registration, the MFA-required successful event and the matching policy Success. A fresh push approval is not inferred from a reused claim. Baseline empty method details do not reconstruct a password sequence.

The mail-client timezone was not captured. Client versions and recovery checks are owner-reported. Capture 22's profile is not expanded; its operator identity is supplied by the owner.

The team/site was reused and is labelled Public group with 28 members. No new team, role-based SharePoint boundary, private-channel denial, incident root cause or validated Copilot output is claimed. Desktop activation, synchronization, version/recycle-bin recovery, scripts and later negative tests remain future work.

The pilot MFA policy remains On, the added CA role is removed, and synthetic test documents/chat remain. **No Pester or CI tests were run.**

[Stage 01 implementation](../docs/stages/01-tenant-and-roles.md) · [Evidence index](../evidence/day-01/README.md) · [Next stage](../docs/stages/02-users-licenses-and-groups.md)
