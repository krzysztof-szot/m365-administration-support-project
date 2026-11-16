# Day 06 — Desktop identity, activation and Outlook recovery

Execution date: **16 November 2026**. These are guided manual checks in BFL-WKS01 using classic Outlook and Microsoft 365 Apps for business.

## Matrix results

| Check | Expected | Observed | Result / source |
| --- | --- | --- | --- |
| T14 — Client identity and activation | Intended licensed identity active in the recorded client | Marek activation warning replaced by Subscription Product; wrong Piotr user distinguished from the subscription still naming Marek; Marek restored with successful document and mail checks | **PASS**; 01/02/04/09 plus owner confirmations |
| T15 — Browser and desktop comparison | Observed difference supports a specific account/client diagnosis | Same Marek mailbox receives in web while classic Outlook is Working Offline; after reconnect the same OFFLINE-01 arrives and new outbound SYNC-02 reaches web | **PASS**; 03/05/06 plus owner-reported approximately 60-second non-receipt and controls |

At Day 06 closure the cumulative matrix is **18 PASS / 14 NOT_RUN** of 32. M365-008 and M365-009 are resolved controlled lab cases. Supporting phases below are not additional matrix rows; the Stage 04 delegation test IDs retain their first execution history.

## Supporting functional and restoration checks

| Phase | Identity / client | Observation and source |
| --- | --- | --- |
| Initial activation | Marek / Word | 01: Activation Required despite correct User Information; initial technical cause not established |
| Activation correction | Marek / Word | 02: Subscription Product, warning absent after guided license refresh |
| Local Word persistence | Marek / Word | Owner confirms LAB-D06-WORD-01 saved to desktop, reopened, edited and saved |
| Normal desktop → web mail | Marek / classic Outlook and web | OUTLOOK-01 received in web, owner-confirmed |
| Normal web → desktop mail | Marek / web and classic Outlook | OWA-01 opened in 03; owner confirms receipt |
| Wrong active Office user | Piotr / Word | 04: User Information is Piotr; subscription explicitly remains for Marek |
| Identity recovery | Marek / Word and classic Outlook | Owner confirms active product, document edit/save and RECOVERY-01 received in web |
| Offline negative/control | Marek / classic Outlook and web | 05 shows Working Offline; web receives OFFLINE-01 while desktop does not for about 60 seconds per owner |
| Offline recovery | Marek / classic Outlook | 06 opens the same OFFLINE-01; Connected to: Microsoft Exchange |
| New outbound regression | Marek / classic Outlook → web | SYNC-02 sent from desktop and received in web, owner-confirmed |
| Shared calendar | Marek / classic Outlook | 07: Anna's CAL-01 title/body in Appointment (Read-Only); owner reports editing denied |
| Shared mailbox read | Piotr / classic Outlook | Owner confirms reading Marek's new SHARED-01 in Helpdesk |
| Delegated sender/reply | Piotr / classic Outlook; Marek / web | Owner confirms Helpdesk reply received by Marek and final reply read by Piotr; 08 shows final received message in Helpdesk and quoted exchange |
| Final restoration | Marek / Outlook and Word | Original Outlook profile restored; Word Marek/active product explicitly reconfirmed by owner |
| Client record | Classic Outlook | 09: Version 2610, Build 20527.20196, Click-to-Run, Current Channel; 64-bit owner-confirmed |

## Interpretation boundaries

- 04 demonstrates an active-user/licensing-account mismatch. It does not show loss of activation or a product licensed to Piotr.
- Local Word document persistence is owner-reported and is not OneDrive sync validation.
- 05 retains older readable mail while offline. The owner supplies the observation interval and web receipt; the image alone does not prove mail was absent forever or every folder was checked.
- 06 establishes receipt after reconnection. Displayed message time is not a measured synchronization duration.
- 07 is explicitly Read-Only. Its existing "Edited by Marek" body belongs to the earlier editor exercise and was not newly changed here.
- 08 includes quoted From lines, not independently verified raw transport headers. The sender result and sequence are supported by the explicit recipient/operator confirmations.
- Profile creation name, final return to Marek and 64-bit architecture include owner statements. The additional Piotr profile was not reported deleted.
- Initial network failure was followed by owner-confirmed connectivity. The exact repair and cause were not supplied. Device registration/enrollment, New Outlook and Copilot operation were not validated.

The earlier unresolved Stage 05 role-delegation exception is not counted as repaired. No Pester, CI workload test or PowerShell report was executed. Documentation validation is separate from these manual service checks.

[Stage record](../docs/stages/06-outlook-and-microsoft-365-apps.md) · [9 evidence captions](../evidence/day-06/README.md) · [Global matrix](test-matrix.csv) · [Cases](../tickets/README.md)
