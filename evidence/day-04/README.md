# Day 04 evidence

Status: **27 screenshots published; Stage 04 COMPLETE.** Execution date: **14 November 2026**. Calendar/room events are dated 16 November. Configuration, captured behavior and owner-reported checks are distinguished below.

## Shared mailbox and delegation

### 01 — Helpdesk shared mailbox created

![01 — Helpdesk shared mailbox created](01-helpdesk-shared-mailbox-created.png)

**Shows:** Helpdesk created as a Shared mailbox; synthetic name and alias visible.

### 02 — Helpdesk signin blocked

![02 — Helpdesk signin blocked](02-helpdesk-signin-blocked.png)

**Shows:** Associated Helpdesk account shows Sign-in blocked and no administrator access.

### 03 — Helpdesk full access only

![03 — Helpdesk full access only](03-helpdesk-full-access-only.png)

**Shows:** Full Access list contains Piotr; this is opening/read configuration, not a sender grant.

### 04 — Piotr opens Helpdesk

![04 — Piotr opens Helpdesk](04-piotr-opens-helpdesk.png)

**Shows:** Helpdesk Inbox and Anna's ACCESS-01 opened in the guided Piotr session; signed-in identity is supplied by exercise context.

### 04a — Helpdesk delegation before send as

![04a — Helpdesk delegation before send as](04a-helpdesk-delegation-before-send-as.png)

**Shows:** Send As list has zero items before the sending test.

### 05 — Helpdesk send as denied

![05 — Helpdesk send as denied](05-helpdesk-send-as-denied.png)

**Shows:** SEND-01 receives the explicit permission error in Helpdesk context. From field is not displayed.

### 06 — Helpdesk send as granted

![06 — Helpdesk send as granted](06-helpdesk-send-as-granted.png)

**Shows:** Saved Send As list contains m365.piotr; separate from Full Access.

### 07 — Helpdesk send as received Anna

![07 — Helpdesk send as received Anna](07-helpdesk-send-as-received-anna.png)

**Shows:** Anna receives SEND-02 with BFL-M365-Helpdesk as sender.

### 08 — Helpdesk reply received

![08 — Helpdesk reply received](08-helpdesk-reply-received.png)

**Shows:** Anna's reply is addressed to Helpdesk and visible in the shared-mailbox conversation.

### 09 — Marek Helpdesk access denied

![09 — Marek Helpdesk access denied](09-marek-helpdesk-access-denied.png)

**Shows:** Opening fails with accessDenied / AccessDeniedException. Marek identity and working own Inbox are explicitly owner-confirmed; diagnostic identifiers including cv are masked.

### 10 — Helpdesk send on behalf granted

![10 — Helpdesk send on behalf granted](10-helpdesk-send-on-behalf-granted.png)

**Shows:** Send on behalf list contains Anna.

### 10a — Helpdesk Anna full access

![10a — Helpdesk Anna full access](10a-helpdesk-anna-full-access.png)

**Shows:** Full Access now lists Anna and Piotr.

### 11 — Helpdesk send on behalf received Marek

![11 — Helpdesk send on behalf received Marek](11-helpdesk-send-on-behalf-received-marek.png)

**Shows:** Marek receives BEHALF-01 with Anna explicitly shown on behalf of Helpdesk.

## Calendar permission comparison

### 12 — Anna calendar reader permission

![12 — Anna calendar reader permission](12-anna-calendar-reader-permission.png)

**Shows:** Anna's Calendar grants Marek Can view all details; organization entry remains free/busy.

### 13 — Marek calendar readonly event

![13 — Marek calendar readonly event](13-marek-calendar-readonly-event.png)

**Shows:** Anna's 16 November 10:00–10:30 event is visible in the shared calendar with editing unavailable; owner confirms read-only behavior and Warsaw settings.

### 14 — Anna calendar editor permission

![14 — Anna calendar editor permission](14-anna-calendar-editor-permission.png)

**Shows:** Marek's calendar permission temporarily changed to Can edit.

### 15 — Anna calendar change confirmed

![15 — Anna calendar change confirmed](15-anna-calendar-change-confirmed.png)

**Shows:** Edited event description shown. Owner confirms Marek saved and Anna saw it after reopening; the initial baseline text was replaced.

### 16 — Anna calendar reader restored

![16 — Anna calendar reader restored](16-anna-calendar-reader-restored.png)

**Shows:** Marek restored to Can view all details. Inability to edit after fresh login is owner-confirmed.

## Room policy and reservations

### 17 — Room mailbox created

![17 — Room mailbox created](17-room-mailbox-created.png)

**Shows:** Room Mailbox BFL-M365-Room-01 created; capacity metadata 6.

### 18 — Room booking settings

![18 — Room booking settings](18-room-booking-settings.png)

**Shows:** Automatic accept/decline radio selected in the actual delegate-settings panel.

### 18a — Room booking limits

![18a — Room booking limits](18a-room-booking-limits.png)

**Shows:** Saved limits: 30 days, two hours, decline outside limits; recurrence and working-hours-only unchecked.

### 19 — Room booking request Anna

![19 — Room booking request Anna](19-room-booking-request-anna.png)

**Shows:** Corrected Anna ROOM-01 draft for 16 November, 11 AM–11:30 AM. Tracking can still refer to an older event version.

### 20 — Room booking accepted

![20 — Room booking accepted](20-room-booking-accepted.png)

**Shows:** Fresh room acceptance for Anna ROOM-01 at 11 AM–11:30 AM.

### 21 — Room conflicting request Marek

![21 — Room conflicting request Marek](21-room-conflicting-request-marek.png)

**Shows:** Marek ROOM-02 asks for 11:15–11:45; room is shown unavailable.

### 22 — Room booking conflict declined

![22 — Room booking conflict declined](22-room-booking-conflict-declined.png)

**Shows:** Room declines with an explicit conflict reason, naming Anna's 11:00–11:30 booking and the Warsaw UTC+01:00 timezone.

### 23 — Room booking rescheduled request

![23 — Room booking rescheduled request](23-room-booking-rescheduled-request.png)

**Shows:** Marek is organizer of ROOM-02, edited to 12:00–12:30. Pre-send Tracking still displays the old decline.

### 24 — Room booking rescheduled accepted

![24 — Room booking rescheduled accepted](24-room-booking-rescheduled-accepted.png)

**Shows:** Conversation contains the old decline, the noon update and a new Accepted reply for ROOM-02 at 12:00–12:30.

## Owner-reported closure checks

The owner explicitly confirmed: the 09 attempt used m365.marek and his own Inbox worked; Marek saw Anna's calendar details but could not edit; his editor change persisted and was visible to Anna; editing was unavailable after restoring read permission and signing in again; the room account has Sign-in blocked; Anna's final ROOM-01 remains 11:00–11:30.

These reports supplement the images. They are not presented as screenshots, PowerShell output or independent audit logs. Exact propagation and processing intervals were not measured.

## Interpretation boundaries

The final uploaded 19/20 establish the corrected AM reservation. Earlier PM/AM and wrong-organizer drafts were corrected during guidance. Final 23 identifies Marek and ROOM-02; final 24 includes a fresh acceptance after the old decline. Do not read historical Tracking labels as responses to an unsent update.

The missing From field in 05 and absent account header in 09 limit independent session reconstruction. Calendar saving/restoration and room account blocking include attributed owner reports. Only the stated room valid/conflict/recovery sequence was tested; every booking limit and capacity enforcement were not.

## Publication review

The owner-supplied images retain synthetic names, test subjects and relevant results while masking lab domains where displayed. The owner replaced 02 with a masked version before documentation publication. Client/session/request identifiers and cv in 09 are masked. Raw diagnostics and private tenant configuration are not reproduced in text; uploaded image bytes are retained.

The tutor announced capture timing, view and filename during each phase. Optional diagnostics that were not performed are not invented: there is no required 03a/03b or 20a file. The final canonical filenames are the ones in this index.

[Implementation](../../docs/stages/04-delegation-calendars-and-rooms.md) · [Results](../../tests/day-04.md) · [Mailbox case](../../tickets/M365-004-helpdesk-sender-permission-recovery.md) · [Room case](../../tickets/M365-005-room-booking-conflict-recovery.md) · [All evidence](../README.md)
