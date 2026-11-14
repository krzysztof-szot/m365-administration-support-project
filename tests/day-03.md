# Day 03 validation record

Status: **COMPLETE**. Execution date: **14 November 2026**. Evidence: [11 screenshots](../evidence/day-03/README.md). Checks are manual.

| Check | Expected | Actual result | State / source |
| --- | --- | --- | --- |
| Alias configuration | Secondary Finance address on Anna's mailbox | m365.finance added; m365.anna remains primary | VERIFIED; 01 |
| First internal attempt | Addressing demonstrably uses the alias | Mail arrives; private headers name m365.anna instead | INCONCLUSIVE for alias target; 02/03 and private header inspection |
| External alias attempt | Explicit alias target delivers to Anna | Gmail sent details show m365.finance; matching message received by Anna | **T05 PASS**; 03a/03b |
| Controlled missing membership | Piotr omitted from the DL | Only Anna listed during the fault | VERIFIED; 04 |
| Direct-mail control | Piotr's mailbox can receive | CONTROL-01 received at displayed 13:58 | PASS; 05 |
| DL during fault | Anna receives; Piotr omitted | Anna receives DL-02 at 13:59; owner confirms no copy for Piotr for ten minutes | PASS; 06 plus owner report |
| Membership repair | Normal member set restored | Anna/Piotr listed | VERIFIED; 07 |
| Recovery and regression | Both intended recipients receive new test | Anna/Piotr receive DL-03 at displayed 14:09 | PASS; 08/09 plus owner report |

T06 is extended here, not counted twice. The historical snapshot at Day 03 closure has **7 PASS / 25 NOT_RUN**, passing T01, T02, T03, T04, T05, T06 and T16. See [current results](README.md) and [Day 04](day-04.md) for subsequent execution.

## Interpretation and remaining limits

The controlled cause is missing distribution membership, supported by the successful direct-mail control and restored delivery after re-addition. Piotr's direct-mail screenshot precedes DL-02; it is not presented as a non-receipt screenshot. Non-receipt is attributed to the owner's ten-minute observation.

The internal alias attempt's Date header is 12:31:39 UTC; other times are displayed client times with no captured timezone. The rewriting mechanism and exact propagation intervals were not established. The external pair independently establishes the alias target and delivery. No Message Trace or automatic test run was performed.

Final state: alias retained; DL membership restored; recipient-admin role remains active. M365-002 and M365-003 are resolved lab cases. The evidence index records redaction and interpretation boundaries for the owner-uploaded images.

[Stage implementation](../docs/stages/03-exchange-recipients-and-mail.md) · [Alias request](../tickets/M365-002-finance-alias-delivery.md) · [Membership incident](../tickets/M365-003-distribution-membership-recovery.md)
