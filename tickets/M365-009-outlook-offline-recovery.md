# M365-009 — Web mail receives while classic Outlook stays offline

Status: **RESOLVED**\
Type: **Controlled desktop synchronization exercise**\
Execution date: **16 November 2026**\
Stage: **06**

## Request, impact and scope

Diagnose why a new synthetic message appears in Marek's web mailbox but not in classic Outlook on BFL-WKS01. Deliberately enable the client's Work Offline mode, retain working web access as the control, and restore synchronization.

Impact is scoped to the selected Outlook client's synchronization during the lab exercise. Older cached mail remains readable. No Microsoft service outage is claimed.

## Diagnosis and recovery

| Phase | Observation | Source / interpretation |
| --- | --- | --- |
| Normal baseline | OUTLOOK-01 and OWA-01 work between desktop and web | 03 and explicit owner confirmation |
| Controlled fault | Work Offline selected; Working Offline status | 05; client mode visibly explains lack of synchronization |
| Service-side control | OFFLINE-01 received in the same Marek mailbox through web | Owner confirmation; distinguishes the available mailbox from the offline desktop |
| Bounded desktop observation | OFFLINE-01 absent for approximately 60 seconds | Owner report, not an indefinite non-delivery claim |
| Correction | Toggle Work Offline off and synchronize | Same client and mailbox retained |
| Affected action recovered | Same OFFLINE-01 opened; Connected to: Microsoft Exchange | 06 and owner confirmation |
| New regression control | SYNC-02 sent from desktop and received in web | Explicit owner confirmation |

The supported cause is **Work Offline enabled in classic Outlook**. The recorded repair is returning that client online; it does not require a transport-rule, mailbox-permission or license change. Exact reconnection latency was not measured.

## Final state

Classic Outlook is connected to Microsoft Exchange. The owner later restored Marek's original profile after the Piotr delegation test and confirmed Marek's active Word product. **T15 PASS** is based on observed discrepancy, a specific client diagnosis, receipt of the affected message and a new control.

This result does not diagnose every possible Disconnected state. The VM's earlier connectivity problem was separately reported recovered; its root cause was not established. No profile corruption, service incident or authentication-cache failure was proved.

## Communication and closure

Suggested closure note: "Your mailbox was receiving mail in the browser, but classic Outlook had Work Offline enabled. It is now connected to Exchange, the missing test message has appeared, and a new desktop message has reached web mail."

This is sample wording, not an externally sent message.

[Stage](../docs/stages/06-outlook-and-microsoft-365-apps.md) · [Results](../tests/day-06.md) · [Evidence](../evidence/day-06/README.md) · [Office identity case](M365-008-office-identity-recovery.md)
