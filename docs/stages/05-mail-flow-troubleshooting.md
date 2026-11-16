# Stage 05 — Mail-flow troubleshooting and recovery

Status: **COMPLETE**\
Target days: 8–9\
Execution date: **16 November 2026**\
Evidence: **14 owner-uploaded screenshots** in [Day 05](../../evidence/day-05/README.md)

## Learning objective and scope

Distinguish invalid-recipient rejection from an intentionally enforced mail-flow rule, correlate user-visible NDRs with Message Trace, and verify delivery after restoration. These were guided, synthetic Exchange Online and Outlook-on-the-web exercises.

Marek sent from his own mailbox. Piotr was the existing, working recipient for the baseline and rule tests. A separate address, lab-d05-missing-20261116-01 at the lab domain, was used for the unknown-recipient test. Public documentation uses local aliases and does not reproduce the private domain.

## Starting state and administrative context

Service health at 05:55 GMT+1 showed active advisories. Exchange Online had two: cross-tenant free/busy visibility and contact/Speed Dial visibility. Their titles did not identify a general mail-delivery outage; the exercise did not reproduce or resolve a Microsoft service incident.

The baseline reached Piotr. Message Trace recorded delivery at **05:04:14 UTC**, with **Receive → Submit → Deliver**. The Outlook capture displays 06:04 without a timezone label; 05:04 UTC is consistent with 06:04 at UTC+1.

The owner explicitly confirmed that Message Trace worked as **adm-lab**. The initial Rules view had no Add a rule control (09a). The rule was subsequently configured and disabled in the guided **bg01** session; actor attribution comes from the owner's session report, not an independent audit-log export.

## Unknown-recipient diagnosis — T11

The original **LAB-D05-NDR-01 — Unknown recipient** produced an actual NDR. Its diagnostic section and matching Trace agree:

> 550 5.1.10 RESOLVER.ADR.RecipientNotFound

The error states that the SMTP address lookup did not find the recipient. Trace shows **Failed** at **05:32 UTC**, with **Receive → Submit → Fail**, and reports an NDR sent to Marek. The NDR hop table includes **05:32:15 UTC**.

This is server-side failure evidence, rather than an unsent client warning. No complete pre-send inventory of all recipient aliases was captured. The test did not create the missing recipient, change licensing, or modify domain routing. The working Marek-to-Piotr baseline is a separate positive control, not a resend of this same message after correcting its address.

## Scoped mail-flow rule

| Setting | Saved configuration |
| --- | --- |
| Name | TR-M365-001-Lab-Block-Marek-To-Piotr |
| Conditions | Sender Marek **AND** recipient Piotr **AND** subject contains **[LAB-BLOCK]** |
| Action | Reject the message and include the explanation below |
| Explanation | LAB-D05: Message rejected by a controlled lab mail-flow rule. |
| Configured enhanced status code | 5.7.1 |
| Mode / enabled test state | Enforce / Enabled |
| Other properties | Low severity; Header sender matching; priority 0; no date range; Ignore rule-processing errors; stop-processing not selected |
| Final state | **Disabled**, retaining the Enforce mode and the scoped conditions |

The configured 5.7.1 code is visible in the rule description. The published rule-rejection NDR shows the custom explanation and blocked-by-rule reason; its detailed SMTP code is not visible in that capture.

## Functional results and recovery — T12 / T13

All rows below are Marek → Piotr, dated **16 November 2026**. Times are those displayed in the Trace UTC column.

| Message subject | Rule state in the guided sequence | Trace result | Additional verification |
| --- | --- | --- | --- |
| LAB-D05-RULE-01 [LAB-BLOCK] — Controlled rejection | Enabled / Enforce | **Failed**, 06:43 UTC | Actual NDR identifies a custom mail-flow rule and contains the configured explanation |
| LAB-D05-RULE-02 — Unmarked delivery control | Enabled / Enforce | **Delivered**, 06:43 UTC | Owner explicitly confirms Piotr opened the message |
| LAB-D05-RULE-03 [LAB-BLOCK] — Delivery after rule disabled | Disabled | **Delivered**, 06:54 UTC | New marked message; delivery established by Trace, without a separate Piotr opening confirmation |

After the blocked/control comparison, the owner disabled the rule. Screen 13 shows **Status: Disabled** and a successful status-update banner. Screen 14 places the new delivered marked message alongside the earlier delivered control and failed marked attempt. This meets the delivery-recovery check.

Exact enable/disable timestamps and propagation intervals were not recorded. The gap between message timestamps is not a measured rule-propagation duration. Microsoft documents that a new or modified rule can take 30 minutes or more to apply; that is guidance, not an observed lab interval.

## Administrative exception retained for follow-up

An attempted custom role group, **RG-M365-Lab-Transport-Rules**, did not reach a verified working state. The owner reported an initial success banner and then no group on the list. A subsequent creation attempt as bg01 returned:

> You must be assigned a delegating role assignment to the management role or its parent in the hierarchy without a scope restriction.

The owner confirmed bg01 had Global Administrator and that Role Management and Transport Rules were selected in Organization Management. These portal reports do not establish the effective delegating assignment or its failure cause. No successful grant to adm-lab, complete absence of a partial group object, or repair of RBAC is claimed.

The owner deferred Exchange Online PowerShell diagnostics and waived further auxiliary screenshots. The public set retains 09a; the private diagnostic conversation is not presented as extra published evidence. Completion of the mail-flow exercise used bg01 and does not close this administrative exception.

## Exit checks

- [x] Actual NDR and Trace distinguish unresolved-recipient lookup from controlled rule rejection.
- [x] The unmarked Marek → Piotr control is delivered and opened, with opening owner-confirmed.
- [x] The exercise rule is left Disabled.
- [x] A new marked message is Delivered after disabling.
- [x] Configuration, observed behavior, owner reports and remaining uncertainty are separated.

**T11, T12 and T13 PASS.** The cumulative matrix is **16 PASS / 16 NOT_RUN**. Baseline, control and recovery phases do not create extra global test rows.

## Final state and interpretation limits

The transport rule is retained **Disabled** for review. Existing mailboxes, aliases, groups and prior delegation settings were not intentionally changed in this stage. No new Exchange Administrator assignment to adm-lab is claimed.

The saved sender/recipient/subject conditions and marked/unmarked pair support the stated test scope. Different-sender and different-recipient controls were not executed, and no complete tenant RBAC audit was performed. No fresh MFA push, desktop activation, executed PowerShell report or deliberate Copilot exercise is established here.

The owner can now explain why a nonexistent SMTP address and an administrator rejection require different diagnoses, why a saved rule is not proof of enforcement, and why recovery needs a new message.

[Results](../../tests/day-05.md) · [Evidence](../../evidence/day-05/README.md) · [Unknown-recipient case](../../tickets/M365-006-unknown-recipient-diagnosis.md) · [Rule-recovery case](../../tickets/M365-007-scoped-rule-recovery.md) · [Microsoft references](../sources.md#day-05-implementation-references) · [Stage index](README.md)
