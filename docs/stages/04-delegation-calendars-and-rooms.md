# Stage 04 — Shared mailboxes, calendars and room booking

Status: **COMPLETE**  
Execution date: **14 November 2026**  
Target days: **6–7** — learning-plan estimates, not execution dates  
Evidence: [27 screenshots](../../evidence/day-04/README.md) · [Validation record](../../tests/day-04.md)

## Requirement and result

Helpdesk needs delegated mail handling without direct sign-in. A delegate must be able to read the mailbox independently of permission to send from it. Finance also needs controlled calendar sharing and a room that processes competing booking requests.

Piotr opened Helpdesk but initially received a sending-permission error. After separate Send As assignment, Anna received mail from Helpdesk and her reply reached the shared mailbox. Anna separately sent on behalf of Helpdesk, while Marek's attempt to open it was denied. Calendar read/edit permissions were exercised and restored; a conflicting room request was declined and accepted after rescheduling.

These are guided exercises using synthetic identities. The room conflict is expected policy operation, not a Microsoft service outage.

## Environment and scope

The exercise used Outlook on the web on Windows 11: pilot sessions in Chrome, administration in Edge. Existing Premium entitlements and the three-user MFA pilot were retained. The recorded Exchange Recipient Administrator assignment on adm-lab is Direct/Active/Permanent; no removal or automatic expiry was reported in this stage. Individual portal screenshots do not independently audit every administrative actor.

Addresses below use local aliases only; append the private lab domain when reproducing the procedure.

| Resource | Recorded configuration and outcome |
| --- | --- |
| BFL-M365-Helpdesk / bfl-m365-helpdesk | Shared mailbox; direct sign-in blocked in 02 |
| Piotr | Full Access, then separate Send As; read, sending and reply receipt verified |
| Anna | Full Access plus Send on behalf; recipient sees Anna on behalf of Helpdesk |
| Marek | Excluded from shared-mailbox access; own Inbox works but opening Helpdesk is denied |
| Anna's own Calendar | Marek initially Can view all details, temporarily Can edit, then restored to Can view all details |
| BFL-M365-Room-01 / bfl-m365-room-01 | Room Mailbox, capacity metadata 6; direct sign-in blocked at closure, owner-reported |

## Implementation and verification

### Shared mailbox and sender permissions

1. Created Helpdesk through Exchange recipient administration and confirmed its SharedMailbox type. Checked the associated account's sign-in block in Microsoft 365 administration.
2. Granted Full Access to Piotr, with Send As initially empty. Opened the mailbox through Piotr's own licensed Outlook session using Open another mailbox.
3. Read Anna's ACCESS-01 message and attempted SEND-01. Outlook displayed: "You don't have permission to send messages from this mailbox."
4. Added Piotr under Send As and verified the saved entry. Sent a new SEND-02 message; Anna saw Helpdesk as sender and replied. Piotr read the reply in Helpdesk.
5. Tried opening Helpdesk from Marek's session. AccessDeniedException was captured; the owner separately confirmed the tested identity and that Marek's own Inbox worked.
6. Added Anna to Full Access and, separately, Send on behalf. Sent BEHALF-01 to Marek; the received sender explicitly identifies Anna on behalf of Helpdesk.

[Captures 01–11](../../evidence/day-04/README.md#shared-mailbox-and-delegation) support T07–T09. Send As and Send on behalf were exercised with different delegates so Send As did not mask the latter behavior.

An earlier mailbox-opening AccessDenied and a later send denial following assignment resolved on retry. Their precise causes and propagation intervals were not established. No Exchange PowerShell diagnostic query was executed.

### Calendar reader, editor and restoration

Created CAL-01 in Anna's own Calendar for **16 November 2026, 10:00–10:30**, with no invitees or Teams meeting. Shared it to Marek as Can view all details. Marek opened the event but could not edit it.

Anna temporarily changed Marek to Can edit. Marek changed the description to "Edited by Marek — editor permission verified." The owner confirmed that Anna saw the saved change after reopening. The final screenshot shows the changed description, rather than the original baseline plus an appended line.

Restored Can view all details. The owner confirmed that Marek could no longer edit after a fresh login. The organization-level entry remained Can view when I'm busy.

[Captures 12–16](../../evidence/day-04/README.md#calendar-permission-comparison) and attributed owner reports support T10 and the editor/restoration comparison.

### Room policy and booking recovery

Created the Room Mailbox and inspected saved booking settings:

| Setting | Recorded value |
| --- | --- |
| Booking handling | Accept or decline booking requests automatically |
| Booking window | 30 days |
| Maximum duration | 2 hours |
| Decline requests outside limits | Enabled |
| Repeated meetings | Disabled |
| Working-hours-only restriction | Disabled |
| Capacity | 6; metadata only, capacity enforcement not tested |

Booking date: **16 November 2026**. Anna/Marek's Warsaw settings are owner-confirmed; the decline reply explicitly identifies UTC+01:00, including Warsaw.

| Phase | Organizer / subject | Requested time | Observed room response |
| --- | --- | --- | --- |
| Valid request | Anna / LAB-D04-ROOM-01 | 11:00–11:30 | Accepted, 19/20 |
| Controlled conflict | Marek / LAB-D04-ROOM-02 | 11:15–11:45 | Declined; reply names Anna's 11:00–11:30 reservation, 21/22 |
| Recovery | Marek / same ROOM-02 | 12:00–12:30 | Accepted after update, 23/24 |

The first request was initially entered as 11 PM and then corrected to 11 AM. The published final 19/20 show the corrected request and its new acceptance. During recovery, an intermediate draft targeted Anna's ROOM-01; this was corrected before accepting the final evidence. Final 23 identifies Marek as organizer of ROOM-02, and 24 contains its acceptance for noon. The owner confirmed Anna's final booking remains 11:00–11:30.

Pre-send Tracking statuses in 19/23 can describe an earlier version of the event. The actual room replies in 20/22/24 establish each outcome. Capacity, recurrence, maximum-duration and booking-window rejection were not separately tested.

## Exit checks and retained state

- [x] Opening and sending verified as separate operations — T07/T08.
- [x] Excluded identity denied, with an owner-reported working own-mailbox control — T09.
- [x] Calendar reader reads but cannot edit; editor works; read permission restored — T10.
- [x] Room accepts a valid request and declines an overlap according to recorded policy — T29/T30.
- [x] Rescheduling produces a fresh acceptance without changing conflict policy.
- [x] Room sign-in block and Anna's retained booking confirmed by the owner.

Helpdesk retains Piotr's Full Access/Send As and Anna's Full Access/Send on behalf. Marek remains excluded from mailbox opening and is a reader of Anna's calendar. The room and accepted reservations remain available for later lab work. Recipient-admin access is not represented as removed or time-limited.

## Interpretation and learning

The six Stage 04 matrix rows are PASS; at Stage 04 closure the cumulative matrix was **13 PASS / 19 NOT_RUN**. Owner reports supply session identity, selected persistence/restoration checks and the room account block. They are not replaced by invented screenshots or audit logs.

The missing From field in the initial denial screenshot limits exact reconstruction of that attempt; the mailbox context, empty Send As list, subsequent grant and successful received message support the exercised permission distinction. No fresh PowerShell audit, desktop Outlook test, Message Trace or deliberate Copilot output validation is claimed.

I can explain why Full Access and sender permissions are separate, how Send As differs from Send on behalf, why a calendar reader is not an editor, and why a room's own response is stronger evidence than an event merely appearing in the organizer's calendar.

[Mailbox case](../../tickets/M365-004-helpdesk-sender-permission-recovery.md) · [Room case](../../tickets/M365-005-room-booking-conflict-recovery.md) · [Microsoft references](../sources.md#day-04-implementation-references) · [Stage index](README.md) · [Next: mail-flow troubleshooting](05-mail-flow-troubleshooting.md)
