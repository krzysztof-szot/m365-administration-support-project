# Planned lab architecture

Status: design only. Three pilot identities, roles and objects remain to be verified or created.

```mermaid
flowchart TB
    Admin[Separate administrative identities] --> Portal[Microsoft 365 admin centers]
    Entra[Entra ID users and groups] --> Users[Three synthetic pilot users]
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

[Access matrix](access-matrix.md) · [Roadmap](roadmap.md)
