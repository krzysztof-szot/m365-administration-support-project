# M365-003 — Piotr receives direct mail but misses Finance distribution

Status: **RESOLVED**  
Type: **Incident exercise — deliberately introduced lab condition**  
Execution date: **14 November 2026**  
Stage: **03**

## Impact and authorized scope

One synthetic user misses messages to DL-M365-Finance. Marek is the internal sender and Anna is the unchanged recipient control. This is not a real Microsoft outage or production incident. The planned recovery is to re-add Piotr and send a new marked test.

The change affects only this DL's membership. The separate Microsoft 365 Finance group and MFA pilot are not the fault target.

## Diagnosis

| Question | Check | Observation and decision |
| --- | --- | --- |
| Is Piotr currently a recipient? | Read DL members after deliberate removal | Anna only (04); membership is a candidate cause |
| Is the mailbox functional? | Direct CONTROL-01 from Marek | Piotr receives at displayed 13:58 (05) |
| Does the list still distribute? | DL-02 from Marek | Anna receives at 13:59 (06) |
| Is Piotr omitted in practice? | Observe his Inbox/Junk | Owner reports no DL-02 for ten minutes |
| Does restoring membership restore service? | Re-add Piotr and send new DL-03 | Both Anna/Piotr receive at displayed 14:09 (07–09) |

## Identified cause and resolution

The deliberately omitted distribution membership is supported as the cause of the missing list copy: direct mail works, the other member receives, and re-adding Piotr restores delivery. Exact cache/propagation time and message-trace events were not established.

Re-added Piotr; read back both members; verified a new subject after repair. Anna remains owner and member. The list is left restored, not in its training-fault state.

## Verification and closure

**T06 PASS**, extended with controlled removal and recovery; this is the same matrix check first exercised in Day 02. Anna's continued receipt is the regression control. Piotr's non-receipt is an owner-reported, ten-minute observation rather than an indefinite guarantee.

Suggested closure note: "Your mailbox was receiving direct mail. We restored your Finance distribution membership and verified that a new list message reached you while the existing member continued receiving."

[Stage](../docs/stages/03-exchange-recipients-and-mail.md) · [Results](../tests/day-03.md) · [Evidence 04–09](../evidence/day-03/README.md)
