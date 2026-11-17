# Day 10 — Service triage and user knowledge validation

Execution date: **17 November 2026**. Manual guided checks and assistant-supported documentation. [Stage record](../docs/stages/10-support-operations-and-knowledge.md) · [Evidence](../evidence/day-10/README.md).

## Global matrix entries

| ID | Expected | Observed | Result and source |
| --- | --- | --- | --- |
| T23 | Actual service state is distinguished from training scenarios | Current contacts/Speed Dial advisory recorded; lab impact not checked; healthy OneDrive/SharePoint rows captured; January PDF announcement treated as future change; D10 file deletion identified as controlled training | PASS; 01/02 plus owner-reported advisory details and scoped recovery results |
| T31 | Access after revocation is explained by remaining grants or denial | Newly created link opens; after removal saved old URL reports “This link has been removed”; the same KB-01 opens through Knowledge under Piotr's existing reader baseline | PASS; explicit owner reproduction in Stage 10, building on Stage 08 role evidence; full item ACL not audited |

T31 keeps its Stage 08 assignment and is first explicitly recorded PASS in this Stage 10 consolidation. Earlier related observations are not recounted as another matrix ID. The matrix now has **26 PASS / 6 NOT_RUN** out of 32. T24–T28 and T32 remain NOT_RUN.

## Article validation

| Article | Captured and reported evidence | Boundary |
| --- | --- | --- |
| Helpdesk web | 03 lists the file; Piotr read-only opening, Helpdesk-to-Marek delivery and reply in Helpdesk owner-confirmed | No new raw sender-header or delegation audit |
| Scoped sharing | 03 lists the file; reader opening, new link, exact removed-link error and retained library access owner-confirmed | Guided link audience/settings; no new complete item ACL capture |
| OneDrive EN | V2 in cloud before Restore; full V1 in cloud/local and healthy client afterward, owner-confirmed | Additional chat explanation of version-history menu; no unassisted claim |
| OneDrive DE | 03 lists DE file; Piotr read-only access and German glyphs confirmed; deletion propagation and full V1 restoration confirmed; 04 shows local V1 and cloud/local file presence | Cloud contents are reported, not displayed in 04; only the deleted-file branch was reproduced from DE |

The D10 recovery baseline is LAB-D10-KB-RECOVERY-01 / Version: V1 / Baseline for the knowledge article test. Both restores were compared against all three lines. No exact history ID, timing, byte/hash equality, pin state or retention policy was verified.

## Operational documentation

The [case review](../tickets/stage-10-case-review.md) uses existing scope and conditional urgency/escalation decisions. The [second-line package](../tickets/escalations/exchange-role-delegation.md) is prepared for an unresolved administrative exception, not sent and not resolved. Those documents are assistant-supported outputs, not independent user diagnosis or a Microsoft support interaction.

MO1489432 Service degradation and 20 November repair forecast are owner-reported details. User impact text was unavailable; lab occurrence was not checked. MC1545696's broad mid/late-January field and detailed late-January rollout are both preserved. No new protected-PDF capability or mandatory admin configuration is claimed.

## Closure

Four articles remain available in Knowledge. The D10 test file remains at full V1 with sync resumed/healthy. The selected sharing link is removed; library/site access remains. Prior D09 resources were outside the new mutation scope. The 15-case backlog is unchanged at 14 resolved and one planned.

These are manual workload checks. Documentation link/count validation is separate; no PowerShell report, Pester suite or automated workload CI ran.

[Matrix](test-matrix.csv) · [All results](README.md) · [Articles](../knowledge-base/README.md)
