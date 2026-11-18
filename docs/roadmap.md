# Thirty-day learning roadmap

Status: **Stages 01–13 COMPLETE; Stage 14 IN_PROGRESS.** There are 153 indexed captures, fifteen resolved lab cases and **32 PASS / 0 NOT_RUN**. See [Day 01](../tests/day-01.md), [Day 02](../tests/day-02.md), [Day 03](../tests/day-03.md), [Day 04](../tests/day-04.md), [Day 05](../tests/day-05.md), [Day 06](../tests/day-06.md), [Day 07](../tests/day-07.md), [Day 08](../tests/day-08.md), [Day 09](../tests/day-09.md), [Day 10](../tests/day-10.md), [Day 11](../tests/day-11.md) and [Day 12](../tests/day-12.md). T16 was first passed early and rechecked on the new Finance Team; T17 is newly passed. Stage 08 adds T18–T20 on the independent knowledge site, with a revoked-link/library-access comparison and an isolated folder restriction/restoration.

The target workload is about 50–65 hours including documentation. The ranges below are estimates, not elapsed execution dates. Record the actual subscription expiry privately and shorten the schedule if necessary. Save evidence after each session rather than waiting until the end.

| Stage | Target days | Topic | Execution | Active-work estimate |
| --- | --- | --- | --- | --- |
| 01 | 1 | [Tenant baseline and administrative roles](stages/01-tenant-and-roles.md) | COMPLETE | 3–4 h |
| 02 | 2–3 | [Users, licenses and group types](stages/02-users-licenses-and-groups.md) | COMPLETE | 3–4 h |
| 03 | 4–5 | [Exchange recipients, aliases and distribution](stages/03-exchange-recipients-and-mail.md) | COMPLETE | 3–4 h |
| 04 | 6–7 | [Shared mailboxes, calendars and room booking](stages/04-delegation-calendars-and-rooms.md) | COMPLETE | 4–5 h |
| 05 | 8–9 | [Mail-flow troubleshooting and recovery](stages/05-mail-flow-troubleshooting.md) | COMPLETE | 4–5 h |
| 06 | 10–11 | [Outlook and Microsoft 365 Apps](stages/06-outlook-and-microsoft-365-apps.md) | COMPLETE | 3–4 h |
| 07 | 12–13 | [Teams and connected SharePoint sites](stages/07-teams-and-connected-sites.md) | COMPLETE | 3–4 h |
| 08 | 14–16 | [SharePoint structure, permissions and sharing](stages/08-sharepoint-and-sharing.md) | COMPLETE | 5–6 h |
| 09 | 17–18 | [OneDrive synchronization and file recovery](stages/09-onedrive-sync-and-recovery.md) | COMPLETE | 3–4 h |
| 10 | 19–20 | [Support operations and user knowledge](stages/10-support-operations-and-knowledge.md) | COMPLETE | 3–4 h |
| 11 | 21–23 | [Read-only operational PowerShell reports](stages/11-powershell-reporting.md) | COMPLETE | 6–8 h |
| 12 | 24–25 | [Employee onboarding, access change and offboarding](stages/12-employee-lifecycle.md) | COMPLETE | 4–5 h |
| 13 | 26–27 | [Cross-workload practical validation](stages/13-independent-capstone.md) | COMPLETE | 4–5 h |
| 14 | 28–30 | [Portfolio review and lab closure](stages/14-portfolio-and-lab-closure.md) | IN_PROGRESS | 2–3 h |

The hour ranges total 50–65 hours including learning, screenshots and documentation; they are estimates, not measured elapsed work. The Copilot extension adds 5–7 hours. Learning-unit labels do not establish calendar dates: Stages 01–04 were all executed on 14 November 2026; Stages 05–09 were executed on 16 November 2026. Stage 06 used the dedicated BFL-WKS01 VM, activated Microsoft 365 Apps and classic Outlook, and verified identity/offline recovery plus existing calendar/Helpdesk delegation. Stage 07 attached Teams to Finance, verified standard/private file boundaries and temporary channel membership, and tested a computer/phone meeting with audio and screen sharing. Stage 08 verifies the independent knowledge site, reader/editor roles, metadata, link revocation and restored folder inheritance; its original DOCX lock recovery includes the owner's closure/waiting explanation.

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

The one-seat [Copilot pilot](copilot-pilot-plan.md) adds three planned sessions within Stages 06, 08, 10 and 13. License assignment is captured; generated output and permission-sensitive retrieval are not yet tested. Ordinary Premium seats support the wider M365 pilot. Stage 06 core client completion does not mark the optional Copilot session complete; it remains unexecuted.

Stage 09 adds T21/T22 and M365-013/014: work OneDrive pause/resume, Files On-Demand, version-content restore and deleted-file restore. The original file ends at full V1 with healthy sync; the Downloads V2 helper is retained outside OneDrive. At Stage 09 closure, Stage 10 remained planned.

Stage 10 was executed on 17 November 2026: current service/change review, three English procedures plus a German companion, selected reader reproductions, case triage review and a prepared second-line package. It adds T23 and records the directly repeated T31 result. Article reproductions are not counted as new backlog incidents; the RBAC exception remains unresolved and the package was not sent.


## Stage 11 execution

Executed on 17 November 2026 on the physical laptop: three read-only reports, selected fresh portal reconciliation, 124-row partial mixed-target control, same-session own/Helpdesk visibility contrast and successful operator recovery. T24/T25 add two matrix passes; 25 synthetic offline cases remain separate. No live 403 or full role diagnosis is asserted. The broad Graph session and persistent consent setup are disclosed; the Stage 05 RBAC exception remains unresolved.

## Stage 12 execution

Executed on 17 November 2026: existing-user readiness, Operations → IT mover with old/new access controls, saved block and fresh denied sign-in, selected-file custody and existing-mailbox SharedMailbox conversion. Wrong delegate identity was corrected and verified. License removal follows inspected Exchange facts; Anna mail/copy and active-owner controls remain usable. T26–T28 PASS, M365-015 RESOLVED. Knowledge effective-level inspection is inconclusive with its actual policy message retained; this is not a complete access purge. [Stage record](stages/12-employee-lifecycle.md) · [Verified runbook](../runbooks/employee-lifecycle.md).

## Final review scope

Stage 13 is COMPLETE for its revised five-task practical scope, adopted 18 November 2026. The owner used supplied procedures. T32 is PASS against the revised practical criterion; the original independent-assessment requirement was replaced and was not independently assessed. Stage 14 is IN_PROGRESS, with resource retention selected and public-only preservation/audit recorded. [Day 13 results](../tests/day-13.md) · [Closure](lab-closure.md).
