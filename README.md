# Microsoft 365 Administration & Support — Baltic Finance Lab

A hands-on administration and troubleshooting project for a fictional small workplace. The scope connects Exchange Online, Outlook, Teams, SharePoint Online, OneDrive and Microsoft 365 Apps through synthetic service requests and controlled failure/recovery exercises.

**Status: scaffold ready; lab execution pending.** The owner has reported an active 30-day Microsoft 365 Business Standard trial. Enabled services, Teams entitlement, pilot seats, roles and client versions have not yet been independently recorded. No workload exercise or functional test is claimed as completed.

## Objective

Prepare users for work, diagnose mail and collaboration problems, make a scoped change and verify the outcome from the affected user's session. The target roles are Junior Microsoft 365 Administrator, Junior System Administrator and IT Support Specialist.

Each stage follows: understand the requirement → record the starting state → configure → test as a user → introduce a controlled problem → diagnose and recover → document the observed result.

## Lab scope

- Three planned licensed synthetic users: Anna Finance, Piotr Operations and Marek IT.
- Separate administrative identities with task-appropriate roles and MFA.
- One Helpdesk shared mailbox, a Finance team/Microsoft 365 group, a knowledge site and a room mailbox.
- A dedicated Windows lab profile or VM, browser identity separation and versioned client notes.
- Default onmicrosoft.com domain for the core; an owned custom domain is optional.

The tenant is a personal learning environment. It does not represent a production deployment or a regulated organization's security/compliance assessment. See the [baseline](docs/01-environment-baseline.md), [access matrix](docs/access-matrix.md) and [architecture](docs/architecture.md).

## Thirty-day roadmap

The learning plan contains 14 stages and approximately 50–65 hours including documentation. Day ranges are planning targets and must fit the actual trial end date. Evidence is saved continuously; the final days are a buffer.

| Stage | Target days | Topic | Execution |
| --- | --- | --- | --- |
| 01 | 1 | [Tenant baseline and administrative roles](docs/stages/01-tenant-and-roles.md) | PLANNED |
| 02 | 2–3 | [Users, licenses and group types](docs/stages/02-users-licenses-and-groups.md) | PLANNED |
| 03 | 4–5 | [Exchange recipients, aliases and distribution](docs/stages/03-exchange-recipients-and-mail.md) | PLANNED |
| 04 | 6–7 | [Shared mailboxes, calendars and room booking](docs/stages/04-delegation-calendars-and-rooms.md) | PLANNED |
| 05 | 8–9 | [Mail-flow troubleshooting and recovery](docs/stages/05-mail-flow-troubleshooting.md) | PLANNED |
| 06 | 10–11 | [Outlook and Microsoft 365 Apps](docs/stages/06-outlook-and-microsoft-365-apps.md) | PLANNED |
| 07 | 12–13 | [Teams and connected SharePoint sites](docs/stages/07-teams-and-connected-sites.md) | PLANNED |
| 08 | 14–16 | [SharePoint structure, permissions and sharing](docs/stages/08-sharepoint-and-sharing.md) | PLANNED |
| 09 | 17–18 | [OneDrive synchronization and file recovery](docs/stages/09-onedrive-sync-and-recovery.md) | PLANNED |
| 10 | 19–20 | [Support operations and user knowledge](docs/stages/10-support-operations-and-knowledge.md) | PLANNED |
| 11 | 21–23 | [Read-only operational PowerShell reports](docs/stages/11-powershell-reporting.md) | PLANNED |
| 12 | 24–25 | [Employee onboarding, access change and offboarding](docs/stages/12-employee-lifecycle.md) | PLANNED |
| 13 | 26–27 | [Independent administration and troubleshooting assessment](docs/stages/13-independent-capstone.md) | PLANNED |
| 14 | 28–30 | [Portfolio review and lab closure](docs/stages/14-portfolio-and-lab-closure.md) | PLANNED |

See the [English roadmap](docs/roadmap.md) and [Polish coaching plan](PROJECT-PLAN_PL.md). All 14 learning stages remain planned.

## Planned portfolio outcomes

- 15 synthetic support cases with diagnostic decisions and observed outcomes.
- 32 defined functional checks, including denied-access and recovery checks.
- Three small read-only PowerShell reports, reconciled with independent workload reads.
- User knowledge articles, including one German-language companion.
- An onboarding, department-change and offboarding runbook.
- An independent five-task assessment and an accurate lab closure note.

These are targets, not achieved results. All test rows currently read `NOT_RUN`. Scripts and completed incident records will be added only after implementation.

## Project map

| Path | Purpose |
| --- | --- |
| [docs/stages/](docs/stages/README.md) | Learning objectives, exercises and exit checks for 14 stages |
| [docs/](docs/roadmap.md) | Roadmap, baseline, access model and architecture |
| [tickets/](tickets/README.md) | Support workflow and case template |
| [samples/](samples/README.md) | Synthetic identities and planned ticket backlog |
| [tests/](tests/README.md) | Functional check matrix and result rules |
| [scripts/](scripts/README.md) | Planned report contracts; no executable scripts yet |
| [runbooks/](runbooks/README.md) | Lifecycle procedure template and later verified procedures |
| [knowledge-base/](knowledge-base/README.md) | Planned user-facing articles |
| [evidence/](evidence/README.md) | Evidence handling and future sanitized captures |
| [.github/ISSUE_TEMPLATE/](.github/ISSUE_TEMPLATE/lab-stage.yml) | Structured lab-stage and support-case issue forms |

## Completion and publication rules

A configuration screenshot does not establish successful mail delivery, effective access, Office activation or recovered file content. Record the test identity, client, expected behavior, actual observation and supporting evidence. Separate hypotheses from confirmed causes.

Use only synthetic content and sanitized evidence. Raw exports, private tenant configuration, tokens, recovery codes, billing data and personal mailbox files stay local. The [.gitignore](.gitignore) reduces accidental inclusion; it does not replace reviewing every change.

Intune, PIM, Conditional Access implementation, Exchange hybrid deployment, Teams Phone, paid Copilot and advanced retention/holds are outside the core scope. Required capabilities must be checked against the actual subscription. [Official Microsoft references](docs/sources.md).

## Starting point

Begin with [Stage 01 — tenant baseline and roles](docs/stages/01-tenant-and-roles.md). Follow the [contribution and recording workflow](CONTRIBUTING.md). No real tenant identifiers or credentials are needed to read this repository.
