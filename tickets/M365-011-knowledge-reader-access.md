# M365-011 — Knowledge-site reader must not edit documents

Status: **RESOLVED**\
Type: **Guided synthetic service request / Stage 08**\
Execution date: **16 November 2026**

## Request and scope

Provide Piotr with read access to the independent BFL-M365-Knowledge site while Marek can edit and Anna retains Full Control. Validate the actual user experience on the original LAB-D08-KB-01.docx, rather than relying only on role labels.

## Configuration and diagnosis

The owner created the communication site as Anna. Capture 02 shows Anna Full Control, Marek Edit and Piotr Read. The Knowledge library and Mail/Draft metadata are visible in 03. An earlier original-DOCX lock was a separate observed obstacle: the TXT control and uploaded copy worked, and the original later recovered after Anna closed Word and time passed according to the owner. This case does not claim a permission change repaired that lock.

## Functional verification

- Marek edited and saved KB-01; the owner confirms Anna saw the change after reopening.
- Piotr opened the checklist and the saved line but editing was unavailable, owner-confirmed.
- Capture 04 shows Viewing, disabled editing controls and the Marek verification line.

T18 and T19 are PASS. Reader inability to edit is the requested outcome, not an outage. No broader Edit grant was required for Piotr.

## Final state and evidence limits

Anna Full Control, Marek Edit and Piotr Read are retained. Original KB-01 is the working document. The owner confirms original identity without replacement and removal of KB-02 plus the diagnostic LOCK-CONTROL TXT. The isolated folder exercise is separately documented in the stage and T20; it ends restored.

No exact save latency, raw author audit export or complete post-sharing item ACL was captured. Session identities and save/reopen behavior are attributed to the owner.

## Suggested closure wording

"Piotr can open the knowledge document but cannot edit it. Marek can save changes and Anna sees them after reopening. The requested reader/editor separation is verified and retained."

This is sample closure wording, not an externally sent message.

[Stage](../docs/stages/08-sharepoint-and-sharing.md) · [Results](../tests/day-08.md) · [Evidence](../evidence/day-08/README.md) · [Access matrix](../docs/access-matrix.md)
