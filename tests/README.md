# Functional check matrix

Current status after Stages 01–03: **32 global checks: 7 PASS, 25 NOT_RUN.** Stages 04–14 remain PLANNED.

| Check | First execution and evidence |
| --- | --- |
| T01 — baseline workloads | Day 01: Exchange, OneDrive/Word web, Teams and SharePoint |
| T02 — ordinary-user admin attempt | Day 01: explicit administration denial |
| T03 — licensed pilot service | Day 01: Anna's Exchange round trip; carried into completed Stage 02 |
| T04 — missing entitlement recovery | Day 02: Piotr's Outlook failure, licensing correction and two-way mail |
| T05 — alias delivery | Day 03: explicit external alias addressing and matching receipt |
| T06 — distribution membership | Day 02: member delivery and bounded excluded-user observation; Day 03: removal, direct-mail control and restored distribution |
| T16 — standard-channel files | Day 01 on the reused Baltic Finance Lab site; Stage 07 deployment still planned |

See [test-matrix.csv](test-matrix.csv) and detailed records for [Day 01](day-01.md), [Day 02](day-02.md) and [Day 03](day-03.md). T06 remains one matrix entry despite multiple phases. Other supporting observations do not increase the 32-check count.

Allowed results:

- NOT_RUN: no execution of the defined check.
- PASS: observed behavior meets the expected result with evidence.
- FAIL: observed behavior does not meet it.
- BLOCKED: an identified dependency prevents execution.

Saved settings, direct observations and owner-reported results are labelled separately. Non-receipt checks have stated observation windows; mailbox availability does not establish desktop activation. Existing MFA claims do not prove fresh push approval. The initial internal alias attempt was inconclusive for its exact target, so the external pair establishes T05.

T19 permission-role comparison, T23 support triage and other later checks remain NOT_RUN despite related baseline observations. Stage completion follows all relevant exit checks, not a directory's existence.

These are manual workload results. No Pester or CI workload tests were run. Documentation link/count checks are separate from live service verification.
