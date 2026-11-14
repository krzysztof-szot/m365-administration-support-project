# Planned read-only PowerShell reports

Status: design only. No executable administration scripts or automated script tests have been added.

Build these reports in [Stage 11](../docs/stages/11-powershell-reporting.md), after manually learning the workloads.

| Proposed file | Read scope | Verification |
| --- | --- | --- |
| Get-M365LabLicenseReport.ps1 | Selected pilot users and assigned service/license state | Reconcile selected rows with the user/license portal |
| Get-M365LabMailboxPermissionReport.ps1 | Selected shared mailboxes and their access/sender delegations | Compare with Exchange administration and the functional permission exercises |
| Get-M365LabGroupReport.ps1 | Membership of selected Microsoft 365 groups | Compare with the group owner/member view |

## Implementation contract

- Confirm intended tenant, selected objects, role/scopes and supported module versions.
- Use supported interactive authentication; do not commit credentials.
- Keep reads restricted to the selected lab scope.
- Treat missing objects, permission errors and partial results explicitly.
- Write raw CSV to ignored `local-output/`.
- Publish only curated synthetic or redacted samples.
- Independently reconcile output; a script exit code alone is insufficient.
- Separate any later offline checks from live tenant validation.

Write automation is a separate future change. It is not included in the three reporting scripts above.
