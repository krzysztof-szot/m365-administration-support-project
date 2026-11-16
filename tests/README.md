# Functional check matrix

Current status after Stages 01–09: **32 global checks: 24 PASS, 8 NOT_RUN.** Stages 10–14 remain PLANNED.

| Check | First execution and evidence |
| --- | --- |
| T01 — baseline workloads | Day 01: Exchange, OneDrive/Word web, Teams and SharePoint |
| T02 — ordinary-user admin attempt | Day 01: explicit administration denial |
| T03 — licensed pilot service | Day 01: Anna's Exchange round trip; carried into completed Stage 02 |
| T04 — missing entitlement recovery | Day 02: Piotr's Outlook failure, licensing correction and two-way mail |
| T05 — alias delivery | Day 03: explicit external alias addressing and matching receipt |
| T06 — distribution membership | Day 02: member delivery and bounded excluded-user observation; Day 03: removal, direct-mail control and restored distribution |
| T07 — Full Access without Send As | Day 04: mailbox opening works while the initial sending attempt receives a permission error |
| T08 — authorized delegation | Day 04: Piotr Send As and reply flow; Anna's separately verified Send on behalf |
| T09 — excluded mailbox identity | Day 04: Marek denied, with identity and working own-Inbox control owner-confirmed |
| T10 — calendar reader | Day 04: reads without editing; editor comparison works and reader is restored |
| T11 — invalid recipient | Day 05: actual NDR and Failed Trace agree on 550 5.1.10 SMTP lookup failure |
| T12 — scoped training rule | Day 05: marked rejection with custom explanation; unmarked control Delivered and opened per owner |
| T13 — mail-flow recovery | Day 05: rule saved Disabled; new marked RULE-03 Delivered in Trace |
| T14 — client identity and activation | Day 06: active Marek product; wrong active user distinguished from licensing account; intended identity and functional checks restored |
| T15 — browser/desktop comparison | Day 06: Work Offline discrepancy, same-message recovery and a new outbound control |
| T29 — allowed room reservation | Day 04: corrected Anna request receives Accepted |
| T30 — conflicting room reservation | Day 04: explicit conflict decline; rescheduled Marek request accepted |
| T16 — standard-channel files | First PASS on the older Day 01 site; Day 07 extends it to Finance-Operations with Piotr edit/save, SharePoint and reopened-owner controls |
| T17 — private-channel boundary | Day 07: authorized Anna; excluded Piotr denied, temporarily added successfully, removed and denied again with a working standard control |
| T18 — knowledge reader | Day 08: Piotr reads original KB-01 while editing is unavailable |
| T19 — knowledge editor | Day 08: Marek saves an edit and Anna sees it after reopening |
| T20 — isolated folder boundary | Day 08: Visitors folder grant removed, Piotr denied with positive controls, inheritance and TXT access restored |
| T21 — OneDrive sync recovery | Day 09: paused local label V1 / cloud V2; Resume and actual local reopening verify V2 |
| T22 — file recovery | Day 09: history and recycle-bin restores each return full original V1 in web/local views |

See [test-matrix.csv](test-matrix.csv) and detailed records for [Day 01](day-01.md), [Day 02](day-02.md), [Day 03](day-03.md), [Day 04](day-04.md), [Day 05](day-05.md), [Day 06](day-06.md), [Day 07](day-07.md), [Day 08](day-08.md) and [Day 09](day-09.md). T06 remains one matrix entry despite multiple phases. Other supporting observations do not increase the 32-check count.

Allowed results:

- NOT_RUN: no execution of the defined check.
- PASS: observed behavior meets the expected result with evidence.
- FAIL: observed behavior does not meet it.
- BLOCKED: an identified dependency prevents execution.

Saved settings, direct observations and owner-reported results are labelled separately. Non-receipt checks have stated observation windows; mailbox availability does not establish desktop activation. Existing MFA claims do not prove fresh push approval. The initial internal alias attempt was inconclusive for its exact target, so the external pair establishes T05. Day 04 additionally attributes selected session, persistence and restoration checks to the owner; pre-send Tracking statuses are distinguished from actual room replies. Day 05 distinguishes captured SMTP lookup diagnostics, configured rule code, actual rejection text and Trace recovery. The unresolved role-delegation exception is recorded separately from passed mail-flow checks. Day 07 extends T16 without adding a PASS count and adds T17; final private-membership restoration, site-root comparison and two-way audio include owner reports. The mobile image proves received presentation, not audio or call-quality metrics. Day 06 separates Piotr as the active Word user from the subscription still naming Marek; its approximately 60-second non-receipt and selected recovery controls are owner-confirmed.

T18–T22 are now PASS. T23 support triage and other later checks remain NOT_RUN despite related baseline observations. Stage completion follows all relevant exit checks, not a directory's existence.

These are manual workload results. No Pester or CI workload tests were run. Documentation link/count checks are separate from live service verification.


Day 08 combines role/content/denial captures with owner-reported link revocation, effective-permission changes and inheritance restoration. The old link is explicitly invalid while library access remains. The DOCX lock recovered after closure/waiting according to the owner; no exact release time or successful forced-unlock command is asserted.

Day 09 uses the owner-selected corrected 02 for the paused label mismatch; its third line is not the original baseline. Full original contents are visible after both recoveries in 05/07. Actual file location, fresh reopening, delete propagation and final client health include explicit owner confirmations; no exact sync latency or independent backup test is inferred.
