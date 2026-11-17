# Day 11 — Read-only reports and explicit failure handling

Execution date: **17 November 2026**. Owner-run PowerShell 7.7.0 on the physical laptop; assistant implemented the scripts, inspected private exports and prepared these redacted records. [Stage](../docs/stages/11-powershell-reporting.md) · [Evidence](../evidence/day-11/README.md) · [Samples](../samples/reports/README.md).

## Global checks

| ID | Expected | Actual result | Status |
| --- | --- | --- | --- |
| T24 | Selected report fields match independent workload reads | Marek SPB matches portal Business Premium; Finance Private / Anna owner / Anna and Piotr members matches fresh portal; Helpdesk named delegation matches fresh mailbox views | PASS |
| T25 | A non-readable report target yields useful error/incomplete status without changing configuration | Same-session Marek own-mailbox read succeeds, Helpdesk lookup fails explicitly; no delegate rows are invented; adm-lab subsequently reads all seven entries. This verifies account-dependent visibility failure handling, not an explicit HTTP 403 or a full role audit. | PASS |

T25 is passed against the defined error/status-handling expectation. Its scope is the observed account-dependent read boundary. The stricter helper expectation ACCESS_DENIED remains unconfirmed and its stored ConformsToExpectedResult=false is not overwritten or relabelled.

## Live baseline and reconciliation

| Report | Outcome / exit / data rows | Reconciliation and boundary |
| --- | --- | --- |
| Licenses, Marek | COMPLETE / 0 / 62 | One SPB product; owner freshly confirms Microsoft 365 Business Premium in portal. All 62 plan statuses were read; only product and the selected prior plan values were independently compared |
| Finance group | COMPLETE / 0 / 4 | One group-properties row, one human owner Anna, two direct human members Anna/Piotr; Private; owner confirms fresh portal views |
| Helpdesk permissions | COMPLETE / 0 / 7 | Full Access Anna/Piotr; Send As Piotr; Send on behalf Anna. SELF rows retained separately, not extra human delegates |

Actual Marek plan distribution: **59 Success, 1 PendingActivation, 2 PendingInput**. Pending values are INTUNE_O365 / PendingActivation and INTUNE_A, INTUNE_SMBIZ / PendingInput. A successful API read does not establish operational Intune readiness or justify changing plans. The eight previously selected Office/Exchange/SharePoint plans return Success.

Two FullAccess SELF entries have different source lists: FullAccess;ReadPermission and FullAccess;ExternalAccount;ReadPermission. They are retained without deduplication or a claimed cause. SendAs also returns SELF. SendOnBehalf Anna was resolved successfully. Named grant comparison is not an independent audit of every system ACL, effective group access, automapping or new mail flow.

## Negative and recovery observations

1. Initial license/group exports and the first mixed control stopped at AUTH_REQUIRED with zero usable rows. Authentication orchestration was made self-contained; causes of the previously absent contexts were not proven. These runs are preserved privately and do not pass permission controls.
2. Selected Marek and Piotr plus a generated unconfigured identifier return **PARTIAL / 2 / 124 data rows**. The two real users each retain 62 SPB plan rows; the generated target has NOT_FOUND_OR_NOT_VISIBLE. Saved HTTP status is null, so a captured numeric 404 is not claimed. No test object was created.
3. Marek reading Piotr's licenses returns **COMPLETE / 0 / 62** with broad actual Graph scopes. This attempt did not establish a permission denial. Specific role assignments were not audited. Graph adm-lab recovery reads Finance completely.
4. Verified Marek Exchange session is Connected / Active in the approved tenant. Helpdesk Get-Mailbox returns **object 'bfl-m365-helpdesk' couldn't be found**; report **FAILED / 1 / 0**, Mailbox FAILED and FullAccess/SendAs/SendOnBehalf NOT_RUN. The current classifier stores REMOTE_OR_LOCAL_ERROR and the literal diagnostic. It does not present missing reads as empty successful ACLs.
5. The supplementary ACL call returns a generic wrapped error. A subsequent read of the same process's existing error records, with **zero remote calls**, reveals inner OData **HTTP 401**, not 403. This supplementary failure does not prove a specific missing Exchange role or distinguish every authentication/authorization cause. The current report classifier does not traverse that nested wrapper; this is a documented diagnostic limitation.
6. The added same-session Get-Mailbox check returns Marek’s own mailbox with the expected identity, while the known Helpdesk target remains unreadable. This isolates an account-dependent visibility contrast for the main lookup; it does not make the separate ACL 401 a proven role diagnosis. Restoring adm-lab returns **COMPLETE / 0 / 7** for Helpdesk. No role, license or mailbox grant was changed by these report/control operations.

## Authentication and environment limits

Laptop: PowerShell 7.7.0 Core, 64-bit, RemoteSigned; Graph Authentication/Users/Groups 2.40.0 and ExchangeOnlineManagement 3.11.1. Actual successful Graph sessions are delegated Process contexts. Six actual ReadWrite scopes are disclosed: Application.ReadWrite.All, Directory.ReadWrite.All, Group.ReadWrite.All, GroupMember.ReadWrite.All, RoleManagement.ReadWrite.Directory and User.ReadWrite.All. The reports call read APIs; these sessions are **not evidence of least-privilege authorization**. Grant origin/age and effective role assignments remain unreviewed.

The earlier VM used Windows PowerShell 5.1 and Graph 2.41.2. Restricted policy blocked import, then a session-level policy correction enabled progress. The VM PowerShell windows later closed unexpectedly; the cause was not diagnosed. Laptop exports are not attributed to the VM or the assistant test runtime.

Admin consent was a setup prerequisite. A bg01 approval/sign-in sequence preceded restored adm-lab access, but exact grant extent was not independently audited. Such setup consent is persistent tenant configuration; Process context only describes the SDK session. Report read-only behavior must not be described as proof that no authentication setup changed.

## Code checks and provenance

**25 offline cases passed** on the assistant test host PowerShell **7.6.9**, using an isolated child process and synthetic SDK fixtures. Cases cover direct 403/404/429, context/scope guards, empty/error separation, partial collections, pagination, identity limitations, ACL preservation, encoding, hashes and sequential module reuse. Simulated 403 coverage is separate from the live visibility control; no live 403 was captured. These 25 are not extra entries in the 32-check global matrix. No Pester or workload CI is claimed.

Selected live entry/common source hashes and rows/components output hashes match local files. Production scripts contain no connect, consent, role assignment or workload write API. Raw exports/private configuration remain ignored. Public CSVs are redacted extracts, not raw diagnostic logs. No new screenshots were required; the existing **137 captures** remain unchanged.

## Closure and retained resources

The operator is restored to adm-lab in the control workflow, with Helpdesk readable. Graph recovery also previously verified Finance under adm-lab. Private configuration, successful and failed raw runs and control diagnostics remain local. No test tenant object was created for the missing-ID control; no grants were removed to manufacture a denial. Existing broad consent is not cleaned automatically. The Stage 05 transport-rule delegation exception remains unresolved; report access does not repair it. Backlog stays 14 resolved / 1 planned, and lifecycle/offboarding remains unexecuted.

[Matrix](test-matrix.csv) · [All results](README.md) · [Report usage](../scripts/README.md)
