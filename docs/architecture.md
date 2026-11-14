# Planned lab architecture

Status: **Stage 01 COMPLETE; the full diagram remains a target design.** Anna's browser workloads and the one-member MFA pilot are verified. The existing Baltic Finance Lab team/site was used for baseline access; it is distinct from the planned Finance team below. Piotr, Marek, the private channel, Helpdesk mailbox and independent knowledge site remain planned. The diagram does not establish deployment of every node.

```mermaid
flowchart TB
    Admin[Separate administrative identities] --> Portal[Microsoft 365 admin centers]
    Entra[Entra ID users and groups] --> Users[Anna created; Piotr and Marek planned]
    Users --> Exchange[Exchange Online]
    Exchange --> Mail[User and Helpdesk mailboxes]
    Exchange --> Room[Room mailbox and booking]
    Users --> Team[Finance team]
    Group[Microsoft 365 group membership] --- Team
    Team --> Parent[Parent SharePoint site]
    Parent --> Standard[Standard channel folders]
    Team --> Private[Private channel and separate site]
    Users --> Knowledge[Independent knowledge site]
    Users --> OneDrive[Personal work files in OneDrive]
    Client[Windows lab profile or VM] --> Users
    Reports[Planned read-only reports] -.-> Portal
```

This is a conceptual relationship diagram, not a network/protocol trace. The private-channel site has its own channel membership boundary; membership in the parent team alone does not establish access. See [Microsoft's Teams and SharePoint description](https://learn.microsoft.com/en-us/sharepoint/teams-connected-sites).

The core uses the default onmicrosoft.com domain. An owned custom domain is optional. There is no required Azure VM, on-premises Exchange server or hybrid identity integration in this project.

## Observed Day 01 path

Anna (Chrome on Windows 11) used Exchange Online, OneDrive/Word web and Teams. The existing team's General files led to SharePoint > Documents > General, where Anna created and reopened the synthetic test document. Its Public group / 28 members state is recorded as background, not a hardened membership design.

The pilot MFA policy moved from Report-only to On. Its successful Exchange evaluation used an existing MFA claim. The configuration CA role was removed afterwards; continued admin access and both recovery paths were checked.

[Access matrix](access-matrix.md) · [Roadmap](roadmap.md)

[Stage 01 implementation](stages/01-tenant-and-roles.md) · [Published evidence](../evidence/day-01/README.md) · [One-seat Copilot extension](copilot-pilot-plan.md)
