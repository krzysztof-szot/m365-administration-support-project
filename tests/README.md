# Functional check matrix

Current matrix: **32 global checks: 32 PASS, 0 NOT_RUN.** Stage 13 is COMPLETE for its revised practical-validation scope; Stage 14 is IN_PROGRESS. T32 PASS refers to the five verified practical tasks under the criterion adopted 18 November 2026; independent execution was not assessed.

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
| T23 — service triage | Day 10: current advisory, untested lab impact, future change notice and controlled training are distinguished |
| T24 — report reconciliation | Day 11: three COMPLETE exports and selected independent portal agreement |
| T25 — non-readable report target | Day 11: same-session own-mailbox positive / Helpdesk failed lookup / admin recovery; explicit failure handling, not a captured 403 |
| T26 — leaver new sign-in | Day 12: saved block plus fresh denied login; old-session effect separately owner-reported |
| T27 — mailbox preservation | Day 12: verified SharedMailbox, corrected Anna grant, inspected licensing facts, unassignment and preserved-mail reading |
| T28 — OneDrive handover | Day 12: separate Anna copy with all V1 lines reopened after block/unassignment, preservation limits recorded |
| T31 — revoked link and remaining access | Assigned to Stage 08; explicitly consolidated PASS after Stage 10 repeats the removed old URL and retained library access |

See [test-matrix.csv](test-matrix.csv) and detailed records for [Day 01](day-01.md), [Day 02](day-02.md), [Day 03](day-03.md), [Day 04](day-04.md), [Day 05](day-05.md), [Day 06](day-06.md), [Day 07](day-07.md), [Day 08](day-08.md), [Day 09](day-09.md), [Day 10](day-10.md) [Day 11](day-11.md) and [Day 12](day-12.md). T06 remains one matrix entry despite multiple phases. Other supporting observations do not increase the 32-check count.

Allowed results:

- NOT_RUN: no execution of the defined check.
- PASS: observed behavior meets the expected result with evidence.
- FAIL: observed behavior does not meet it.
- BLOCKED: an identified dependency prevents execution.

Saved settings, direct observations and owner-reported results are labelled separately. Non-receipt checks have stated observation windows; mailbox availability does not establish desktop activation. Existing MFA claims do not prove fresh push approval. The initial internal alias attempt was inconclusive for its exact target, so the external pair establishes T05. Day 04 additionally attributes selected session, persistence and restoration checks to the owner; pre-send Tracking statuses are distinguished from actual room replies. Day 05 distinguishes captured SMTP lookup diagnostics, configured rule code, actual rejection text and Trace recovery. The unresolved role-delegation exception is recorded separately from passed mail-flow checks. Day 07 extends T16 without adding a PASS count and adds T17; final private-membership restoration, site-root comparison and two-way audio include owner reports. The mobile image proves received presentation, not audio or call-quality metrics. Day 06 separates Piotr as the active Word user from the subscription still naming Marek; its approximately 60-second non-receipt and selected recovery controls are owner-confirmed.

All 32 global checks are PASS in the current matrix. T32 uses the revised five-task practical criterion; the original independent-assessment criterion was replaced. Stage completion follows all relevant exit checks, not a directory's existence.

These include manual workload checks and owner-run read-only report exports. Stage 11 also has 25 isolated offline fixture cases on assistant PowerShell 7.6.9, counted separately from the 32 IDs. No Pester or workload CI is claimed. Documentation link/count checks remain separate.


Day 08 combines role/content/denial captures with owner-reported link revocation, effective-permission changes and inheritance restoration. The old link is explicitly invalid while library access remains. The DOCX lock recovered after closure/waiting according to the owner; no exact release time or successful forced-unlock command is asserted.

Day 09 uses the owner-selected corrected 02 for the paused label mismatch; its third line is not the original baseline. Full original contents are visible after both recoveries in 05/07. Actual file location, fresh reopening, delete propagation and final client health include explicit owner confirmations; no exact sync latency or independent backup test is inferred.

Day 10 records T23 and the repeated T31 result without changing the 32 IDs or retroactively rewriting historical completed-day totals. Article validation covers Helpdesk, sharing, EN previous-version recovery with extra chat guidance and DE deleted-file recovery. Screen 04 is local-content and cloud-presence evidence; full cloud contents and final health are owner-confirmed. Escalation preparation is not an external submission or resolution.


## Day 11 evidence boundary

T24 compares selected product/group/named-delegate values; it does not independently reconcile all 62 provisioning statuses or every system ACL. T25 meets useful-error/incomplete-status handling through a verified own-mailbox/Helpdesk visibility contrast and successful admin recovery. The stricter live ACCESS_DENIED predicate remains unconfirmed; supplementary nested 401 is not called 403 or a proven missing role. Marek's license read of Piotr succeeded and is explicitly not denial evidence. Actual Graph ReadWrite scopes are disclosed. See [Day 11](day-11.md), [scripts](../scripts/README.md) and [reviewed extracts](../samples/reports/README.md).

## Day 12 evidence boundary

[Day 12](day-12.md) adds T26–T28 without extra IDs. Captured blocked/unlicensed UI and mailbox type, selected read-only diagnostics and owner-attributed mail/copy/control reopens are distinguished. Knowledge membership removal is reported, but the attempted Check Permissions query returns a sharing-policy message rather than effective levels; no complete item-grant purge is asserted. The selected Anna copy is not a whole-OneDrive migration or indefinite preservation of the unlicensed source. Stage 11 source/tests and historical samples remain unchanged.

## Day 13 practical validation and Day 14 review

[Day 13](day-13.md) records five verified practical subcases and three current report exports, with selected portal agreement. T32 is PASS for the revised five-task practical criterion adopted 18 November 2026. The original independent-assessment criterion was replaced, not independently passed. These subcases do not add IDs or alter earlier passes. [Day 14](day-14.md) checks documentation, privacy, links and preservation rather than adding a workload-test count. Exact private billing review is kept outside public evidence.
