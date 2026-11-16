# M365-006 — Message to an unknown lab recipient is rejected

Status: **RESOLVED — diagnosis of expected rejection**\
Type: **Controlled invalid-recipient exercise**\
Execution date: **16 November 2026**\
Stage: **05**

## Request, impact and scope

Marek sends LAB-D05-NDR-01 to lab-d05-missing-20261116-01 at the lab domain. Delivery is expected to fail because the selected target is intentionally nonexistent. The task is to identify the actual rejection cause and distinguish it from a service or sender problem. This is a synthetic lab case, not a production incident.

## Diagnosis

| Question | Check performed | Observation and decision |
| --- | --- | --- |
| Is the sender able to send to a working internal recipient? | Separate BASELINE-01 to Piotr | Piotr receives it; Trace records Inbox delivery and Receive → Submit → Deliver (02–04) |
| Was there an actual delivery failure after submission? | NDR overview and original-message context | Unknown To address; target was not found; original sender Marek (05) |
| What does the diagnostic response identify? | NDR Error Details | 550 5.1.10 RESOLVER.ADR.RecipientNotFound; SMTP address lookup did not find the target (06) |
| Does the service-side record agree? | Trace of the original message | Failed at 05:32 UTC; Receive → Submit → Fail with the same error and NDR notification to Marek (07–08) |

The supported cause is failure to resolve the supplied SMTP recipient address. The generic NDR help text lists several possible checks; it is not evidence of a licensing, forwarding or domain-routing fault in this test.

## Resolution and verification

Closed as a diagnosed, expected rejection. **T11 PASS.** No missing mailbox was created and no existing recipient, license or routing setting was changed.

A complete pre-send inventory of aliases was not captured. The successful Piotr baseline is a separate positive control; this record does not claim that the unknown-recipient message was resent to a corrected address and delivered.

The final rule-recovery message in M365-007 concerns a different failure cause and is not presented as a repair of the nonexistent address.

## Communication and closure

Suggested closure note: "The delivery report and Exchange trace agree that the supplied recipient address could not be found. Mail to the existing Piotr mailbox works. Verify the intended recipient's exact address before sending a real message."

This wording is a documentation sample, not an externally sent support message.

[Stage](../docs/stages/05-mail-flow-troubleshooting.md) · [Results](../tests/day-05.md) · [Evidence 02–08](../evidence/day-05/README.md#baseline-and-invalid-recipient) · [Related rule case](M365-007-scoped-rule-recovery.md)
