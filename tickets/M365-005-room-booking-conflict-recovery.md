# M365-005 — Room request declined because the time is occupied

Status: **RESOLVED**  
Type: **Booking conflict exercise — expected policy behavior**  
Execution date: **14 November 2026**  
Booking date: **16 November 2026**, Warsaw time  
Stage: **04**

## Impact and scope

Marek cannot reserve BFL-M365-Room-01 for 11:15–11:45 because Anna already has an accepted 11:00–11:30 booking. The service is behaving as configured. The recovery is to change Marek's request to an available time, preserving Anna's reservation and the room policy.

## Diagnosis

| Question | Check | Observation and decision |
| --- | --- | --- |
| How are requests processed? | Saved room settings | Automatic accept/decline; 30-day window; two-hour maximum; recurrence and working-hours-only off (17/18/18a) |
| Does a valid request work? | Anna ROOM-01 and actual room reply | Corrected 11:00–11:30 request accepted (19/20) |
| Does Marek's request overlap? | ROOM-02 request | 11:15–11:45; room shown unavailable (21) |
| What does the server report? | Room's decline reply | Explicit conflicts reason, naming Anna and her 11:00–11:30 reservation (22) |
| Can the request succeed at a free time? | Update Marek's existing ROOM-02 | 12:00–12:30 accepted in a new room response (23/24) |

The conflict reply states UTC+01:00, including Warsaw. The requester timezone is also owner-confirmed.

## Resolution and verification

Changed Marek's ROOM-02 to **12:00–12:30** and sent the update to the room. New acceptance verifies recovery. **T29/T30 PASS**, with rescheduling as an additional recovery phase. The conflict policy was not relaxed.

The first Anna request had an AM/PM error, corrected before the final accepted baseline. An intermediate recovery draft targeted Anna's meeting; final evidence instead identifies Marek as organizer of ROOM-02. The owner confirms Anna's final 11:00–11:30 reservation remains.

A previous Declined entry in pre-send Tracking (23) describes the old request; the fresh Accepted reply (24) establishes the new outcome. A calendar entry or its subject alone is not acceptance proof.

## Final state and limits

Room retained; automatic policy retained. Anna remains at 11:00–11:30, Marek at 12:00–12:30. Room direct sign-in is blocked, owner-confirmed without a separate screenshot.

The capacity and booking limits were inspected, not exhaustively tested. No service outage, manual delegate approval, transport-rule change or measured processing latency is claimed.

Suggested closure note: "The room declined the original time because it overlapped an existing reservation. We moved your request to noon and received the room's acceptance; the other booking is retained."

[Stage](../docs/stages/04-delegation-calendars-and-rooms.md) · [Results](../tests/day-04.md) · [Evidence 17–24](../evidence/day-04/README.md#room-policy-and-reservations)
