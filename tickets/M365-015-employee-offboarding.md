# M365-015 — Employee move, offboarding and approved data custody

Type: guided synthetic service request  
Stage: 12  
Status: RESOLVED  
Execution date: 17 November 2026

## Request and scope

Revalidate existing Piotr services, move Operations → IT, then deny future sign-in and hand designated retained mail and one approved TXT to Anna. Preserve active-owner controls. This is a lab decision, not an actual HR event or complete organizational offboarding audit.

## Decisions and verification

| Decision | Actual verification |
| --- | --- |
| Separate profile from authorization | Department IT / IT Support Specialist set; new IT membership and Finance/DL removals performed separately |
| Verify mover in both directions | Piotr saves IT edit and Marek reopens; old Finance URL denied with Anna positive control; bounded DL/direct-mail control |
| Copy approved data first | Anna reads the source and uploads a separate V1 copy into her own My files; complete contents rechecked after block and license removal |
| Block former identity | Saved block, fresh denied login and separate reported old-session exit after sign-out request |
| Preserve existing mailbox | SharedMailbox confirmed through EAC and identity-checked Exchange reads; blocked account retained |
| Correct the intended delegate | Wrong old-project Anna grant removed; intended Anna FullAccess verified and retained LAB-D12-MAIL-01 read |
| Decide licensing from observations | 2.248 MB primary size, archive None and inspected hold fields clear; Business Premium removed, Licenses (0) captured; Anna mail still works |
| Remove remaining scoped grants | IT membership, Helpdesk FullAccess/SendAs and Knowledge Visitors removal owner-confirmed; Marek IT / Anna Helpdesk still work |

## Troubleshooting within this request

Anna's own Outlook worked while Open another mailbox → Piotr failed with accessDenied / AccessDeniedException / HTTP 500. The selected-mailbox ACL read showed no grant for intended Anna. The owner discovered a namesake from an older project, corrected the delegate and removed the erroneous grant. A fresh read verifies one intended FullAccess Allow and functional preserved-mail access recovers. This is wrong delegate identity, not a proven Microsoft outage or a measured wait-only repair. The first diagnostic helper's deferred-response enumeration failure is recorded separately and was not interpreted as no permissions.

Knowledge group removal is reported, but a later permission-inspection attempt produced a sharing-policy message rather than effective levels. Exact cause remains unknown. This auxiliary limit is retained; no tenant-wide permission-purge claim or policy weakening follows.

## Final result and limits

T26/T27/T28 PASS within their defined scope. Piotr is blocked and unlicensed, retained as the shared-mailbox anchor. Anna reads retained baseline mail and her separate full V1 copy; active-owner controls work. Deliberate MFA security-group membership remains. Mailbox type/corrected grant and pre-unassignment Exchange observations are API-verified; final unassignment/persistence and later functional checks are captured or owner-attributed as specified.

No whole-OneDrive migration, original history preservation, independent backup, complete item-level permission audit or full Purview audit is claimed. Source OneDrive now follows unlicensed-account rules; Anna's own licensed account supports the verified selected copy. No user deletion, tenant-wide sharing change or global old-project cleanup occurred. The separate Stage 05 Exchange role-delegation exception remains unresolved.

## Recovery and closure wording

Any return-to-work requires a separately authorized restoration of appropriate licensing/type, approved resource grants and sign-in; no automatic rollback has run. The business data copy and retained mailbox remain in the documented custody paths.

Suggested closure: “The scoped employee move and offboarding are complete. New sign-in is denied; Anna can read the retained mailbox and approved file copy after license removal. Owner controls remain usable. The Knowledge effective-permission query was inconclusive and is explicitly recorded.” This is prepared documentation, not an externally sent message.

[Stage record](../docs/stages/12-employee-lifecycle.md) · [Tests](../tests/day-12.md) · [Nine captures](../evidence/day-12/README.md) · [Runbook](../runbooks/employee-lifecycle.md)
