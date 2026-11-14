# M365-002 — Additional Finance address must deliver to Anna

Status: **RESOLVED**  
Type: **Service request / synthetic lab exercise**  
Execution date: **14 November 2026**  
Stage: **03**

## Request and scope

Add an additional SMTP address, m365.finance, to Anna's existing mailbox. Keep m365.anna as primary/default. Scope is one synthetic mailbox and controlled messages; no new mailbox, license or tenant-wide sending-from-alias change is required. Operator role: captured Exchange Recipient Administrator on adm-lab.

## Implementation and diagnosis

| Step | Check | Actual observation |
| --- | --- | --- |
| Configuration | Save and read back mailbox email addresses | Primary m365.anna and secondary m365.finance visible (01) |
| Internal test | Piotr sends ALIAS-01 and Anna receives it | Delivered at displayed 13:31; UI shows Anna's name (02/03) |
| Resolve evidence ambiguity | Inspect received headers privately | To names m365.anna; Date is 12:31:39 UTC; alias is absent |
| Independent target test | Send a new ALIAS-02 from external Gmail | Sent details explicitly name m365.finance (03a) |
| Functional result | Read the matching message as Anna | ALIAS-02 arrives at displayed 13:47 (03b) |

Recipient resolution may explain the first attempt, but the exact rewriting mechanism was not established. The internal attempt is not presented as confirmed alias-target transport evidence.

## Resolution, recovery and verification

Added the secondary address and retained the primary. **T05 PASS** is based on the saved configuration and the matched external sent/received pair. Rollback would remove only the added secondary address; it was not performed because the alias is the intended final state.

Suggested closure note: "The Finance address delivers to your existing mailbox. The test from an external mailbox explicitly targeted the additional address and arrived successfully."

Raw headers and private external addresses are not reproduced here. No sender-alias feature or outbound-alias behavior was tested. The evidence index records redaction and interpretation boundaries.

[Stage](../docs/stages/03-exchange-recipients-and-mail.md) · [Results](../tests/day-03.md) · [Evidence 01–03b](../evidence/day-03/README.md)
