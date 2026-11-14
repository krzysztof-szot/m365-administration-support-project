# Stage 02 — Users, licenses and group types

Status: PLANNED  
Target days: 2–3  
Execution date: not recorded

## Learning objective

Prepare pilot identities and choose an appropriate group type for each business requirement.

## Before starting

Confirm the required service entitlement, task-appropriate role, affected synthetic identities and recovery path. Record the actual tenant/client context privately. Earlier stages provide the baseline; unresolved prerequisites remain BLOCKED rather than assumed successful.

## Planned exercises

1. Reuse Anna Finance from completed Day 01 and create Piotr Operations and Marek IT as distinct synthetic users.
2. Set usage locations and assign only the service entitlements required by the exercise.
3. Compare security groups, Microsoft 365 groups and distribution lists.
4. On an empty test account, investigate a deliberately missing service entitlement and restore it.

## Training case

A newly created employee can sign in but cannot use an expected workload.

This is a planned lab scenario. No incident, root cause or repair outcome has been observed yet.

## Exit checks

- [ ] The selected workload becomes usable after the entitlement is corrected.
- [ ] Membership and ownership match the documented access matrix.
- [ ] Provisioning delay is recorded separately from a configuration failure.

## Carry-forward from Day 01

Anna's pilot license and Poland usage location are already recorded. T03 passes for licensed Exchange access through an external mail round trip; no need to recreate Anna or repeat that result as new Stage 02 execution. The missing-entitlement recovery and group-type exercises remain NOT_RUN.

## Execution record

- Starting state and expected result: Day 01 carry-forward above; Stage 02 execution not yet started.
- Actions and reasoning: not recorded.
- Observations and propagation delays: not recorded.
- Functional/negative/recovery results: T03 PASS from Day 01; T04 NOT_RUN.
- Evidence: [Day 01 results](../../tests/day-01.md); no new Stage 02 captures.
- Remaining resources, restoration and limitations: not recorded.
- What I can explain without a click-by-click guide: not recorded.

Use the [lab-note template](../LAB-NOTE-TEMPLATE.md), [test matrix](../../tests/test-matrix.csv) and [ticket workflow](../../tickets/README.md). Mark completion only after evidence supports the relevant exit checks.

[Back to stage index](README.md)
