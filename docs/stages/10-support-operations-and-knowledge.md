# Stage 10 — Support operations and user knowledge

Status: COMPLETE  
Target days: 19–20  
Execution date: **17 November 2026**; preparation started 16 November

## Objective and scope

Connect current service information, useful case records and user-tested instructions. This was guided work: the owner operated the tenant and reproduced procedures; documentation and the second-line package were prepared with assistant support. No production incident, independent assessment or externally submitted support request is claimed.

## Current service review — T23

The owner reports reading Service health as **adm-lab at 05:40, Poland**, on 17 November. Capture 01 shows:

| Service | Captured state |
| --- | --- |
| Exchange Online | 1 advisory |
| Microsoft Teams | 1 advisory |
| Microsoft 365 suite | 5 advisories |
| Microsoft OneDrive | Healthy |
| SharePoint Online | Healthy |

Eight visible active issue rows are labelled Advisory. Some affect multiple services, so per-service counts are not a count of unique incidents.

The selected **MO1489432** concerns contacts and Speed Dial visibility in Teams and Outlook desktop/mobile. The owner reports **Service degradation**. The detailed User impact section was not found, and actual occurrence of those symptoms in the lab was **not checked**. The latest update supplied was 13 November, 12:09 GMT+1: repair deployment was ongoing, with planned completion on 20 November. That is a forecast, not observed resolution. The title does not establish a general mail-delivery outage.

## Message center and change disposition

Capture 02 shows **MC1545696**, published 9 November, announcing browser annotation of sensitivity-labelled encrypted PDFs in work OneDrive/SharePoint. It says users with appropriate editing usage rights can annotate while labels, encryption and usage rights remain preserved. Readers remain unable to annotate; no additional access is granted.

The panel's timing field says **mid to late January 2027**, while its detailed rollout says **late January 2027**. No separate Act by deadline is shown. Preserve both fields rather than inventing a precise rollout day.

The post requires no feature-specific admin enablement. Recommended preparation is to inform relevant users, review the fit of existing label/usage rights, and update helpdesk guidance. **Lab disposition:** monitor the future rollout; no current PDF feature test, permission expansion or label-policy change was performed. Existing DOCX/TXT tests do not validate this announced feature. The displayed relevance and monthly-active-user counters were not independently audited.

T23 is PASS: Microsoft's reported degradation, untested lab impact, future change notice and controlled lab recovery exercises are explicitly distinguished.

## Knowledge articles and reader reproduction

Four DOCX files were prepared: three English procedures and one German companion. The owner uploaded them to **BFL-M365-Knowledge > Knowledge**; 03 shows all four filenames. The repository provides matching Markdown procedure content in the [article index](../../knowledge-base/README.md).

| Procedure | Owner-confirmed reproduction |
| --- | --- |
| Helpdesk in Outlook web | Piotr reads the article without editing, sends as Helpdesk to Marek, and reads Marek's reply in Helpdesk |
| Scoped document sharing | Piotr reads the article, opens the new link, receives “This link has been removed” on the saved old URL after removal, and still opens KB-01 through Knowledge |
| OneDrive EN | V2 first visible in web; history Restore returns full original V1 in web and the reopened local file; client healthy |
| OneDrive DE | Piotr reads without editing and German glyphs display correctly; Marek follows the deleted-file section, recovers the same item and confirms full V1 in both locations; no difficulty reported |

The English restore test needed an additional chat explanation of the history-entry menu before succeeding; final feedback was no further issues. It is not described as unassisted. The German companion deliberately retains English button names to match the tested interface. The paused-sync branch was not repeated as an article test; Stage 09 covers that earlier exercise.

## Scoped D10 recovery resource

Both current recovery checks used **M365-Lab-D10/LAB-D10-KB-RECOVERY-01.txt** in Marek's work OneDrive, separate from Stage 09. The expected complete contents are:

```text
LAB-D10-KB-RECOVERY-01
Version: V1
Baseline for the knowledge article test.
```

For EN, the version marker was changed to V2 and cloud V2 checked before restoring V1. For DE, the synthetic item was deleted through OneDrive web, disappearance from web/local was owner-confirmed, and it was restored from the OneDrive web recycle bin. Capture 04 shows web/local file presence, the D10 folder and full local V1; **full cloud contents and final Backed up and synced are owner-confirmed**, not visible text-preview proof in that image.

No exact history ID, sync latency, hash/encoding audit, retention policy or independent backup coverage is inferred.

## Link result consolidation — T31

T31 retains its original Stage 08 matrix assignment. Related observations were recorded there, but the row remained NOT_RUN. This Stage 10 article reproduction supplies a direct repeat: new link opens, the saved old URL explicitly reports removed, and library navigation still works under Piotr's existing reader baseline. T31 is now PASS with this evidence; no new test ID is created.

This does not establish that KB-01's item inheritance was reset or that every effective grant was audited. The selected link is removed; site roles and library access remain.

## Case review and second-line package

The [case review](../../tickets/stage-10-case-review.md) separates observed scope, missing business urgency and conditional escalation criteria using existing records. Formal SLA priorities are not retroactively invented.

The [Exchange role-delegation package](../../tickets/escalations/exchange-role-delegation.md) collects the unresolved Stage 05 exception, actor attribution, diagnostic limits, historical reproduction, current retained state and questions for second line. It is **prepared, not submitted**. No fresh role mutation or PowerShell execution was performed. Completing this package does not resolve the RBAC error or add a fifteenth resolved case.

## Exit checks and retained state

- [x] Case review separates reports, observations, hypotheses and supported causes.
- [x] Current service information is not presented as a reproduced lab-wide outage.
- [x] User articles are available in Knowledge and their stated branches are reproduced with attributed results.
- [x] A second-line reader has scope, evidence, unknowns and a proposed diagnostic path.

All four article files remain in Knowledge; their Category/Status fields are blank in 03, so no metadata approval/publishing workflow is inferred. The D10 original remains at full V1 with normal sync. Prior D09 resources and the retained Downloads V2 helper were not part of the D10 mutations.

The global matrix is **26 PASS / 6 NOT_RUN**; the backlog remains **14 RESOLVED / 1 PLANNED**. Stage 11 reporting, Stage 12 handover, Stage 13 independent assessment and optional Copilot validation remain unexecuted.

[Results](../../tests/day-10.md) · [4 captures](../../evidence/day-10/README.md) · [Articles](../../knowledge-base/README.md) · [Stage index](README.md)
