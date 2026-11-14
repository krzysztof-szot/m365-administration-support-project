# Stage 03 — Exchange recipients, aliases and distribution

Status: **COMPLETE**  
Execution date: **14 November 2026**  
Target days: 4–5 (planning estimate)  
Evidence: **11 screenshots**

## Objective and inherited resources

Verify an additional SMTP address and diagnose a controlled missing distribution copy. DL-M365-Finance already exists from Day 02; its owner is Anna and its normal members are Anna/Piotr. Marek is the internal, non-member sender. The operator uses adm-lab's captured Exchange Recipient Administrator role.

| Recipient concept | Meaning in this lab |
| --- | --- |
| User mailbox | Licensed personal mailbox for each pilot |
| Additional SMTP address | m365.finance routes to Anna's existing mailbox |
| Distribution list | DL-M365-Finance expands to its member mailboxes |
| Microsoft 365 group | Separate Private BFL-M365-Finance collaboration group and site link |
| Shared mailbox | Planned Helpdesk resource in Stage 04; not created or tested here |

## Finance alias — M365-002

Added **m365.finance** as a secondary SMTP address. Primary/default **m365.anna** remains unchanged; capture 01 shows both.

The first internal attempt, LAB-D03-ALIAS-01, reaches Anna at displayed 13:31. Privately inspected headers show her primary address, not the alias, and a Date of **12:31:39 UTC**. The exact recipient-rewriting mechanism was not established, so this attempt is retained as a limitation rather than alias-target proof.

A new external test, **LAB-D03-ALIAS-02**, addresses the alias explicitly in Gmail's sent details (03a) and reaches Anna (03b), both displayed 13:47. With the saved configuration, this verifies **T05 PASS** and resolves [M365-002](../../tickets/M365-002-finance-alias-delivery.md). Raw headers remain private. No tenant-wide sending-from-alias feature change was needed or performed.

## Missing distribution copy — M365-003

Before introducing the fault, the recovery path was to re-add Piotr and repeat delivery with a new subject. Only the DL membership was changed; the Finance Microsoft 365 group and MFA scope were not the target.

| Step | Check and observation |
| --- | --- |
| Introduce the fault | Remove Piotr from DL-M365-Finance; 04 shows Anna as sole member |
| Mailbox control | Piotr receives direct CONTROL-01 from Marek at displayed 13:58 |
| Distribution during fault | Anna receives DL-02 at 13:59; owner reports no DL-02 in Piotr's Inbox/Junk during ten minutes |
| Repair | Re-add Piotr; 07 shows both intended members |
| Functional recovery | New DL-03 reaches Anna and Piotr at displayed 14:09; 08/09 and the owner report agree |

The direct control shows Piotr's mailbox still receives mail. The supported cause of the deliberately missing distribution copy is the omitted DL membership. Restoring that membership restores distribution while Anna continues receiving. [M365-003](../../tickets/M365-003-distribution-membership-recovery.md) is resolved.

**T06 remains one PASS**, first exercised in Day 02 and extended here. No indefinite non-delivery, exact cache delay or Message Trace investigation is claimed.

## Exit checks

- [x] Mail explicitly addressed to the alias reaches Anna's mailbox.
- [x] Intended DL members receive the new marked message.
- [x] Excluded-user non-receipt is recorded with its observation window and source.
- [x] Controlled membership removal is reversed and delivery is re-tested.

## Final state and remaining scope

Anna retains primary m365.anna plus secondary m365.finance. The DL is restored to Anna/Piotr members and Anna owner. The Private collaboration group remains separate and has no Teams attachment yet. The task-specific recipient-admin assignment remains active for subsequent work.

These are guided, synthetic exercises. This record is the Stage 03 closure snapshot. Subsequent mailbox delegation and room/calendar execution are recorded in [Stage 04](04-delegation-calendars-and-rooms.md); transport-rule diagnostics remain planned. Day/stage labels denote learning units; the first three stages were executed on 14 November 2026.

[Results](../../tests/day-03.md) · [11 evidence captions](../../evidence/day-03/README.md) · [Next: Stage 04](04-delegation-calendars-and-rooms.md)
