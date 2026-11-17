# Read-only operational PowerShell reports

Status: **implemented and validated for the recorded selected scope**.

[Stage 11](../docs/stages/11-powershell-reporting.md) records real baseline exports, selected portal comparisons, mixed-target partial output and an account visibility/recovery control. T24/T25 are PASS within those boundaries; no live HTTP 403 or complete effective-role audit is claimed. [Actual results](../tests/day-11.md) · [Redacted samples](../samples/reports/README.md). A syntax check or simulated failure is separate from live evidence.

| Entry script | Declared coverage | Independent check |
| --- | --- | --- |
| [Get-M365LabLicenseReport.ps1](Get-M365LabLicenseReport.ps1) | Selected users, all returned SKUs and service plans | User's Licenses and apps view |
| [Get-M365LabGroupReport.ps1](Get-M365LabGroupReport.ps1) | Selected Microsoft 365 groups, human owners and direct human members | Group properties, Owners and Members |
| [Get-M365LabMailboxPermissionReport.ps1](Get-M365LabMailboxPermissionReport.ps1) | Selected shared mailboxes: Full Access, Send As, Send on behalf | Named delegates in mailbox delegation; retained system ACL entries are separate |

## Runtime and authentication

- PowerShell **7.6 or newer**. The current owner workstation is PowerShell 7.7.0, 64-bit; Windows PowerShell 5.1 was used for an earlier manual license probe, not these export scripts.
- Default Graph modules: Authentication/Users/Groups **2.40.0**, matching the laptop. `-GraphModuleVersion` selects another explicitly installed matching version. Install only the required submodules.
- Default ExchangeOnlineManagement: **3.11.1**. `-ExchangeModuleVersion` selects an explicitly installed compatible version.
- Authenticate interactively **before** the reports. Reports neither install modules nor connect, consent, assign roles or store credentials. Keep Graph and Exchange connections in separate PowerShell windows if using the guided workflow.
- Reports reuse an already loaded matching SDK version. Missing SDK modules are imported globally; reports do not force-reload authentication dependencies between invocations. Load the matching modules before interactive authentication when preparing a fresh session.
- Supply `ExpectedTenantId` from the approved lab tenant's Entra overview and the full expected signed-in `ExpectedAccount`. The reports compare both with the actual connection and stop before target reads on a mismatch. Do not use an unknown current connection as the source of an allegedly independent expected value.

Required Graph delegated scopes:

| Report | Read scopes |
| --- | --- |
| Licenses | `LicenseAssignment.Read.All` |
| Groups | `GroupMember.Read.All`, `User.ReadBasic.All` |

The license endpoint also requires suitable user authorization, such as a documented Directory Readers, License Administrator or User Administrator role. A scope alone is not proof of every effective user permission. Exchange commands are controlled by actual Exchange RBAC; the report does not audit all role assignments.

The observed lab Graph context also contains **ReadWrite scopes**. Reports record the actual list and emit a warning when write scopes are present. Their API operations remain reads; this is **not** a least-privilege token/session demonstration. Historical consent/grant cleanup and a new app registration are outside these scripts.

## Invocation

Run each `.ps1` using the call operator in its already authenticated PowerShell process. For example:

```powershell
$expectedTenantId = [guid](Read-Host 'Approved lab tenant ID from Entra overview')
$expectedAccount = Read-Host 'Full expected signed-in lab UPN'

& .\scripts\Get-M365LabLicenseReport.ps1 `
    -UserId (Read-Host 'Selected pilot UPN') `
    -ExpectedTenantId $expectedTenantId -ExpectedAccount $expectedAccount

& .\scripts\Get-M365LabGroupReport.ps1 `
    -GroupName 'BFL-M365-Finance' `
    -ExpectedTenantId $expectedTenantId -ExpectedAccount $expectedAccount

# In the Exchange-connected PowerShell window, with the same approved context:
& .\scripts\Get-M365LabMailboxPermissionReport.ps1 `
    -MailboxIdentity 'bfl-m365-helpdesk' `
    -ExpectedTenantId $expectedTenantId -ExpectedAccount $expectedAccount
```

There are no tenant-wide default targets. Group names use an escaped equality filter and must resolve uniquely to a Microsoft 365 group. Wildcard mailbox/user identities are rejected. Lists accept at most 50 explicitly selected targets.

## Outputs and outcomes

Each invocation creates a new folder beneath ignored `local-output/<report>/<UTC-and-run-id>/` with:

- `rows.csv`: original returned identifiers and values, plus explicit `EMPTY`, `LIMITED` or `ERROR` rows;
- `components.csv`: complete, partial, failed or not-run status for each target/component;
- `metadata.json`: actual account, tenant, scopes/connection, loaded module versions, runtime, coverage, timestamps and hashes of source files and CSV output.

CSV uses UTF-8 with BOM. Keep raw CSV, metadata and any private configuration local. No credentials or access/refresh tokens are exported. Source identifiers and error messages can still contain private data; publish only separately reviewed synthetic/redacted samples.

| Outcome / exit code | Meaning |
| --- | --- |
| `COMPLETE` / `0` | All required components read successfully within the declared coverage |
| `PARTIAL` / `2` | Some usable components succeeded; another component or identity detail is incomplete |
| `FAILED` / `1` | Preflight or all usable reads failed; the export must not be treated as an empty successful report |

Inspect `$LASTEXITCODE` after invocation. An export-write failure returns an error and exit code 1, without a success summary. Parameter binding/runtime/module-loading errors can occur before a run is created.

An API response with an empty collection is recorded as `EMPTY`; a 403/404 or missing property is an error, not an empty collection. A 404 is labelled **not found or not visible**, rather than proof of tenant-wide absence. Failed pagination does not export its incomplete collection as a complete target read. Other successfully read targets/components remain available.

A plan's provisioning value, including `Disabled` or `PendingProvisioning`, is distinct from whether its row was read successfully. No report changes a license or tests a desktop/mail client.

Group output deliberately covers **human owners/direct human members**. It does not expand nested membership, enumerate service principals or establish effective SharePoint access. Graph v1.0 relationship service-principal limitations also apply. The group-properties row is separate from person rows.

Mailbox output retains returned SELF, duplicate-looking, inherited and deny FullAccess entries, including the **full source access-right list** and source index. It does not deduplicate ACLs or infer the reason for similar-looking entries. It resolves referenced delegates where possible; unresolved identities remain visible with partial status and diagnostics. It does not expand delegate-group membership, prove effective access, infer automapping or re-run sending tests.

## Offline checks

```powershell
& .\tests\Test-M365LabReportsOffline.ps1
```

The harness starts a fresh child PowerShell process and substitutes every SDK reader with synthetic fixtures. It does not use a tenant connection or alter the active parent session. Fixture module manifests and test exports remain in ignored `local-output/`.

Current result: **25 offline cases passed on the assistant test host, PowerShell 7.6.9**. They cover empty/error separation, context/scope guards, mixed successful/missing targets, HTTP 403/404/429, failed pagination, ambiguous names and escaping, limited directory information, independent component failures, missing properties, unresolved identities, retained SELF/deny/inherited entries, encoding, hashes, exit codes, and sequential report calls without reinitializing the loaded SDK/authentication module. This result does not pass live **T24/T25**.

## Sources

- [Graph SDK installation](https://learn.microsoft.com/en-us/powershell/microsoftgraph/installation)
- [Graph interactive authentication](https://learn.microsoft.com/en-us/powershell/microsoftgraph/authentication-commands)
- [License details and supported delegated roles](https://learn.microsoft.com/en-us/graph/api/user-list-licensedetails?view=graph-rest-1.0)
- [Group owners](https://learn.microsoft.com/en-us/graph/api/group-list-owners?view=graph-rest-1.0) and [direct members](https://learn.microsoft.com/en-us/graph/api/group-list-members?view=graph-rest-1.0)
- [Exchange module/runtime requirements](https://learn.microsoft.com/en-us/powershell/exchange/exchange-online-powershell-v2)
- [Mailbox ACL read fields](https://learn.microsoft.com/en-us/powershell/module/exchangepowershell/get-exomailboxpermission)
- [Exchange delegation](https://learn.microsoft.com/en-us/exchange/recipients-in-exchange-online/manage-permissions-for-recipients)


## Observed live diagnostics and limits

Normal exports returned COMPLETE/0 with 62 license, four group and seven mailbox rows. A mixed known/missing license selection retained 124 data rows with PARTIAL/2. Marek's own-mailbox lookup succeeds while Helpdesk lookup fails with an object-not-found message; the report returns FAILED/1 and marks unattempted delegate components NOT_RUN. Restoring adm-lab returns all seven Helpdesk rows. This is account-dependent visibility, not a tenant-wide absence claim or an explicit 403.

The supplementary Exchange ACL call produced a wrapped error; same-process inspection exposed an inner OData 401. The common classifier currently reads top-level HTTP fields and does not traverse that nested Exchange wrapper; the raw literal message and generic category are retained. No precise missing-role diagnosis is inferred. Offline direct 403 coverage remains synthetic and labelled separately. Source/output hashes for the selected live exports match the implemented production scripts. Reports remain reads even when actual session scopes are broader than requested.
