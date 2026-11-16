# M365-007 — Scoped mail-flow rule rejects a marked message

Status: **RESOLVED**\
Type: **Controlled mail-flow rule exercise**\
Execution date: **16 November 2026**\
Stage: **05**

## Request, impact and scope

Demonstrate rejection of a marked Marek → Piotr message while normal mail continues to deliver, then restore marked-message delivery by disabling the exercise rule. Only synthetic messages and lab mailboxes are used.

The rule TR-M365-001-Lab-Block-Marek-To-Piotr requires sender Marek **AND** recipient Piotr **AND** subject containing **[LAB-BLOCK]**. Its action rejects with: "LAB-D05: Message rejected by a controlled lab mail-flow rule."

## Diagnosis and verification

| Phase | Observation | Evidence / result |
| --- | --- | --- |
| Baseline | Ordinary Marek → Piotr message reaches Inbox; Trace Delivered | 02–04, supporting control |
| Configuration | Enabled / Enforce; all three conditions; configured enhanced code 5.7.1 | 10, saved configuration |
| Marked failure | RULE-01 produces an NDR identifying a custom mail-flow rule and the configured explanation; Trace Failed at 06:43 UTC | 11–12, **T12 PASS** with control below |
| Unmarked control | RULE-02 is Delivered at 06:43 UTC; owner confirms Piotr opened it | 12 plus owner report |
| Restoration | The rule status is saved Disabled | 13 |
| New marked message | RULE-03 retains [LAB-BLOCK] and is Delivered at 06:54 UTC | 14, **T13 PASS** |

This is an administrator-configured rejection of a known working recipient, distinct from M365-006's 550 5.1.10 unresolved-recipient lookup. The published rule NDR shows the reason text, not its detailed SMTP code; 5.7.1 is recorded as rule configuration.

## Resolution and final state

Disabled the exercise rule and verified delivery using a new marked subject. The rule remains **Disabled**, with Enforce mode and conditions retained for review. It was not deleted or broadened. No exact propagation interval is inferred from the message timestamps.

Recovery delivery is established by Trace. A separate Piotr opening confirmation for RULE-03 was not supplied. Different-sender and different-recipient controls were not run.

## Administrative exception

The owner confirms the rule work was performed as bg01 after adm-lab had no Add a rule control. An attempt to delegate Transport Rules through RG-M365-Lab-Transport-Rules encountered a delegating-role-assignment error. That exception remains unresolved; successful rule execution does not establish a repaired grant to adm-lab or a verified final state of the attempted group. Exchange Online PowerShell diagnostics were deferred.

## Communication and closure

Suggested closure note: "The marked message was rejected by the lab rule, while the unmarked control arrived. The rule has been disabled, and a new marked message is now Delivered in Exchange trace."

This is sample closure wording, not an externally sent message.

[Stage](../docs/stages/05-mail-flow-troubleshooting.md) · [Results](../tests/day-05.md) · [Rule evidence](../evidence/day-05/README.md#rule-configuration-control-and-recovery) · [Unknown-recipient case](M365-006-unknown-recipient-diagnosis.md)
