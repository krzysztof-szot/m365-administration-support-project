# Curated synthetic lab samples

- [pilot-users.csv](pilot-users.csv): three created fictional pilots; Piotr now remains blocked/unlicensed as a shared-mailbox anchor. UserKey is a stable planning key; LoginAlias is the actual local login name without the tenant domain. Status distinguishes currently active provisioned pilots from the retained blocked shared-mailbox anchor; it does not certify every workload.
- [ticket-backlog.csv](ticket-backlog.csv): 15 lab cases; M365-001–015 RESOLVED with [case records](../tickets/README.md). M365-006 closes a diagnosed expected rejection; M365-007 records recovery after disabling the scoped rule. M365-008 corrects the active Office identity while distinguishing the licensing account; M365-009 restores a deliberately offline desktop client. M365-010 verifies temporary private-channel authorization and restoration; Piotr does not retain private access at closure. M365-011 verifies the knowledge-site reader/editor roles; M365-012 diagnoses retained document access after a single link is revoked. The separate folder restriction ends with inheritance and Piotr access restored.

Display names and product assignments are supported by the Day 01/02 evidence. Piotr/Marek's Department and JobTitle are owner-reported; the owner waived profile screenshots. Anna's Finance department remains a design value, not an independently captured attribute. ProfileEvidence preserves that distinction.

These are curated samples, not raw Graph/Exchange exports or workplace data. No real domain, tenant identifier, password or billing information is included.

M365-013 verifies resumed OneDrive synchronization; M365-014 verifies full-content previous-version and deleted-file restoration. The synchronized original ends at V1; the Downloads V2 helper is retained outside OneDrive. At Stage 09 closure, M365-015 offboarding remained planned.

Stage 10 added a case-impact/urgency review, a prepared escalation package and user-tested knowledge procedures. At that closure it did not add a backlog ID or resolve M365-015; offboarding was still planned. The Exchange RBAC exception is still unresolved.


## Stage 11 report extracts

[reports/](reports/README.md) contains reviewed live observations with domains, object identifiers and host paths removed: 11 selected license-plan rows, four Finance group/person rows, seven Helpdesk ACL/delegation rows, selected run outcomes and source SHA256 values. These are distinct from simulated offline fixtures and are not raw exports. A failed visibility lookup is not called a deleted mailbox or a captured 403. No backlog case is added.

## Stage 12 current-state update

Piotr now has Department IT / Job title IT Support Specialist, unchanged display/login identifiers, no assigned product license and a blocked anchoring identity. The immediately previous exact title was not freshly captured. Historical Stage 11 report extracts retain their original memberships/delegation and are not silently rewritten to resemble current state.

[lifecycle-mailbox-observations.csv](lifecycle-mailbox-observations.csv) contains selected redacted facts from actual pre/post-delegate-repair Exchange reads, pre-unassignment licensing observations, and separately labelled final owner/capture confirmations. It excludes domains, object/archive identifiers and raw diagnostic output. It is not a new production report or a post-unassignment API inventory. [Stage 12](../docs/stages/12-employee-lifecycle.md) records custody and preservation limits. Earlier paragraphs describing M365-015 as planned apply to the historical Stage 09/10 snapshot.
