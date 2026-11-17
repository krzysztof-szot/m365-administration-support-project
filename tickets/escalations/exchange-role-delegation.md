# Exchange role delegation requires second-line review

Status: **PACKAGE PREPARED — UNDERLYING EXCEPTION UNRESOLVED**  
Prepared: **17 November 2026**; original observation: **16 November 2026**  
Destination: proposed Exchange Online permissions specialist  
Submission: **not sent; no external support-case number**

## Request and impact

Determine why the attempt to assign Transport Rules through RG-M365-Lab-Transport-Rules failed in the reported bg01 session, and whether the initial operation left a partial object. The intended member was adm-lab. Scope is a synthetic lab role group and administrative task, not a reported mail-delivery outage.

The practical exercise used bg01 for rule operations and completed; its scoped transport rule remains Disabled. A working alternate session does not establish successful delegation to adm-lab. Business urgency and an SLA were not supplied; this is a routine administrative diagnosis candidate rather than a fabricated critical incident.

## Historical reproduction already observed

1. As adm-lab, Message Trace worked per owner, but the Rules page lacked Add a rule; the published initial view is Day 05 09a.
2. The owner attempted creation of RG-M365-Lab-Transport-Rules, reported a success banner, then did not see it listed after approximately five minutes.
3. A subsequent creation attempt, explicitly attributed to bg01, returned an error about creating/changing/removing the Transport Rules management-role assignment and requiring a delegating assignment without a scope restriction.
4. The owner reported bg01 had Global Administrator and that Role Management and Transport Rules were selected in Organization Management. These are portal/session reports, not an effective-assignment export.
5. bg01 subsequently had Add a rule, opened the wizard and completed the rule exercise. Exact token/role-propagation times were not measured.

Sanitized diagnostic sentence retained from the observed error:

> You must be assigned a delegating role assignment to the management role or its parent in the hierarchy without a scope restriction.

The tenant-qualified assignment string and private identifiers are omitted. The private error screenshot was not added to the public evidence set.

## Supported findings and unknowns

| Supported | Not established |
| --- | --- |
| Delegation operation returned the stated authorization error | Exact effective delegating assignment, scope and role path of the active session |
| Owner reports Global Administrator on bg01 | Independent activation/token timing and complete current RBAC state |
| Two role entries were reportedly selected in Organization Management | Whether every expected regular/delegating assignment was present and enabled |
| Rule operations later worked as bg01 | Successful intended grant to adm-lab |
| Initial banner/list mismatch was reported | Absence or presence of a partial custom group/assignment |

Microsoft documents the Global Administrator to Organization Management mapping through an internally managed group. That expected mapping makes the reported error worth investigating; it is not proof of the actual assignment and scope used by that session. The cause remains **unresolved**, not “fixed by waiting” or “Global Administrator cannot delegate.”

## Requested second-line investigation

1. Confirm the tenant and acting account privately, current administrative-role state and a fresh authenticated session context.
2. Read whether the named custom group exists, its members and role assignments before proposing another creation attempt.
3. Inspect enabled effective regular and delegating assignments for the relevant Role Management/Transport Rules path, including configuration/recipient scope restrictions. Compare actual grants with the documented role mapping.
4. Distinguish a session/propagation issue, incomplete custom-group operation and a genuine assignment/scope inconsistency using collected output. These are hypotheses, not established causes.
5. Return the supported cause or remaining limitation and the narrow proposed correction, with a verification and rollback plan. Any later diagnostic execution requires the appropriate task permissions.

Get-RoleGroup, Get-RoleGroupMember and Get-ManagementRoleAssignment are candidate read operations for an authorised second-line operator. **They were not executed in this stage.** The owner's deferred PowerShell investigation remains deferred; no broader role grant or live RBAC mutation was made for this package.

## Verification required after a future correction

Verify the intended group/member/role and effective scope, then use the intended ordinary administrative session to check the required Rules capability. If an enforcement test is approved, scope it to synthetic sender/recipient/subject controls, verify actual outcomes and restore the rule to its recorded final state. A saved group or newly visible button alone does not prove full enforcement.

## Evidence and retained state

- [Stage 05 exception record](../../docs/stages/05-mail-flow-troubleshooting.md#administrative-exception-retained-for-follow-up) contains the attributed error and limitations.
- [Day 05 evidence](../../evidence/day-05/README.md) retains 09a plus saved rule, functional Trace results and Disabled final state.
- [Case review](../stage-10-case-review.md) records impact/urgency reasoning and the distinction between workaround and resolution.
- Current Service health in [Day 10](../../tests/day-10.md) supplies no proven cause for this RBAC operation.

The scoped rule is retained Disabled; possible partial custom-group state is unaudited. No repair, fresh recurrence test, external contact or resolution deadline is claimed.

## Official references

- [Permissions and role mapping in Exchange Online](https://learn.microsoft.com/en-us/exchange/permissions-exo/permissions-exo)
- [Manage role groups in Exchange Online](https://learn.microsoft.com/en-us/exchange/permissions-exo/role-groups)
- [Get ManagementRoleAssignment and delegating filter](https://learn.microsoft.com/en-us/powershell/module/exchangepowershell/get-managementroleassignment?view=exchange-ps)
