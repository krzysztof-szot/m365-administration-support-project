# Planned access matrix

Status: collaboration access targets remain PLANNED. Stage 01 has verified Anna's mail access and admin-portal denial, and captured her sole membership in SG-M365-MFA-Pilot. The resource matrix below is a target, not a claim that team/site/delegation permissions have been deployed.

| Resource | Anna Finance | Piotr Operations | Marek IT |
| --- | --- | --- | --- |
| Personal mailbox and OneDrive | Own data | Own data | Own data |
| Finance team / standard files | Owner | Member for the relevant exercise | Excluded control |
| Finance private channel | Owner/member | Excluded until the explicit membership test | Excluded control |
| Helpdesk shared mailbox | Delegate according to the test | Separate Full Access / sender-permission exercise | Excluded control |
| Knowledge site | Owner | Visitor/read | Member/edit |
| Isolated Finance document | Authorized | Reader where explicitly granted | Excluded control |
| Room calendar | Booking requester | Booking requester | Booking requester |

Administrative identities are separate. Use a normal user session for access tests; an elevated administrator session is not the denied-user control.

Membership changes during an exercise must include a before/after matrix and propagation observations. Stage 08 may deliberately use an isolated document or group to compare direct grants, membership and links. Restore the intended final state afterwards.

[Stage 01 observed state](stages/01-tenant-and-roles.md) · [Evidence](../evidence/day-01/README.md)
