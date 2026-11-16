# Stage 09 — OneDrive synchronization and file recovery

Status: PLANNED  
Target days: 17–18  
Execution date: not recorded

## Learning objective

Diagnose synchronization and validate recovery by comparing actual file contents.

## Before starting

Confirm the required service entitlement, task-appropriate role, affected synthetic identities and recovery path. Record the actual tenant/client context privately. Earlier stages provide the baseline; unresolved prerequisites remain BLOCKED rather than assumed successful.

## Carry-forward from Stage 08

The independent Knowledge site, reader/editor roles, revoked-link comparison and isolated folder restoration are verified. Original KB-01 and the restored test folder remain; diagnostic helpers were removed per owner. A web document save, a closed editor lock and a restored SharePoint permission are not OneDrive client synchronization, version-content recovery or recycle-bin recovery. Keep this stage PLANNED until those separate checks run. [Stage 08](08-sharepoint-and-sharing.md).

## Planned exercises

1. Set up synchronization of a lab-only test folder and examine Files On-Demand.
2. Compare personal OneDrive files with a team SharePoint library.
3. Pause and resume sync to create a controlled stale-client condition.
4. Restore an earlier version and a deliberately deleted synthetic file; retain a baseline of its contents.

## Training case

The browser shows a newer file version than the local client.

This is a planned lab scenario. No incident, root cause or repair outcome has been observed yet.

## Exit checks

- [ ] Changes appear in browser and client after sync resumes.
- [ ] Restored version content matches the expected baseline.
- [ ] A recovered deleted file opens with the expected contents.
- [ ] The note explains the difference between synchronization, version history and backup.

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
