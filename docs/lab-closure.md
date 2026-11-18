# Retained lab state and portfolio closure

Status: IN_PROGRESS  
Review date: 18 November 2026, Europe/Warsaw  
Owner decision: retain existing resources.

## Current decision

The lab is retained in its recorded state. No resource deletion, subscription cancellation, license reassignment, policy relaxation or automatic rollback was performed during portfolio review. This is an evidence/documentation review, not deprovisioning of the reused tenant.

## Retained resources and last verification

| Resource | Recorded retained state | Boundary |
| --- | --- | --- |
| Anna and Marek | Active workload users; account/client/mail/file controls work | Product assignments have historical source dates; current Word UI is not a new full SKU/plan inventory |
| Piotr | Exists, sign-in blocked, zero assigned products; retained SharedMailbox anchor | Fresh portal/block and successful empty license report on 18 November; mailbox conversion/custody verified in Stage 12 |
| Piotr mailbox / approved copy | Intended Anna FullAccess and retained mail; separate full V1 TXT in Anna My files | Stage 12 post-unassignment functional checks; not a whole-drive migration or indefinite source-drive preservation |
| Finance group / Team / DL | Anna retained; Piotr removed | Fresh human Finance owner/member report and portal agreement; DL is earlier owner-confirmed state |
| Finance private channel | Last recorded Anna-only | Stage 07 closure; not a new full channel audit |
| IT Team | Marek retained Owner after Piotr removal | Stage 12 owner/control results; no new full membership export |
| Knowledge | Anna owner / Marek editor baseline; Piotr Visitors removal reported | Later effective-level query returned a policy message, so child/direct grants are not fully audited |
| Helpdesk | Anna FullAccess / SendOnBehalf; no human SendAs/Piotr delegate returned | Fresh five-row configured ACL report and selected portal match; three system rows preserved |
| Calendar / room | Marek reader restored; lab room and reservation history retained | Earlier verified resource workflow, not a new scheduling/retention audit |
| Training transport rule | Retained Disabled | Stage 05 recovery; custom role-delegation exception still unresolved |
| MFA scope and admin identities | Recorded security scope/admin and emergency accounts retained | No policy/role/consent cleanup; no complete current role audit |
| Desktop/OneDrive test files | Local Word test remains; D13 TXT full V2 online/local, client healthy | Stage 13 controls; D09/D10 originals unchanged; no independent backup claim |

The source Piotr OneDrive is unlicensed. Its lifecycle follows current Microsoft policy and actual tenant storage/retention settings, which were not fully audited. Anna's selected copy is the verified custody outcome; retaining an account does not promise indefinite access to every original file.

## Subscription review

Fresh subscription term dates and recurring-billing settings have been requested privately and remain unconfirmed. An older check is not substituted for this closing review.

Turning recurring billing off is distinct from immediate cancellation. No billing setting was changed by this review. Resource retention and future subscription management are separate decisions. [Microsoft recurring-billing documentation](https://learn.microsoft.com/en-us/microsoft-365/commerce/subscriptions/renew-your-subscription?view=o365-worldwide).

## Offline portfolio preservation

A public-only ZIP snapshot is prepared from the reviewed repository file manifest and checked against per-file blob hashes before publication. It contains public source, sanitized samples, articles, documentation and all 153 published images. It excludes `.git`, private configuration/raw outputs, enrollment/recovery material, mailbox files and unrelated workstation data. Exact local archive path/hash and published revision are recorded in a private companion result, not committed here.

This preserves the project evidence outside the live tenant. It is not an export or backup of all Microsoft 365 content, policies, mailbox history or OneDrive versions. The live retained resources keep their existing service dependencies.

## Remaining limitations and recovery

- T32 remains NOT_RUN: five practical tasks are verified, but original independent five-task execution was not performed. Stage 13 is COMPLETE under its revised practical scope; that original independent follow-up is outside the revised completion criterion.
- The Stage 05 Exchange custom-role delegation exception remains unresolved; broad Graph scopes and selected effective-role limits remain disclosed.
- The Knowledge effective-permission inspection is inconclusive; precise propagation, universal session revocation and exhaustive item/role inventories were not proved.
- Optional Copilot generated-output exercises, custom-domain mail authentication, external-sharing extensions and broader device-management deployment remain unexecuted.
- No account restoration or deletion is automatic. A future return-to-work or cleanup needs a separately scoped decision, valid data custody, actual identity verification and new checks.

[Portfolio summary](portfolio-summary.md) · [Current baseline](01-environment-baseline.md) · [Access matrix](access-matrix.md) · [Stage 14 record](stages/14-portfolio-and-lab-closure.md)
