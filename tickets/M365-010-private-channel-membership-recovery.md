# M365-010 — Team member cannot open a private-channel file

Status: **RESOLVED**\
Type: **Controlled private-channel authorization and restoration exercise**\
Execution date: **16 November 2026**\
Stage: **07**

## Request, impact and scope

Piotr is a member of the Private BFL-M365-Finance Team but is initially excluded from Finance-Confidential. Demonstrate the resulting private-file denial, temporarily authorize Piotr through channel membership, verify access and restore the Anna-only channel baseline.

This is an intentional lab boundary exercise using synthetic documents. The initial denial is expected under the starting membership. No production impact or Microsoft service outage is claimed.

## Diagnosis and verification

| Phase | Observation | Source / decision |
| --- | --- | --- |
| Parent team | Anna Owner, Piotr Member; team created from existing group per owner | 01 plus owner confirmation; missing parent-team membership is not the cause |
| Working control | Piotr opens/edits STANDARD-01 through Teams and SharePoint; Anna sees saved change | 02 plus owner confirmations; client and standard resource work |
| Private membership | Anna sole Owner; zero other members | 03; Piotr has no channel membership |
| Authorized link control | Anna reopens PRIVATE-01 and the copied link works | Owner report; copied link is not merely assumed valid |
| Excluded user | Piotr does not see private channel; direct file link says You need access | 04 plus owner identity and control; expected boundary established |
| Temporary correction | Anna adds Piotr as a channel Member in Teams | Guided operation; owner confirms channel visibility and same-link/Teams access |
| Functional result | PRIVATE-01 open in Piotr's browser context | 05, supports temporary authorized access |
| Restoration | Piotr removed from private channel only; fresh-session private denial, standard file still works; final Anna-only channel | Explicit owner confirmation; no additional restoration capture |

The supported cause is **absence from the private channel's membership**, even though parent-team membership is valid. The case does not establish a broken SharePoint service or require a direct file grant. The guided copied-link option was People with existing access; its settings were not independently captured. Actual membership-propagation time was not measured.

## Resolution and final state

Manage authorization through **Teams → Finance-Confidential → Manage channel → Members**. The approved lab grant made the private file available. Removal then restored the original boundary without removing Piotr from the Finance Team.

The case closes as a verified temporary authorization and restoration exercise. It does **not** claim that Piotr retains private-channel access at closure. Anna remains the sole channel owner/member; Piotr keeps standard-channel access. **T17 PASS**; T16 retains its earlier PASS and is extended with this standard-file control.

No tenant-wide permission redesign, direct SharePoint membership override or fresh Marek file-denial test is claimed. Existing sessions were not treated as fresh denial proof; the owner explicitly used a fresh Piotr session after removal.

## Communication and closure

Suggested closure note: "Membership in the Finance Team does not automatically grant Finance-Confidential access. Adding Piotr to that private channel enabled the file; removing the temporary membership restored Anna-only access while the standard channel continued to work."

This is sample wording, not an externally sent message.

[Stage](../docs/stages/07-teams-and-connected-sites.md) · [Results](../tests/day-07.md) · [Evidence](../evidence/day-07/README.md) · [Current access matrix](../docs/access-matrix.md)
