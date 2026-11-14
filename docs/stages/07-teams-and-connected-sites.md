# Stage 07 — Teams and connected SharePoint sites

Status: PLANNED  
Target days: 12–13  
Execution date: not recorded

## Learning objective

Understand team/channel membership and the location of collaboration data.

## Before starting

Confirm the required service entitlement, task-appropriate role, affected synthetic identities and recovery path. Record the actual tenant/client context privately. Earlier stages provide the baseline; unresolved prerequisites remain BLOCKED rather than assumed successful.

## Planned exercises

1. Add Teams to the existing BFL-M365-Finance Microsoft 365 group from Day 02, retaining Anna as owner and Anna/Piotr as members.
2. Create standard and private channels with different membership.
3. Open the same file through Teams and its SharePoint location.
4. Test a lab meeting, audio-device selection and screen sharing; record any single-device test limitations.

## Training case

A team member cannot see or open private-channel resources.

This is a planned lab scenario. No incident, root cause or repair outcome has been observed yet.

## Exit checks

- [ ] A team member can open the standard-channel file.
- [ ] An authorized private-channel member can open its file.
- [ ] A team member excluded from the private channel is denied at the direct file URL.
- [ ] The parent site and separate private-channel site are identified correctly.

## Carry-forward from Day 01

T16 was exercised early: Anna opened General files of the existing Baltic Finance Lab team through Teams, created a document in the parent site's Documents > General folder and reopened it successfully. See [20/20a and the result record](../../tests/day-01.md). This passes the baseline standard-channel folder-access check. It does not provision BFL-M365-Finance or establish its planned membership/private-channel boundary; repeat the relevant access check when those new resources are built.

## Carry-forward from Day 02

The Private BFL-M365-Finance group and its site link already exist. Owner: Anna; members: Anna and Piotr; Marek is not listed. Teams has not been added. Use that existing group when creating the Team; do not create a duplicate group. The existing Baltic Finance Lab team used for T16 is a different resource. See [Day 02 configuration](../../evidence/day-02/README.md).

## Execution record

- Starting state and expected result: Day 01 file baseline and Day 02 Private group carry-forward above; planned Stage 07 Teams deployment has not started.
- Actions and reasoning: not recorded.
- Observations and propagation delays: not recorded.
- Functional/negative/recovery results: T16 PASS on the existing team from Day 01; T17 NOT_RUN; new Finance-resource checks remain planned.
- Evidence: [Day 01 captures 19/20/20a](../../evidence/day-01/README.md); no new Stage 07 captures.
- Remaining resources, restoration and limitations: not recorded.
- What I can explain without a click-by-click guide: not recorded.

Use the [lab-note template](../LAB-NOTE-TEMPLATE.md), [test matrix](../../tests/test-matrix.csv) and [ticket workflow](../../tickets/README.md). Mark completion only after evidence supports the relevant exit checks.

[Back to stage index](README.md)
