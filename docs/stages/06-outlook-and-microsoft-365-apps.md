# Stage 06 — Outlook and Microsoft 365 Apps

Status: **COMPLETE**\
Execution date: **16 November 2026**\
Target days: **10–11** — learning-plan estimates\
Evidence: [9 captures](../../evidence/day-06/README.md) · [Results](../../tests/day-06.md)

## Requirement and result

Prepare a desktop client for Marek, separate the signed-in Office identity from the account licensing the product, and diagnose a browser/desktop mail difference using the same mailbox. Recheck existing calendar and shared-mailbox delegation in classic Outlook.

Microsoft 365 Apps activation was confirmed after an initial Activation Required state. Word document reopening, editing and saving and browser/desktop mail exchange succeeded. A controlled Piotr Office sign-in left the product subscription displaying Marek; the intended Marek identity was restored. Work Offline prevented new desktop receipt while web mail worked; reconnecting delivered the same message and a new outbound control succeeded. Marek read Anna's calendar in Read-Only mode, and Piotr completed a Helpdesk reply round trip from classic Outlook.

These are guided exercises with synthetic users, not production incidents or an independent capstone.

## Environment and readiness

| Component | Recorded state and source |
| --- | --- |
| Workstation | BFL-WKS01 on VMware Workstation Pro, dedicated to lab use per owner |
| Windows | Windows 11 Enterprise Evaluation, build 26100; 4 GB RAM, owner inventory |
| Initial VM applications | Word absent; new Outlook suspected by owner; initial host-level Word report did not establish VM readiness |
| Connectivity | Initially unavailable, later owner-confirmed working before installation; exact network repair and cause were not supplied |
| Installed applications | Microsoft 365 Apps installed inside the VM; Word and both Outlook variants present per owner |
| Tested Outlook | **Classic Outlook**, Version **2610**, Build **20527.20196**, Click-to-Run, **Current Channel**; capture 09, 64-bit owner-confirmed |
| Tested Word | Microsoft 365 Apps for business; Version **2610**, Build **20527.20196**, Click-to-Run, Current Channel; captures 01/02/04 |
| Pilot context | Marek for the baseline and restored working state; Piotr for the controlled Office identity and separate Outlook-profile delegation test |

The reused VM had an earlier lab network context. The initial timeout did not establish that a domain controller was powered off or that DNS alone caused the failure. No domain removal, public-DNS substitution, VMware network reset, new Entra join or MDM enrollment is recorded. App-only sign-in was instructed when offered; actual registration/enrollment state was not audited. Windows Evaluation status is separate from Office subscription activation.

## Implementation and observed behavior

### Activation and working baseline

Capture 01 shows Marek in User Information and **Activation Required** for Microsoft 365 Apps for business. The warning states that most Word features would be disabled on 21 November; it is not evidence of the tenant subscription expiry date.

The guided correction was Word **File → Account → Update License**, using Marek and restarting Office. Capture 02 then shows **Subscription Product** with the activation warning absent. No administrative entitlement change or license purchase forms part of the recorded correction; the precise initial activation failure mechanism was not established.

The owner saved the local synthetic document **LAB-D06-WORD-01** on the VM desktop, then confirmed reopening, editing and saving it. This tests a local document, not OneDrive synchronization. Marek's classic Outlook and browser sessions exchanged self-addressed OUTLOOK-01 and OWA-01 messages. Capture 03 shows OWA-01 opened in the desktop client; both directions are owner-confirmed.

### Controlled wrong Office identity — M365-008

The guided procedure signed Marek out of Office, closed the applications and signed Word in as Piotr. Capture 04 shows **M365 Piotr Operations** in User Information while Product Information explicitly says **Subscription Product for m365.marek**.

The observed fault is the wrong active Office user for Marek's task. It is not a captured activation outage and does not prove that Piotr became the licensing account. The owner restored Marek and confirmed an active product, document editing/saving and RECOVERY-01 delivery from desktop to web. Final Marek identity and product activation were reconfirmed after the delegation test.

### Browser works while classic Outlook is offline — M365-009

1. Selected **Send/Receive → Work Offline** in Marek's classic Outlook.
2. Sent **LAB-D06-OFFLINE-01 — Web works, desktop offline** from Marek's browser session to his own mailbox.
3. The owner confirmed web receipt and no desktop receipt for approximately **60 seconds**. Capture 05 shows the enabled Work Offline control and **Working Offline** status, with older mail still readable.
4. Turned Work Offline off and synchronized. Capture 06 shows the **same OFFLINE-01** opened and **Connected to: Microsoft Exchange**.
5. The owner sent the new desktop control **LAB-D06-SYNC-02 — Recovery control** and confirmed receipt in web mail.

The cause of this controlled discrepancy is the client's selected offline mode. No service-side rule, permission change or client reinstall was required by the recorded recovery. The 60-second observation is owner-reported; screenshot mail times do not measure reconnect latency.

### Existing delegated resources in the desktop client

As Marek, opened Anna's shared calendar and **LAB-D04-CAL-01 — Finance planning**, 16 November, **10:00–10:30**. Capture 07 identifies Anna's shared folder and an **Appointment (Read-Only)** window. The owner confirmed visible title/body and denied editing. The existing body, "Edited by Marek — editor permission verified.", is retained Stage 04 content, not a new Stage 06 edit.

For Helpdesk, the guided procedure created a separate **LAB-D06-Piotr** Outlook profile using the profile picker, accessible through **outlook.exe /profiles**. The profile name itself is not visible in the final capture. The signed-in Piotr mailbox and **BFL-M365-Helpdesk → Inbox** are visible in capture 08.

Marek sent SHARED-01 from web mail to Helpdesk. Piotr read it in classic Outlook and replied as Helpdesk using the existing Full Access/Send As grants. Marek confirmed receipt from Helpdesk and replied again; Piotr read that final reply in Helpdesk. Capture 08 shows the received reply and quoted exchange. Sender receipt and the operation sequence also rely on the explicit owner confirmations; the quoted From text is not treated as a raw transport-header audit.

The owner returned Outlook to Marek's original profile and reconfirmed Word as Marek with an active product. No deletion of the additional Piotr profile was reported. No new delegation grant or fresh excluded-user mailbox test is claimed in this stage; the earlier boundary remains documented in Stage 04.

## Exit checks and final state

- [x] Dedicated lab VM and actual client context recorded.
- [x] **T14 PASS:** intended Marek Office identity and active product established, restored and functionally checked.
- [x] **T15 PASS:** same-mailbox web/desktop difference observed, explained by Work Offline, and repaired with a new control.
- [x] Calendar reader and authorized Helpdesk behavior rechecked in classic Outlook.
- [x] Marek Outlook profile and active Word identity restored by owner confirmation.

At Stage 06 closure: **18 PASS / 14 NOT_RUN** of 32 checks; **9 resolved / 6 planned** lab cases. The identity, offline and delegation phases do not add extra matrix IDs. Stages 07–14 remain PLANNED.

The VM, installed applications, synthetic files/messages and additional Piotr profile remain lab resources. Shared-mailbox/calendar grants retain their previously documented scope; no new tenant-wide permission audit is implied. New Outlook was reported installed but not tested. No new Copilot output exercise, device-management enrollment validation, Exchange PowerShell diagnosis or Stage 11 report was performed. The Stage 05 role-delegation exception remains unresolved.

I can explain the difference between Office's active user and licensing account, an Outlook mailbox/profile and a browser session; use web mail as a control for an offline client; and distinguish calendar read permission, Full Access and Send As.

[Identity case](../../tickets/M365-008-office-identity-recovery.md) · [Offline case](../../tickets/M365-009-outlook-offline-recovery.md) · [Official references](../sources.md#day-06-implementation-references) · [Stage index](README.md) · [Next: Stage 07](07-teams-and-connected-sites.md)
