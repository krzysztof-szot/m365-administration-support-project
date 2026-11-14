# Stage 05 — Mail-flow troubleshooting and recovery

Status: PLANNED  
Target days: 8–9  
Execution date: not recorded

## Learning objective

Diagnose delivery failures using observed evidence and restore the expected mail flow.

## Before starting

Confirm the required service entitlement, task-appropriate role, affected synthetic identities and recovery path. Record the actual tenant/client context privately. Earlier stages provide the baseline; unresolved prerequisites remain BLOCKED rather than assumed successful.

## Planned exercises

1. Collect sender, recipient, timestamp, subject and actual NDR details.
2. Inspect Service health and Message Trace in Exchange administration.
3. Test a nonexistent lab recipient.
4. Introduce one reversible rule limited to a selected synthetic recipient and a [LAB-BLOCK] subject marker; keep an unmarked control message.

## Training case

A marked message is rejected while a normal control message is delivered.

This is a planned lab scenario. No incident, root cause or repair outcome has been observed yet.

## Exit checks

- [ ] Evidence distinguishes an invalid recipient from the controlled rule rejection.
- [ ] The unmarked control message continues to arrive.
- [ ] After disabling the exercise rule and allowing for propagation, the intended delivery succeeds.

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
