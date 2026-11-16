# Access matrix — observed configuration and future targets

Current state after Stages 01–05. Configured membership is distinguished from effective-resource tests.

## Observed configuration and functional results

| Resource | Anna | Piotr | Marek | Evidence / limit |
| --- | --- | --- | --- | --- |
| Own user mailbox | Verified send/receive | Verified after license repair | Verified as internal sender | Days 01–05; not desktop activation |
| Own OneDrive | Create/save/reopen verified | Not tested | Not tested | Day 01 only |
| SG-M365-MFA-Pilot | Direct member | Direct member | Direct member | Day 02 09; policy results recorded separately |
| BFL-M365-Finance Microsoft 365 group | Owner and member | Member | Not listed | Day 02 12–14; Private; site link exists; direct-site boundaries not tested |
| DL-M365-Finance final state | Owner and member / receives | Member / receives after restoration | Not member / allowed internal sender | Day 02 16–20; Day 03 07–09; non-receipt controls are bounded owner reports |
| m365.finance SMTP address | Routes to Anna's existing mailbox | Internal trial sender | No ownership or mailbox grant | External alias target verified in Day 03 03a/03b |
| Helpdesk opening / Full Access | Granted; used for on-behalf exercise | Granted; opening and reading verified | Denied; own Inbox control owner-confirmed | Day 04 03/04/09/10a; do not infer every resource's permissions |
| Helpdesk sending | Send on behalf verified | Send As and reply flow verified | No sender grant made in exercise | Day 04 06–08/10/11; sender grants tested separately from reading |
| Anna Calendar | Owner | No new grant tested | Reader, temporarily editor, then reader restored | Day 04 12–16; save/persistence and fresh-login restoration owner-confirmed |
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

## Remaining permission targets

| Planned resource / check | Anna | Piotr | Marek |
| --- | --- | --- | --- |
| Teams attached to existing Finance group | Owner | Member | Excluded control |
| Finance private channel | Owner/member | Excluded until explicit membership test | Excluded control |
| Knowledge site | Owner | Visitor/read | Member/edit |
| Isolated Finance document | Authorized | Reader where explicitly granted | Excluded control |

Create the Finance Team from the existing Private group in Stage 07. The older Public Baltic Finance Lab team/site is separate and must not be used as proof of this new group's permission boundary.

Administrative identities are separate. The CA configuration role was removed; the recorded recipient-admin assignment remains the retained Exchange lab setup; no removal was reported through Day 05. Stage 05 used bg01 for rule operations and did not establish a repaired least-privilege delegation. Use ordinary user sessions for effective access checks and record other grants, propagation and restoration before explaining a denial or retained access.

[Baseline](01-environment-baseline.md) · [Day 02 evidence](../evidence/day-02/README.md) · [Day 03 evidence](../evidence/day-03/README.md) · [Day 04 evidence](../evidence/day-04/README.md) · [Day 05 evidence](../evidence/day-05/README.md)
