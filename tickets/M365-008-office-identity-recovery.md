# M365-008 — Word is signed in with the wrong lab identity

Status: **RESOLVED**\
Type: **Controlled client-identity exercise**\
Execution date: **16 November 2026**\
Stage: **06**

## Request, impact and scope

Marek is the intended user of the dedicated BFL-WKS01 Office baseline. Temporarily sign Word in as Piotr, identify the mismatch and restore Marek without treating every identity difference as a licensing outage. This concerns synthetic accounts in a lab-only VM.

Impact is limited to the exercise's incorrect active Office context. No production impact, SLA breach, data loss or loss of activation was observed.

## Diagnosis

| Check | Observation | Decision |
| --- | --- | --- |
| Working baseline | 02 shows Marek and Subscription Product; document and mail tests succeed | Establish a working recovery point |
| Controlled identity change | Guided sign-out/close/reopen/sign-in sequence uses Piotr | Inspect active user and licensing information separately |
| Active Office user | 04 User Information shows M365 Piotr Operations | Wrong user for Marek's task |
| Product license | 04 says Subscription Product for m365.marek | Subscription remains associated with Marek; do not label this a Piotr activation repair |

The supported cause is the deliberately selected wrong active Office identity. The earlier Activation Required state in 01 preceded this exercise and has no established common cause.

## Resolution and verification

Signed Piotr out of Office, closed the applications and restored Marek. The owner explicitly confirms Marek and an active product, editing/saving LAB-D06-WORD-01 and RECOVERY-01 sent from classic Outlook and received in web mail. After the later shared-mailbox exercise, the owner reconfirms Marek's original Outlook profile and active Word identity.

**T14 PASS** is supported by 01/02/04 and these functional/restoration confirmations. No separate final screenshot was required. A change of the Outlook mailbox profile is not inferred solely from the Word account screen.

No license reassignment, credential-store purge, installation repair or tenant policy change forms part of the recorded resolution. The precise licensing-cache mechanism was not investigated.

## Communication and closure

Suggested closure note: "Word was using Piotr's active account while the product subscription still identified Marek. Marek's intended identity is restored; document editing and the desktop-to-web mail control work."

This is sample wording, not an externally sent message. The case is closed as a guided identity correction, not an activation outage.

[Stage](../docs/stages/06-outlook-and-microsoft-365-apps.md) · [Results](../tests/day-06.md) · [Evidence](../evidence/day-06/README.md) · [Outlook comparison case](M365-009-outlook-offline-recovery.md)
