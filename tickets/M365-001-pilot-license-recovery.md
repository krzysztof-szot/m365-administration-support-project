# M365-001 — New pilot can sign in but cannot open Outlook

Status: **RESOLVED**  
Type: **Service request with a controlled diagnostic condition**  
Execution date: **14 November 2026**  
Stage: **02**

## Request and scope

Prepare the synthetic Piotr Operations identity for Exchange use. Impact is limited to one laboratory user; no production SLA or real customer incident is claimed. Operator context: adm-lab for guided account/licensing work; individual portal actions do not all have independent audit captures. Client: Chrome on Windows 11.

## Symptoms and diagnosis

| Question | Check | Observation / decision |
| --- | --- | --- |
| Can the identity authenticate? | My Account as Piotr | Success (03); investigate workload entitlement |
| Is the service entitled? | Licenses and apps | Poland; zero licenses/apps (02) |
| What does Outlook report? | Open mail as Piotr | HTTP 500 with OwaUserHasNoMailboxAndNoLicenseAssignedException (04), 10:50:51.023Z |
| Does the correction persist? | Assign Premium; check Exchange Online Plan 1 | Saved assignment and enabled service (05/05a) |
| Does the workload work? | Open Outlook and exchange marked mail with Anna | Mailbox opens; send and reply succeed (06–08) |

## Identified cause and resolution

The newly created user lacks a product entitlement for Exchange. Assigned ordinary Business Premium with Exchange Online Plan 1 enabled and allowed the mailbox to provision. The service becomes usable afterwards. Provisioning elapsed time was not supplied and is not inferred from mail timestamps.

The initial training condition is a new, empty unlicensed account. Rollback of the assignment was possible at that point, but the intended final state is a licensed user; no destructive license-removal test on the working mailbox was performed.

## Verification and closure

**T04 PASS:** Outlook opens, Piotr sends the marked message at displayed 12:09 and receives Anna's reply at 12:12. T03's Anna baseline is not counted again. No Pester, CI or transport trace result is claimed.

Suggested closure note: "Your Exchange entitlement is assigned and the mailbox is available. We verified sending and receiving with a marked test conversation."

Piotr remains licensed. MFA enrollment/scope and group setup are recorded separately in the stage results.

[Stage](../docs/stages/02-users-licenses-and-groups.md) · [Results](../tests/day-02.md) · [Evidence 01–08](../evidence/day-02/README.md)
