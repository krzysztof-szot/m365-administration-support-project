# Support cases

Status: **5 of 15 lab cases RESOLVED; 10 PLANNED.** These are guided, synthetic service requests and controlled training conditions, not production incidents.

| Case | Type / stage | Verified outcome |
| --- | --- | --- |
| [M365-001 — Pilot license recovery](M365-001-pilot-license-recovery.md) | Service request / 02 | Piotr's working identity gains Exchange access after licensing; two-way mail verified |
| [M365-002 — Finance alias delivery](M365-002-finance-alias-delivery.md) | Service request / 03 | Explicit external alias target delivers to Anna's existing mailbox |
| [M365-003 — Distribution membership recovery](M365-003-distribution-membership-recovery.md) | Controlled incident / 03 | Direct mail control works; omitted DL member is re-added; delivery recovers |
| [M365-004 — Helpdesk sender-permission recovery](M365-004-helpdesk-sender-permission-recovery.md) | Controlled permission exercise / 04 | Read access works; separate Send As enables the intended sender and reply flow |
| [M365-005 — Room booking conflict](M365-005-room-booking-conflict-recovery.md) | Booking conflict exercise / 04 | Explicit conflict decline followed by acceptance of the rescheduled request |

The [backlog](../samples/ticket-backlog.csv) keeps the other 10 cases PLANNED. Use [TICKET-TEMPLATE.md](TICKET-TEMPLATE.md) for new work. Each record includes the request, scope, diagnostic decisions, supported cause, reversible action, verification and suggested closure wording. Closure wording in documents is not evidence of an externally sent support message.

An expected failure in a controlled exercise is not a real outage. Preserve observed errors and source attribution; do not invent error codes, formal SLA priorities or transport traces. Record windows for non-receipt and distinguish missing evidence from a failed functional check.

Suggested workflow: PLANNED → IN_PROGRESS → RESOLVED, or BLOCKED with the actual dependency. The [support-case issue form](../.github/ISSUE_TEMPLATE/support-case.yml) can track future work; these case documents contain the final lab record.
