# Day 05 validation record

Status: **COMPLETE**. Execution date: **16 November 2026**. Evidence: [14 screenshots](../evidence/day-05/README.md). These are guided manual Exchange Online and Outlook-on-the-web checks.

## Matrix results

| Check | Expected | Observed | Result / source |
| --- | --- | --- | --- |
| T11 — Invalid recipient | Actual failure evidence identifies the invalid address | NDR and Trace report 550 5.1.10 RESOLVER.ADR.RecipientNotFound; SMTP lookup did not find lab-d05-missing-20261116-01; Receive → Submit → Fail | **PASS**; 05–08 |
| T12 — Scoped training rule | Marked Marek → Piotr message rejected while an unmarked control is delivered | RULE-01 with [LAB-BLOCK] fails; NDR contains the configured explanation; RULE-02 is Delivered; owner confirms Piotr opened RULE-02 | **PASS**; 10–12 plus owner report |
| T13 — Mail-flow recovery | New marked message delivers after disabling the exercise rule | Saved rule is Disabled; new RULE-03 with [LAB-BLOCK] is Delivered, alongside prior Failed and Delivered rows | **PASS**; 13–14; Trace delivery, no separate opening report |

The cumulative [32-check matrix](test-matrix.csv) is **16 PASS / 16 NOT_RUN**. Newly passed: T11, T12, T13. Supporting baseline, controls, administrative observations and repeat phases do not add global test numbers.

## Correlation and time context

| Observation | Captured time / result |
| --- | --- |
| Service health | 16 November, 05:55 GMT+1; Exchange has two advisories, not a reproduced broad delivery incident |
| BASELINE-01 | Trace 05:04 UTC; detail gives 05:04:14 UTC delivery to Inbox and Receive → Submit → Deliver |
| Unknown recipient | Trace 05:32 UTC, Failed; NDR hop table includes 05:32:15 UTC |
| RULE-01 marked | Trace 06:43 UTC, Failed; NDR says blocked by a custom mail-flow rule |
| RULE-02 unmarked | Trace 06:43 UTC, Delivered; opening confirmed by owner |
| RULE-03 marked after disable | Trace 06:54 UTC, Delivered |

Outlook displays 06:04 for the baseline and 07:43 for the rule NDR without a timezone label in those captures. These are consistent with the respective UTC times at UTC+1, but are not used as independent timezone or latency measurements. Rule change times were not recorded, so no propagation interval is calculated.

## Configuration, identity and remaining exception

Screen 10 shows Enabled / Enforce with sender Marek AND recipient Piotr AND subject [LAB-BLOCK], a custom rejection explanation and configured code 5.7.1. Screen 13 shows Disabled with those conditions retained. The published rule NDR does not display its detailed SMTP code; configured and observed error data are distinguished.

The owner confirms baseline Trace access as adm-lab and the subsequent rule operations as bg01. Screen 09a shows the initial Rules toolbar without Add a rule; the actor is supplied by owner context. It is not evidence that every Exchange action is denied.

The attempted RG-M365-Lab-Transport-Rules grant remains unverified after a delegation error. bg01 Global Administrator and the selected Organization Management permissions are owner-reported. Effective delegating assignments and any partial custom-group state were not audited. PowerShell diagnostics and additional auxiliary captures were deferred at the owner's request.

## Boundaries and restoration

The missing-recipient failure was diagnosed as expected behavior; the address was not created or repaired. A full alias inventory and a corrected-address resend were not recorded. Existing-recipient baseline delivery supplies the separate working control.

RULE-02 opening is owner-reported; RULE-03 recovery is established by Trace without an opening claim. Different-sender/different-recipient rule controls were not run. The exercise rule remains **Disabled**.

No workload scripts, automated service tests, desktop activation or validated Copilot exercise were executed. Stage 06 remains PLANNED; the owner's Word/Outlook/VM readiness report is an intake note only.

[Implementation](../docs/stages/05-mail-flow-troubleshooting.md) · [Evidence](../evidence/day-05/README.md) · [M365-006](../tickets/M365-006-unknown-recipient-diagnosis.md) · [M365-007](../tickets/M365-007-scoped-rule-recovery.md)
