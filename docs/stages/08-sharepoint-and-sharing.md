# Stage 08 — SharePoint structure, permissions and sharing

Status: PLANNED  
Target days: 14–16  
Execution date: not recorded

## Learning objective

Build a usable knowledge site and reason about all relevant access paths.

## Before starting

Confirm the required service entitlement, task-appropriate role, affected synthetic identities and recovery path. Record the actual tenant/client context privately. Earlier stages provide the baseline; unresolved prerequisites remain BLOCKED rather than assumed successful.

## Carry-forward from Stage 07

The Finance Team and its standard/private SharePoint sites are now verified. Anna remains the only Finance-Confidential member after Piotr's temporary grant/removal; Piotr retains the parent-team and standard-file access. Those channel sites are separate from the planned independent BFL-M365-Knowledge site and do not complete its reader/editor, inheritance or sharing-link tests. Continue managing private-channel membership through Teams. [Stage 07](07-teams-and-connected-sites.md).

## Planned exercises

1. Create the independent BFL-M365-Knowledge site, a document library and simple metadata.
2. Assign Owners, Members and Visitors according to the access matrix.
3. Test Specific people links and revoke one controlled sharing link.
4. On one isolated synthetic resource, inspect permission inheritance and record how to restore it.
5. Manage Teams private-channel membership through Teams rather than by independently changing its SharePoint permissions.

## Training case

A user still opens a document after one sharing link has been removed.

This is a planned lab scenario. No incident, root cause or repair outcome has been observed yet.

## Exit checks

- [ ] A reader can read but cannot edit.
- [ ] A member can make and save the intended change.
- [ ] An excluded identity is denied with other access paths checked.
- [ ] A revoked link is evaluated together with direct grants and group membership.

## Execution record

- Starting state and expected result: not recorded.
- Actions and reasoning: not recorded.
- Observations and propagation delays: not recorded.
- Functional/negative/recovery results: NOT_RUN.
- Evidence: none.
- Remaining resources, restoration and limitations: not recorded.
- What I can explain without a click-by-click guide: not recorded.

Use the [lab-note template](../LAB-NOTE-TEMPLATE.md), [test matrix](../../tests/test-matrix.csv) and [ticket workflow](../../tickets/README.md). Mark completion only after evidence supports the relevant exit checks.

[Back to stage index](README.md)
