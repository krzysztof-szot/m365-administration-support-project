# Stage 11 — Curated live report extracts

These files derive from real lab exports executed by the owner on 17 November 2026 and inspected locally by the assistant. Domains, tenant/object identifiers, raw recipient references, connection IDs and workstation paths are removed. Login aliases and fictional display names remain. These are **redacted observations**, distinct from the deliberately simulated [offline fixtures](../../tests/fixtures/M365Lab.ReadFixtures.psm1).

| File | Coverage |
| --- | --- |
| [licenses-selected.csv](licenses-selected.csv) | 11 selected rows from Marek's 62-row SPB export; eight Exchange/Office/SharePoint Success values plus three returned pending Intune values |
| [finance-group.csv](finance-group.csv) | All four observed rows: group properties, one human owner and two direct human members; no GUIDs |
| [helpdesk-permissions.csv](helpdesk-permissions.csv) | All seven returned ACL/delegation rows, preserving distinct SELF rights and source indexes; resolved aliases replace raw references |
| [run-summary.csv](run-summary.csv) | Selected baseline, mixed-target, account-visibility and recovery outcomes; timestamps remain UTC |
| [source-hashes.json](source-hashes.json) | Source SHA256 values checked against selected live run metadata |

These simplified columns are not the production CSV schema. Raw rows.csv, components.csv and metadata.json remain private under ignored local-output. A COMPLETE source run does not make the selected license sample a complete entitlement audit. The group row count includes one non-person properties row. Full Access/Send As/SOB counts do not represent effective group-expanded access or a new sending test. The own-mailbox positive control is a standalone Get-Mailbox observation, not an exported report: its exit code is NotApplicable and its unrecorded exact start time is blank.

Marek's initial license read of Piotr succeeded and is not permission-denial evidence. The shared-mailbox visibility failure is described with its actual message in [Day 11](../../tests/day-11.md); a hidden object is not declared deleted, and an explicit API 403 is not claimed.

## Historical snapshot after Stage 12

These exports remain the original Stage 11 observations. Stage 12 subsequently removes Piotr from Finance/DL/IT and Helpdesk/Knowledge reader scope, converts his mailbox and removes product licensing after custody checks. Do not use this unchanged historical Finance/Helpdesk extract as current authorization state. See [current access](../../docs/access-matrix.md) and [separate lifecycle observations](../lifecycle-mailbox-observations.csv).
