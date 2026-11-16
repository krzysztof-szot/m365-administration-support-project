# Day 05 evidence

Status: **14 screenshots published; Stage 05 COMPLETE.** Execution date: **16 November 2026**. All published images were opened and reviewed for this documentation update. Configuration, transport observations and attributed owner reports are separated below.

## Baseline and invalid recipient

| File | Observation and scope |
| --- | --- |
| [01-service-health-before-mailflow-tests.png](01-service-health-before-mailflow-tests.png) | Overview at 05:55 GMT+1. Exchange Online has two advisories concerning cross-tenant free/busy and contacts/Speed Dial. Other services show their actual statuses; no all-services-healthy or reproduced outage claim. |
| [02-baseline-mail-received-piotr.png](02-baseline-mail-received-piotr.png) | Opened BASELINE-01 from M365 Marek IT to M365 Piotr Operations, with expected body and 06:04 display time. Full account header/timezone are outside the crop. |
| [03-baseline-message-trace-result.png](03-baseline-message-trace-result.png) | Matching Marek → Piotr baseline, Delivered at 05:04 UTC. |
| [04-baseline-message-trace-details.png](04-baseline-message-trace-details.png) | Delivery to recipient Inbox at 05:04:14 UTC; Receive → Submit → Deliver. Owner confirms the Trace session was adm-lab. |
| [05-unknown-recipient-ndr.png](05-unknown-recipient-ndr.png) | Actual NDR for LAB-D05-NDR-01; lab-d05-missing-20261116-01 was not found; Marek is the original sender. |
| [06-unknown-recipient-ndr-diagnostics.png](06-unknown-recipient-ndr-diagnostics.png) | 550 5.1.10 RESOLVER.ADR.RecipientNotFound and SMTP address lookup failure; original message context and UTC hop table retained. |
| [07-unknown-recipient-message-trace-result.png](07-unknown-recipient-message-trace-result.png) | Original message to the missing recipient is Failed at 05:32 UTC. |
| [08-unknown-recipient-message-trace-details.png](08-unknown-recipient-message-trace-details.png) | Receive → Submit → Fail; same 550 5.1.10 lookup error; Trace states an NDR was sent to Marek. Lowest detail text is partly cropped; the main error is visible. |

## Rule configuration, control and recovery

| File | Observation and scope |
| --- | --- |
| [09a-transport-rule-access.png](09a-transport-rule-access.png) | Initial Rules page has Refresh and no Add a rule control. The owner attributes this session to adm-lab; the image does not show the account header or independently prove the permission cause. |
| [10-transport-rule-enabled.png](10-transport-rule-enabled.png) | Saved TR-M365-001-Lab-Block-Marek-To-Piotr: Enabled / Enforce, sender Marek AND recipient Piotr AND subject [LAB-BLOCK], custom rejection explanation and configured code 5.7.1. |
| [11-transport-rule-rejection-ndr.png](11-transport-rule-rejection-ndr.png) | RULE-01 NDR identifies a custom mail-flow rule and displays the exact configured explanation. Detailed SMTP code is not shown. The reviewed public version also masks the domain in How to Fix It. |
| [12-transport-rule-and-control-trace.png](12-transport-rule-and-control-trace.png) | At 06:43 UTC, marked RULE-01 is Failed and unmarked RULE-02 is Delivered for the same sender/recipient pair. Piotr opening RULE-02 is separately owner-confirmed. |
| [13-transport-rule-disabled.png](13-transport-rule-disabled.png) | Successful status-update banner and Status: Disabled; Enforce mode and the three scoped conditions remain saved. |
| [14-delivery-after-rule-disabled-trace.png](14-delivery-after-rule-disabled-trace.png) | New marked RULE-03 is Delivered at 06:54 UTC, alongside the earlier Delivered control and Failed marked attempt. This establishes transport recovery, not an opening/read receipt. |

## Interpretation boundaries

- **T11/T12/T13 PASS** is based on the combined functional evidence, rather than file names or configuration alone.
- Owner reports attribute the Trace and rule sessions, confirm Piotr opening RULE-02, and describe the administrative-role investigation.
- No separate Piotr opening confirmation for RULE-03, full pre-send alias inventory, different-sender control, different-recipient control or measured propagation interval is claimed.
- Configured rejection code 5.7.1 is distinguished from the actual 550 5.1.10 diagnostic captured for the missing recipient.
- The attempted RG-M365-Lab-Transport-Rules delegation remains unresolved. No successful custom-group grant or complete absence of a partial object is inferred.
- The owner waived extra role-diagnostic captures and deferred PowerShell. Gaps in the auxiliary numbering are intentional and do not create missing completion requirements.

## Publication review

The reviewed images preserve synthetic aliases, test subjects, UTC/status fields and relevant diagnostics while covering the lab-specific domain portion and unnecessary server/identifier details. Screen 11 includes the owner's corrected How to Fix It redaction. The owner's uploaded PNG bytes are retained; no evidence was generated or reconstructed.

No passwords, tokens, MFA enrollment QR codes, recovery codes or billing details were identified in this Day 05 set. This review covers these images and the public text; it is not a tenant-wide security audit.

[Implementation](../../docs/stages/05-mail-flow-troubleshooting.md) · [Results](../../tests/day-05.md) · [M365-006](../../tickets/M365-006-unknown-recipient-diagnosis.md) · [M365-007](../../tickets/M365-007-scoped-rule-recovery.md)
