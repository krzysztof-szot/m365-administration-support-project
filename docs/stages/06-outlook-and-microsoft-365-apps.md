# Stage 06 — Outlook and Microsoft 365 Apps

Status: PLANNED  
Target days: 10–11  
Execution date: not recorded

## Learning objective

Separate account, license, service and desktop-client problems.

## Before starting

Confirm the required service entitlement, task-appropriate role, affected synthetic identities and recovery path. Record the actual tenant/client context privately. Earlier stages provide the baseline; unresolved prerequisites remain BLOCKED rather than assumed successful.

## Readiness intake — 16 November 2026

The owner reports **Word installed**, **Outlook not installed**, and access to **Windows on VMware Workstation Pro**. These are intake statements, not completed client checks. It has not yet been established which applications are inside the VM, whether the VM is isolated for the lab, its Windows edition/build, Office product/version or activation identity.

Stage 06 remains **PLANNED**; T14 and T15 are **NOT_RUN**. Verify the VM/client state before installation or account changes.

## Planned exercises

1. Use a dedicated lab Windows profile or VM and record client versions.
2. Configure the correct pilot account in Outlook and verify desktop Apps activation.
3. Compare browser and desktop behavior for the same mailbox and identity.
4. Investigate a wrong Office identity and validate access to delegated mail/calendar resources.

## Training case

The user reports that web access works but the desktop experience is different.

This is a planned lab scenario. No incident, root cause or repair outcome has been observed yet.

## Exit checks

- [ ] The correct licensed identity is active in the intended client.
- [ ] Observed browser/client differences support the diagnosis.
- [ ] The affected action and a regression check succeed after correction.

## Execution record

- Starting state: owner-reported Word/Outlook/VM intake above; VM/client configuration and expected functional results not yet verified.
- Actions and reasoning: not recorded.
- Observations and propagation delays: not recorded.
- Functional/negative/recovery results: NOT_RUN.
- Evidence: none.
- Remaining resources, restoration and limitations: not recorded.
- What I can explain without a click-by-click guide: not recorded.

Use the [lab-note template](../LAB-NOTE-TEMPLATE.md), [test matrix](../../tests/test-matrix.csv) and [ticket workflow](../../tickets/README.md). Mark completion only after evidence supports the relevant exit checks.

[Back to stage index](README.md)
