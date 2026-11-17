# Stage 12 — Employee onboarding, access change and offboarding

Status: PLANNED  
Target days: 24–25  
Execution date: not recorded

## Learning objective

Execute an end-to-end employee lifecycle using a verified runbook.

## Before starting

Confirm the required service entitlement, task-appropriate role, affected synthetic identities and recovery path. Record the actual tenant/client context privately. Earlier stages provide the baseline; unresolved prerequisites remain BLOCKED rather than assumed successful.

## Carry-forward from Stage 11

Eleven stages are complete; the global matrix has 28 PASS / 4 NOT_RUN, with 25 offline report cases counted separately. The three reports provide selected current product, Finance and Helpdesk baselines. The operator was restored to adm-lab. Broad Graph scopes and the unconfirmed exact cause of the Exchange visibility/401 findings remain limitations; the Stage 05 RBAC exception remains unresolved.

No lifecycle changes have been made. Piotr is still a provisioned pilot, Helpdesk delegation remains as recorded, and knowledge-site reader access remains. Before any lifecycle mutation, write the concrete source/target access and data-custody plan, verify the intended operator and current workloads, and preserve a recovery path. A report read is not an offboarding or handover result.

## Planned exercises

1. Onboard Piotr with a license, mail, intended collaboration access and a user test.
2. Move the synthetic employee to a different department and verify both removed and added access.
3. Plan data custody before removing service entitlements.
4. Block new sign-in, take appropriate session actions and remove intended memberships.
5. If preserving mail as a shared mailbox, verify conversion before any license removal; keep its blocked anchoring account and check applicable license limits.
6. Document OneDrive handover and actual preservation limits.

## Training case

An employee leaves while a manager needs continued access to approved business data.

This is a planned lab scenario. No incident, root cause or repair outcome has been observed yet.

## Exit checks

- [ ] The onboarding checklist produces usable services.
- [ ] Access after the department change matches the target matrix.
- [ ] A new leaver sign-in is denied; existing-session behavior is reported separately.
- [ ] An approved custodian opens the designated retained mailbox and files.

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
