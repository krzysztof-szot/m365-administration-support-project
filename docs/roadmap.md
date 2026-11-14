# Thirty-day learning roadmap

Status: **Stage 01 IN_PROGRESS; Stages 02–14 PLANNED.** Nine Day 01 captures support initial Exchange/access tests and the pre-change MFA baseline. See the [result record](../tests/day-01.md).

The target workload is about 50–65 hours including documentation. The ranges below are estimates, not elapsed execution dates. Record the actual subscription expiry privately and shorten the schedule if necessary. Save evidence after each session rather than waiting until the end.

| Stage | Target days | Topic | Execution |
| --- | --- | --- | --- |
| 01 | 1 | [Tenant baseline and administrative roles](stages/01-tenant-and-roles.md) | IN_PROGRESS |
| 02 | 2–3 | [Users, licenses and group types](stages/02-users-licenses-and-groups.md) | PLANNED |
| 03 | 4–5 | [Exchange recipients, aliases and distribution](stages/03-exchange-recipients-and-mail.md) | PLANNED |
| 04 | 6–7 | [Shared mailboxes, calendars and room booking](stages/04-delegation-calendars-and-rooms.md) | PLANNED |
| 05 | 8–9 | [Mail-flow troubleshooting and recovery](stages/05-mail-flow-troubleshooting.md) | PLANNED |
| 06 | 10–11 | [Outlook and Microsoft 365 Apps](stages/06-outlook-and-microsoft-365-apps.md) | PLANNED |
| 07 | 12–13 | [Teams and connected SharePoint sites](stages/07-teams-and-connected-sites.md) | PLANNED |
| 08 | 14–16 | [SharePoint structure, permissions and sharing](stages/08-sharepoint-and-sharing.md) | PLANNED |
| 09 | 17–18 | [OneDrive synchronization and file recovery](stages/09-onedrive-sync-and-recovery.md) | PLANNED |
| 10 | 19–20 | [Support operations and user knowledge](stages/10-support-operations-and-knowledge.md) | PLANNED |
| 11 | 21–23 | [Read-only operational PowerShell reports](stages/11-powershell-reporting.md) | PLANNED |
| 12 | 24–25 | [Employee onboarding, access change and offboarding](stages/12-employee-lifecycle.md) | PLANNED |
| 13 | 26–27 | [Independent administration and troubleshooting assessment](stages/13-independent-capstone.md) | PLANNED |
| 14 | 28–30 | [Portfolio review and lab closure](stages/14-portfolio-and-lab-closure.md) | PLANNED |

## Learning method

1. Explain the requirement, the affected identities and the expected behavior.
2. Inspect the current state and record the role, client and workload context.
3. Make the smallest justified lab change.
4. Verify allowed access and a relevant denied or failure case.
5. Introduce only the documented, reversible training condition.
6. Diagnose from observations and verify recovery plus a control/regression case.
7. Record the reasoning in English using the [lab template](LAB-NOTE-TEMPLATE.md).

Tickets are maintained throughout the project. Stage 10 reviews their quality; it is not the first day tickets are written.

## Exit criteria

The target deliverables are 15 documented support cases, 32 executed functional checks, three verified read-only reports, user articles and a lifecycle runbook. A failed or blocked result can still be useful evidence when the limitation and next action are accurate. Completion is never inferred from a file or directory existing.

The independent assessment contains five tasks without a supplied repair sequence. The operator may use their own notes and official documentation. Results include justified escalation where appropriate.

Optional extensions after the core: an owned custom domain with SPF/DKIM/DMARC, or controlled sharing with an owned external test identity. Entitlements and sharing policy must be checked before these exercises.

## Copilot extension

The one-seat [Copilot pilot](copilot-pilot-plan.md) adds three planned sessions within Stages 06, 08, 10 and 13. License assignment is captured; generated output and permission-sensitive retrieval are not yet tested. Ordinary Premium seats support the wider M365 pilot.
