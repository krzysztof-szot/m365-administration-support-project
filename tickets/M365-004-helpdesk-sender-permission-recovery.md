# M365-004 — Helpdesk opens but sending is denied

Status: **RESOLVED**  
Type: **Incident exercise — deliberately incomplete sender permission**  
Execution date: **14 November 2026**  
Stage: **04**

## Impact and scope

Piotr can read BFL-M365-Helpdesk but cannot send from it. The lab intentionally starts with Full Access and an empty Send As list. The target is this synthetic shared mailbox and delegate only; direct shared-account sign-in remains blocked.

## Diagnosis

| Question | Check | Observation and decision |
| --- | --- | --- |
| Does the resource exist? | SharedMailbox type and associated account | Created; direct sign-in blocked (01/02) |
| Can the delegate read it? | Piotr opens Helpdesk and ACCESS-01 | Opening and reading work (03/04) |
| Is a sender grant present? | Inspect Send As delegates | Empty list (04a); Full Access alone does not supply this permission |
| Does sending work? | Controlled SEND-01 attempt | Permission error in Helpdesk context (05) |
| Does the targeted grant resolve the behavior? | Add Piotr under Send As; new SEND-02 | Grant captured (06); Anna receives mail from Helpdesk (07) |
| Is reply flow intact? | Anna replies; read Helpdesk | Reply arrives in shared mailbox (08) |

The captured error is "You don't have permission to send messages from this mailbox." From is not displayed in 05, so the capture alone is not an independent proof of the selected sender. Its mailbox context, the separately captured permission state and the successful received message support the guided test result.

## Resolution and verification

Added Piotr's separate Send As permission and verified new mail plus the reply. **T07/T08 PASS.** Full Access remains the permission used for reading; Send As supplies sender authorization.

Earlier opening and post-assignment sending attempts also temporarily failed before succeeding. Their transient cause and propagation duration were not established. No PowerShell permission audit was run.

## Access boundary and final state

Marek's opening attempt is denied (09); the owner confirms his own Inbox works. Anna separately receives Full Access plus Send on behalf (10/10a); Marek sees Anna on behalf of Helpdesk (11). This comparison extends T08 without adding a second matrix row.

Helpdesk direct sign-in remains blocked. Piotr retains Full Access/Send As and Anna retains Full Access/Send on behalf. No administrator role was granted to the pilot users.

Suggested closure note: "We added the separate sender permission for Helpdesk. A new message reached the recipient with Helpdesk as sender, and the reply reached the shared mailbox."

[Stage](../docs/stages/04-delegation-calendars-and-rooms.md) · [Results](../tests/day-04.md) · [Evidence 01–11](../evidence/day-04/README.md#shared-mailbox-and-delegation)
