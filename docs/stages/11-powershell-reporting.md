# Stage 11 — Read-only operational PowerShell reports

Status: PLANNED  
Target days: 21–23  
Execution date: not recorded

## Learning objective

Report selected license, delegation and membership state and reconcile it with independent reads.

## Before starting

Confirm the required service entitlement, task-appropriate role, affected synthetic identities and recovery path. Record the actual tenant/client context privately. Earlier stages provide the baseline; unresolved prerequisites remain BLOCKED rather than assumed successful.

## Planned exercises

1. Implement the three scoped reports listed in scripts/README.md only after manual exercises.
2. Record module versions, authentication context and required permissions.
3. Handle a missing object, insufficient permissions and partial reads without reporting false success.
4. Export raw CSV locally and publish only curated synthetic or redacted samples.

## Training case

A report cannot read all requested objects with the current role.

This is a planned lab scenario. No incident, root cause or repair outcome has been observed yet.

## Exit checks

- [ ] Selected rows match independent portal/workload reads.
- [ ] Permission and missing-object failures produce useful diagnostics.
- [ ] Partial output is explicitly identified as incomplete.
- [ ] Report execution does not change workload configuration.

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
