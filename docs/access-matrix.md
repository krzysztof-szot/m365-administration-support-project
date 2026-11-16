# Access matrix — observed configuration and future targets

Current state after Stages 01–08. Configured membership is distinguished from effective-resource tests.

## Observed configuration and functional results

| Resource | Anna | Piotr | Marek | Evidence / limit |
| --- | --- | --- | --- | --- |
| Own user mailbox | Verified send/receive | Verified after license repair | Verified as internal sender | Days 01–06; Marek desktop/web mail and Apps activation separately verified in Day 06 |
| Own OneDrive | Create/save/reopen verified | Not tested | Not tested | Day 01 only |
| SG-M365-MFA-Pilot | Direct member | Direct member | Direct member | Day 02 09; policy results recorded separately |
| BFL-M365-Finance Microsoft 365 group | Owner and member | Member | Not listed | Day 02 12–14 configuration; Day 07 adds Teams and verifies the standard/private file boundary; From a group and privacy owner-confirmed |
| DL-M365-Finance final state | Owner and member / receives | Member / receives after restoration | Not member / allowed internal sender | Day 02 16–20; Day 03 07–09; non-receipt controls are bounded owner reports |
| m365.finance SMTP address | Routes to Anna's existing mailbox | Internal trial sender | No ownership or mailbox grant | External alias target verified in Day 03 03a/03b |
| Helpdesk opening / Full Access | Granted; used for on-behalf exercise | Granted; opening and reading verified | Denied; own Inbox control owner-confirmed | Day 04 03/04/09/10a; Day 06 08 and owner confirmations recheck Piotr in classic Outlook; Marek denial not repeated |
| Helpdesk sending | Send on behalf verified | Send As and reply flow verified | No sender grant made in exercise | Day 04 06–08/10/11; Day 06 Helpdesk reply round trip as Piotr; sender receipt also owner-confirmed |
| Anna Calendar | Owner | No new grant tested | Reader, temporarily editor, then reader restored | Day 04 12–16; Day 06 07 Read-Only in classic Outlook plus owner-confirmed denial; earlier save/restoration owner-confirmed |
| Finance Team | Owner | Member | Not listed | Day 07 01; From a group and Private owner-confirmed; no new Marek direct-file denial test |
| Finance-Operations standard file | Creator; sees Piotr saved change | Opens/edits/saves through Teams and SharePoint | Not tested | Day 07 02 plus owner controls; extends T16 |
| Finance-Confidential private file | Sole retained channel Owner; opens file | Initially denied; temporary Member access verified; removed and denied again in fresh session | Not a channel member; direct access not tested | Day 07 03–05 plus final owner confirmations; T17 PASS |
| Knowledge site and KB-01 | Full Control; creator; sees reopened edit | Read; content opens, editing unavailable | Edit; saved change verified by Anna | Day 08 02–04 and owner confirmations; T18/T19 PASS |
| KB-01 sharing link | Created and revoked controlled link | Old URL explicitly removed; library navigation still works | No additional link test | Day 08 05 shows opening only; audience and revocation owner-confirmed; final item inheritance/ACL not separately captured |
| LAB-D08-Restricted / TXT | Owner control retained | Opens before; denied during restriction; opens after restoration | Opens during restriction | Day 08 06/07 plus expected effective-access checks and restoration owner-confirmed; T20 PASS; final folder inherits Knowledge |
| Room bookings | ROOM-01 11:00–11:30 accepted | Not tested | ROOM-02 overlap declined, 12:00–12:30 accepted | 16 November Warsaw time; Day 04 19–24; room account block owner-confirmed |
| Scoped mail-flow exercise | Not functionally tested in this rule | Marked mail rejected; unmarked control delivered; marked delivery recovers after disable | Sender from own mailbox; same message phases correlated in Trace | Day 05 10–14; rule final Disabled; RULE-02 opening owner-confirmed; RULE-03 delivery from Trace |
| Microsoft 365 Admin Center | Explicitly denied | No admin role assigned in the exercise; denial not separately tested | Same | Anna denial is not generalized to every API or all users |

Day 03 temporarily removed Piotr only from the DL. The Microsoft 365 group and MFA memberships were not the fault target. The DL was restored before closure.

## Stage 05 administrative access

| Identity / object | Recorded result | Source / limit |
| --- | --- | --- |
| adm-lab | Message Trace works; Rules initially has no Add a rule control | Explicit owner identity confirmation; Day 05 03/04/09a; no full effective-role audit |
| bg01 | Global Administrator and selected Organization Management Role Management / Transport Rules reported; rule created, enabled and disabled in the guided bg01 session | Owner attribution plus saved rule/results in Day 05 10–14; no independent actor audit export |
| RG-M365-Lab-Transport-Rules | Attempted delegation not verified after a delegating-role-assignment error | Remains unresolved; no successful adm-lab grant or absence of partial state claimed; PowerShell deferred |

The custom group's name would not limit transport-rule administration to the pilots. The actual message scope is supplied by the rule's sender, recipient and subject conditions.

## Stage 08 effective-access boundary

The independent Knowledge site retains Anna Full Control, Marek Edit and Piotr Read. Removing the selected link invalidated its URL but did not remove Piotr's other authorized library access. KB-01's post-sharing inheritance state was not separately captured; copied group grants may remain on a uniquely secured item. The isolated folder inherited Knowledge's three groups before its temporary Visitors-grant removal and ends restored. Check Permissions before/after was reported as expected rather than captured verbatim.

## Stage 06 client identity boundary

Marek is the restored Word and classic Outlook baseline. The controlled Word capture has Piotr in User Information but a subscription still naming Marek; Office user identity, licensing identity and the Outlook mailbox profile are separate observations. Piotr's Helpdesk test used his own Outlook profile and existing grants. Final return to Marek and active Word are owner-confirmed; no additional tenant-wide grants, MDM enrollment audit or profile deletion are claimed.

## Later permission targets

| Planned resource / check | Anna | Piotr | Marek |
| --- | --- | --- | --- |
| Isolated Finance document | Authorized | Reader where explicitly granted | Excluded control |

Stage 07 attached Teams to the existing Private Finance group in the owner-confirmed workflow. Finance-Operations uses the parent site; Finance-Confidential has its own site, with membership managed in Teams. Piotr's temporary private membership was removed and the final fresh-session denial is owner-confirmed. The older Public Baltic Finance Lab team/site is a separate resource.

Administrative identities are separate. The CA configuration role was removed; the recorded recipient-admin assignment remains the retained Exchange lab setup; no removal was reported through Day 05. Stage 05 used bg01 for rule operations and did not establish a repaired least-privilege delegation. Use ordinary user sessions for effective access checks and record other grants, propagation and restoration before explaining a denial or retained access.

[Baseline](01-environment-baseline.md) · [Day 02 evidence](../evidence/day-02/README.md) · [Day 03 evidence](../evidence/day-03/README.md) · [Day 04 evidence](../evidence/day-04/README.md) · [Day 05 evidence](../evidence/day-05/README.md) · [Day 06 evidence](../evidence/day-06/README.md) · [Day 07 evidence](../evidence/day-07/README.md) · [Day 08 evidence](../evidence/day-08/README.md)
