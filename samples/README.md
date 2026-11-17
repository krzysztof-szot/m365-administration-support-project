# Curated synthetic lab samples

- [pilot-users.csv](pilot-users.csv): three provisioned fictional pilots. UserKey is a stable planning key; LoginAlias is the actual local login name without the tenant domain. Status PROVISIONED describes account creation, not completion of every future permission exercise.
- [ticket-backlog.csv](ticket-backlog.csv): 15 lab cases; M365-001–014 RESOLVED with [case records](../tickets/README.md), the remaining case PLANNED. M365-006 closes a diagnosed expected rejection; M365-007 records recovery after disabling the scoped rule. M365-008 corrects the active Office identity while distinguishing the licensing account; M365-009 restores a deliberately offline desktop client. M365-010 verifies temporary private-channel authorization and restoration; Piotr does not retain private access at closure. M365-011 verifies the knowledge-site reader/editor roles; M365-012 diagnoses retained document access after a single link is revoked. The separate folder restriction ends with inheritance and Piotr access restored.

Display names and product assignments are supported by the Day 01/02 evidence. Piotr/Marek's Department and JobTitle are owner-reported; the owner waived profile screenshots. Anna's Finance department remains a design value, not an independently captured attribute. ProfileEvidence preserves that distinction.

These are curated samples, not raw Graph/Exchange exports or workplace data. No real domain, tenant identifier, password or billing information is included.

M365-013 verifies resumed OneDrive synchronization; M365-014 verifies full-content previous-version and deleted-file restoration. The synchronized original ends at V1; the Downloads V2 helper is retained outside OneDrive. M365-015 offboarding remains planned.

Stage 10 adds a case-impact/urgency review, a prepared escalation package and user-tested knowledge procedures. It does not add a backlog ID or resolve M365-015; that offboarding case remains planned. The Exchange RBAC exception is still unresolved.


## Stage 11 report extracts

[reports/](reports/README.md) contains reviewed live observations with domains, object identifiers and host paths removed: 11 selected license-plan rows, four Finance group/person rows, seven Helpdesk ACL/delegation rows, selected run outcomes and source SHA256 values. These are distinct from simulated offline fixtures and are not raw exports. A failed visibility lookup is not called a deleted mailbox or a captured 403. No backlog case is added.
