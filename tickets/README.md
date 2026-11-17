# Support cases

Status: **15 of 15 lab cases RESOLVED.** These are guided, synthetic service requests and controlled training conditions, not production incidents.

| Case | Type / stage | Verified outcome |
| --- | --- | --- |
| [M365-001 — Pilot license recovery](M365-001-pilot-license-recovery.md) | Service request / 02 | Piotr's working identity gains Exchange access after licensing; two-way mail verified |
| [M365-002 — Finance alias delivery](M365-002-finance-alias-delivery.md) | Service request / 03 | Explicit external alias target delivers to Anna's existing mailbox |
| [M365-003 — Distribution membership recovery](M365-003-distribution-membership-recovery.md) | Controlled incident / 03 | Direct mail control works; omitted DL member is re-added; delivery recovers |
| [M365-004 — Helpdesk sender-permission recovery](M365-004-helpdesk-sender-permission-recovery.md) | Controlled permission exercise / 04 | Read access works; separate Send As enables the intended sender and reply flow |
| [M365-005 — Room booking conflict](M365-005-room-booking-conflict-recovery.md) | Booking conflict exercise / 04 | Explicit conflict decline followed by acceptance of the rescheduled request |
| [M365-006 — Unknown-recipient diagnosis](M365-006-unknown-recipient-diagnosis.md) | Invalid-recipient exercise / 05 | NDR and Trace identify the unresolved SMTP address; closed as diagnosed expected rejection |
| [M365-007 — Scoped rule recovery](M365-007-scoped-rule-recovery.md) | Controlled mail-flow rule / 05 | Marked failure and unmarked delivery; rule disabled and new marked message Delivered |
| [M365-008 — Office identity recovery](M365-008-office-identity-recovery.md) | Controlled client identity / 06 | Piotr active user distinguished from subscription still naming Marek; intended identity and functional checks restored |
| [M365-009 — Outlook offline recovery](M365-009-outlook-offline-recovery.md) | Controlled synchronization / 06 | Same mailbox works in web; disabling Work Offline delivers the affected message and new outbound control succeeds |
| [M365-010 — Private-channel membership](M365-010-private-channel-membership-recovery.md) | Controlled authorization/restoration / 07 | Parent-team member denied, temporary channel membership grants access, removal restores private denial while standard access remains |
| [M365-011 — Knowledge reader](M365-011-knowledge-reader-access.md) | Service request / 08 | Piotr reads but cannot edit original KB-01; Marek saves and Anna sees the change |
| [M365-012 — Revoked link and retained access](M365-012-revoked-link-retained-access.md) | Controlled access diagnosis / 08 | Old URL reports removed; authorized library access remains; isolated folder denial/restoration verified |
| [M365-013 — Paused OneDrive sync](M365-013-onedrive-paused-sync-recovery.md) | Controlled synchronization / 09 | Resume and fresh synchronized-file reopening restore matching V2 |
| [M365-014 — OneDrive content recovery](M365-014-onedrive-file-recovery.md) | Recovery request / 09 | History and recycle-bin restores each return full original V1 in web/local views |
| [M365-015 — Employee offboarding](M365-015-employee-offboarding.md) | Guided service request / 12 | Mover controls, denied new sign-in, corrected mailbox custody, license removal and selected V1 handover verified |

The [backlog](../samples/ticket-backlog.csv) now contains fifteen resolved guided lab cases. Use [TICKET-TEMPLATE.md](TICKET-TEMPLATE.md) for new work. Each record includes the request, scope, diagnostic decisions, supported cause, reversible action, verification and suggested closure wording. Closure wording in documents is not evidence of an externally sent support message. The Stage 05 custom-role-group delegation error remains an unresolved administrative exception; it is not counted as a repaired permission incident.

An expected failure in a controlled exercise is not a real outage. Preserve observed errors and source attribution; do not invent error codes, formal SLA priorities or transport traces. Record windows for non-receipt and distinguish missing evidence from a failed functional check.

Suggested workflow: PLANNED → IN_PROGRESS → RESOLVED, or BLOCKED with the actual dependency. The [support-case issue form](../.github/ISSUE_TEMPLATE/support-case.yml) can track future work; these case documents contain the final lab record.

## Stage 10 operational review

The [case review](stage-10-case-review.md) compares observed impact, unknown business urgency, workarounds and conditional escalation criteria. The [second-line package](escalations/exchange-role-delegation.md) preserves the unresolved Stage 05 delegation error, evidence limits and proposed read checks. Both are prepared with assistant support; no support message was sent or fresh RBAC investigation executed. The 14 resolved / 1 planned backlog is unchanged.

The [knowledge articles](../knowledge-base/README.md) have attributed user reproduction. Those tests recheck existing capabilities and do not create extra incident IDs.

## Stage 12 lifecycle closure

[M365-015](M365-015-employee-offboarding.md) closes the scoped guided move/offboarding with T26–T28. Its wrong-Anna diagnostic/recovery is part of the request, not a sixteenth incident. The final Knowledge query is inconclusive and retained as a limitation. Historical Stage 10/11 case counters below their dates remain historical; the separate Stage 05 RBAC exception is still unresolved.
