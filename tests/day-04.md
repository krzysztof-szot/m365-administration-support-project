# Day 04 validation record

Status: **COMPLETE**. Execution date: **14 November 2026**. Evidence: [27 screenshots](../evidence/day-04/README.md). These are manual Outlook-on-the-web checks.

## Matrix results

| Check | Expected | Observed | Result / source |
| --- | --- | --- | --- |
| T07 — Full Access without Send As | Distinguish mailbox opening from sender authorization | Piotr opens Helpdesk and reads ACCESS-01; Send As list is empty; SEND-01 receives a permission error | **PASS**; 03/04/04a/05; From not displayed in the denial capture |
| T08 — Authorized delegation | Delegate sends with the intended permission | Piotr's saved Send As grant, received Helpdesk message and reply to the mailbox; Anna's separate Send on behalf message received by Marek | **PASS**; 06–08 and 10/10a/11 |
| T09 — Excluded identity | Excluded identity cannot open Helpdesk | AccessDeniedException; owner confirms m365.marek was used and his own Inbox worked | **PASS**; 09 plus owner report |
| T10 — Calendar reader | Reader sees event but cannot modify it | Marek sees Anna's title/description and 10:00–10:30 event; editing unavailable | **PASS**; 12/13 plus owner report |
| T29 — Valid reservation | Room processes an allowed request under recorded settings | Anna's corrected 11:00–11:30 request receives Accepted | **PASS**; 17/18/18a/19/20 |
| T30 — Conflicting reservation | Room processes an overlap under recorded settings | Marek's 11:15–11:45 request is declined with Anna's 11:00–11:30 named as conflict | **PASS**; 21/22 |

The cumulative [32-check matrix](test-matrix.csv) is **13 PASS / 19 NOT_RUN**. Newly passed: T07, T08, T09, T10, T29, T30. Calendar editing, permission restoration, reply flow and booking recovery are supporting phases, not extra matrix rows.

## Supporting verification and restoration

| Observation | Result and evidence |
| --- | --- |
| Shared-account direct login | Helpdesk Sign-in blocked captured in 02; room Sign-in blocked confirmed by owner at closure |
| Calendar editor | Can edit granted in 14; modified description in 15; owner confirms Marek saved and Anna saw it after reopening |
| Calendar restoration | Can view all details restored in 16; owner confirms no editing after fresh login |
| Room recovery | Same Marek ROOM-02 moved to 12:00–12:30 in 23; new Accepted reply in 24 |
| Retained control reservation | Owner confirms Anna ROOM-01 remains 16 November, 11:00–11:30 |
| Timezone | Owner confirms both pilot calendars use Warsaw; room decline explicitly identifies UTC+01:00 including Warsaw |

The room event date is 16 November; configuration and submission were executed on 14 November. Shared-mailbox mail timestamps use differing display formats/time contexts, so they are not used to calculate service latency.

## Interpretation boundaries

The initial Piotr opening failure and a send denial after assignment later resolved; no measured propagation interval or independently verified transient root cause is recorded. Exchange PowerShell verification was waived and not performed.

Screen 05 captures the sending error in Helpdesk context, but not the From field or signed-in account header. Session identity comes from the guided owner context. Marek's 09 error likewise needs the owner's explicit identity/own-Inbox confirmation. These are scoped UI tests, not a tenant-wide permission audit.

The calendar description shown after editing replaces the initial baseline text. Persistence in Anna's session and inability to edit after restoration are owner-reported. Capacity 6, a 30-day window, two-hour maximum and disabled recurrence are configuration evidence; only the stated valid/conflict/recovery bookings were functionally tested.

Tracking in a pre-send edit can retain the earlier response: 23 still shows Declined, while 24 establishes the new Accepted result. Early PM/AM and wrong-organizer drafts were corrected; final published 19/20 and 23/24 establish the accepted requests.

No mail-flow rule, Message Trace, desktop activation, script execution or validated Copilot exercise was performed. Stages 05–14 remain planned.

[Implementation](../docs/stages/04-delegation-calendars-and-rooms.md) · [Evidence](../evidence/day-04/README.md) · [Delegation case](../tickets/M365-004-helpdesk-sender-permission-recovery.md) · [Room case](../tickets/M365-005-room-booking-conflict-recovery.md)
