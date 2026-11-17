# Stage 11 — Read-only operational PowerShell reports

Status: COMPLETE  
Target days: 21–23  
Execution date: 17 November 2026

## Result and learning objective

Three selected-target reports are implemented and exported: licenses/service plans, Microsoft 365 group human relations and shared-mailbox delegation. Selected fields match fresh independent portal reads. Missing/non-readable targets produce explicit failed or partial output, and usable results are retained. [Detailed results](../../tests/day-11.md) and [redacted samples](../../samples/reports/README.md) distinguish live observations from simulated code checks.

The stage closes on the defined useful-error/incomplete-status expectation. The live account visibility control is not described as a captured 403; the strict ACCESS_DENIED subcheck remains unconfirmed.

## Scope and runtime

- Owner's physical laptop: PowerShell 7.7.0 Core, 64-bit; Graph Authentication/Users/Groups 2.40.0; ExchangeOnlineManagement 3.11.1.
- Earlier VM Windows PowerShell 5.1 probes remain historical evidence. Restricted import and unexpected VM shell closure are separate from laptop export outcomes; closure cause was not diagnosed.
- Approved tenant/account entered privately and checked against actual connections. Production scripts do not authenticate, install modules, grant consent, assign licenses/roles or change workloads.
- Actual Graph sessions include broad ReadWrite scopes; read-only code is not proof of a least-privilege token. Authentication consent setup is documented separately from report reads.

## Executed work

1. Manually checked Marek licensing, Finance owner/member/privacy state and Helpdesk named grants; owner reconciled selected values with fresh portal views.
2. Implemented [three report scripts and common library](../../scripts/README.md), with explicit targets, context validation, coverage, UTF-8 BOM exports, component status, source/output hashes and exit codes 0/2/1 for COMPLETE/PARTIAL/FAILED.
3. Verified baseline exports: licenses 62 rows, Finance four rows, Helpdesk seven rows. Pending plan statuses remain actual data; duplicate-looking SELF rows retain their full differing source rights.
4. Exercised a mixed existing/missing selection: Marek/Piotr retain 124 data rows while the generated identifier is separately failed, PARTIAL/2. No tenant object created.
5. Kept the unexpected allowed Marek-to-Piotr license read as a successful read, without claiming an authorization denial.
6. Recorded Exchange Helpdesk visibility failure under Marek, supplemental wrapped ACL 401, successful own-mailbox control in the same session, and full Helpdesk recovery under adm-lab. Exact roles and an explicit 403 are unconfirmed.
7. Ran 25 isolated offline cases on assistant PowerShell 7.6.9; fixtures and their simulated failures are labelled separately from actual service evidence.

## Exit checks

- [x] Selected rows match independent portal/workload reads, within the recorded coverage.
- [x] Non-readable-target/missing-object failures yield explicit useful diagnostics; exact authorization mechanism is bounded in the test record.
- [x] Partial output is explicitly incomplete and retains successful targets.
- [x] Report/control reads do not mutate workload configuration.
- [x] Curated samples are separated from ignored raw exports and private configuration.

## Diagnostic and evidence limits

T24 is PASS. T25 is PASS for observed account-dependent failure handling. An inaccessible mailbox is not asserted deleted; missing delegate reads remain NOT_RUN, not successful empty lists. The strict helper ACCESS_DENIED predicate is not silently changed into a passing 403 assertion. Inner supplemental HTTP 401 was recovered from existing ErrorRecords, not fabricated from a generic message. The common classifier does not yet traverse that nested Exchange wrapper.

The group report covers human owners/direct human members only. The mailbox report covers configured ACL/delegate entries, not effective group expansion, automapping or new mail tests. Product/selected-field portal agreement does not establish every technical provisioning state. No effective role audit, broad-consent cleanup, independent assessment or Stage 05 RBAC repair is claimed.

## Closure and next stage

Actual operator recovery returns adm-lab and a COMPLETE seven-row Helpdesk read. Private config, raw runs and controls are retained locally; published extracts remove tenant/object/connection identifiers and host paths. No new screenshots; 137 prior captures retained. No additional backlog incident is invented: 14 resolved / 1 planned. The [employee lifecycle stage](12-employee-lifecycle.md) remains planned; no offboarding action has been performed.

The owner can explain COMPLETE versus PARTIAL versus FAILED, provisioning versus read status, named versus effective grants, active versus licensing identity, and why a failed/hidden target cannot be exported as an empty successful permission list. This was guided, assistant-supported implementation, not an independent assessment.

[Evidence](../../evidence/day-11/README.md) · [Tests](../../tests/day-11.md) · [Usage and sources](../../scripts/README.md) · [Stage index](README.md)
