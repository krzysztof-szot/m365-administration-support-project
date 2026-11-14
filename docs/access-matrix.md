# Access matrix — observed configuration and future targets

Current state after Stages 01–03. Configured membership is distinguished from effective-resource tests.

## Observed configuration and functional results

| Resource | Anna | Piotr | Marek | Evidence / limit |
| --- | --- | --- | --- | --- |
| Own user mailbox | Verified send/receive | Verified after license repair | Verified as internal sender | Days 01–03; not desktop activation |
| Own OneDrive | Create/save/reopen verified | Not tested | Not tested | Day 01 only |
| SG-M365-MFA-Pilot | Direct member | Direct member | Direct member | Day 02 09; policy results recorded separately |
| BFL-M365-Finance Microsoft 365 group | Owner and member | Member | Not listed | Day 02 12–14; Private; site link exists; direct-site boundaries not tested |
| DL-M365-Finance final state | Owner and member / receives | Member / receives after restoration | Not member / allowed internal sender | Day 02 16–20; Day 03 07–09; non-receipt controls are bounded owner reports |
| m365.finance SMTP address | Routes to Anna's existing mailbox | Internal trial sender | No ownership or mailbox grant | External alias target verified in Day 03 03a/03b |
| Microsoft 365 Admin Center | Explicitly denied | No admin role assigned in the exercise; denial not separately tested | Same | Anna denial is not generalized to every API or all users |

Day 03 temporarily removed Piotr only from the DL. The Microsoft 365 group and MFA memberships were not the fault target. The DL was restored before closure.

## Remaining permission targets

| Planned resource / check | Anna | Piotr | Marek |
| --- | --- | --- | --- |
| Teams attached to existing Finance group | Owner | Member | Excluded control |
| Finance private channel | Owner/member | Excluded until explicit membership test | Excluded control |
| Helpdesk shared mailbox | Delegate according to test | Separate Full Access / sender-permission exercise | Excluded control |
| Knowledge site | Owner | Visitor/read | Member/edit |
| Isolated Finance document | Authorized | Reader where explicitly granted | Excluded control |
| Room calendar | Booking requester | Booking requester | Booking requester |

Create the Finance Team from the existing Private group in Stage 07. The older Public Baltic Finance Lab team/site is separate and must not be used as proof of this new group's permission boundary.

Administrative identities are separate. The CA configuration role was removed; the captured recipient-admin assignment remains active. Use ordinary user sessions for effective access checks and record other grants, propagation and restoration before explaining a denial or retained access.

[Baseline](01-environment-baseline.md) · [Day 02 evidence](../evidence/day-02/README.md) · [Day 03 evidence](../evidence/day-03/README.md)
