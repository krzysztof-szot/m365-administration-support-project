# Day 06 evidence — Outlook and Microsoft 365 Apps

Execution date: **16 November 2026**. Nine owner-supplied captures support [Stage 06](../../docs/stages/06-outlook-and-microsoft-365-apps.md) and [T14/T15](../../tests/day-06.md). Captured configuration, functional results and owner confirmations are distinguished below.

## Capture index

| File | Observation and scope |
| --- | --- |
| [01-office-activation-marek.png](01-office-activation-marek.png) | Marek is signed in, but Microsoft 365 Apps for business shows Activation Required and a reduced-functionality warning. Starting state, not activation success or subscription-expiry proof. |
| [02-office-activated-marek.png](02-office-activated-marek.png) | Marek with Subscription Product, activation warning absent; Word Version 2610 / Build 20527.20196 / Current Channel. Local document persistence is separately owner-confirmed. |
| [03-outlook-classic-mail-test.png](03-outlook-classic-mail-test.png) | Marek opens OWA-01 in desktop Outlook; OUTLOOK-01 is also in the list. Both send/receive directions are explicitly owner-confirmed. |
| [04-office-wrong-identity.png](04-office-wrong-identity.png) | User Information names Piotr; Product Information still names Marek as subscription account. Shows the controlled identity mismatch, not an activation outage or a Piotr license switch. |
| [05-outlook-working-offline.png](05-outlook-working-offline.png) | Work Offline selected and Working Offline on the status bar; older RECOVERY-01 remains readable. Web receipt and about 60 seconds of no desktop OFFLINE-01 are owner-confirmed. |
| [06-outlook-online-recovery.png](06-outlook-online-recovery.png) | Same OFFLINE-01 opened after reconnect, with Connected to: Microsoft Exchange. New outbound SYNC-02 receipt in web is owner-confirmed. |
| [07-outlook-shared-calendar-readonly.png](07-outlook-shared-calendar-readonly.png) | Anna's shared folder, CAL-01 Finance planning, 16 November 10:00–10:30, and Appointment (Read-Only). Marek session and denied editing are owner-confirmed; the body is retained Stage 04 content. |
| [08-outlook-shared-mailbox-desktop.png](08-outlook-shared-mailbox-desktop.png) | Piotr's mailbox context and Helpdesk Inbox with Marek's final SHARED-01 reply. Quoted exchange shows Helpdesk's earlier response; sender receipt and full operation sequence are also owner-confirmed. |
| [09-outlook-version.png](09-outlook-version.png) | Owner's additional version-only crop: Outlook Version 2610, Build 20527.20196, Click-to-Run, Current Channel. 64-bit comes from the owner's text, not this crop. |

## Interpretation boundaries

The owner confirms successful local Word reopen/edit/save, normal mail in both directions, identity restoration and RECOVERY-01, the bounded offline comparison, SYNC-02, calendar edit denial, the Helpdesk round trip, return to Marek's Outlook profile and final active Word identity. Separate captures for each confirmation were deliberately not required.

The initial Activation Required state is separate from the later wrong-user exercise. The subscription still names Marek in 04. The CAL-01 body says "Edited by Marek" because Stage 04 temporarily granted editor access; 07 shows the current Read-Only window. Quoted message headers in 08 are not a raw transport-header audit. Message timestamps do not establish a measured recovery/propagation interval.

The guided Piotr profile name is not visible in 08, although its primary mailbox context is. Deletion of that additional profile, device registration/enrollment status, New Outlook functionality and Copilot output were not verified.

## Publication review

The eight numbered full captures were reviewed as supplied by the owner. Visible private UPN domains are masked while synthetic aliases, resource names and relevant results remain readable. The additional version crop contains product/version information and is published as 09-outlook-version.png. All nine image byte sequences are preserved; no result was reconstructed or edited for publication. The private handoff, network output, raw headers and local document are not uploaded.

[Results](../../tests/day-06.md) · [Identity case](../../tickets/M365-008-office-identity-recovery.md) · [Offline case](../../tickets/M365-009-outlook-offline-recovery.md) · [All evidence](../README.md)
