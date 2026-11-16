# Day 07 — Teams, SharePoint boundaries and a cross-device meeting

Execution date: **16 November 2026**. Guided manual checks with Anna and Piotr; synthetic resources and separate user sessions.

## Matrix results

| Check | Expected | Observed | Result / source |
| --- | --- | --- | --- |
| T16 — Standard-channel files | Team member accesses the expected parent-site folder | Piotr opens Finance-Operations STANDARD-01 through Teams and SharePoint, edits/saves; Anna sees the saved line after reopening | **PASS retained and extended**; 01/02 plus owner reports; first PASS remains Day 01 |
| T17 — Private-channel boundary | Authorized member succeeds and excluded team member is denied | Anna opens PRIVATE-01; Piotr is denied with a working standard control, gains access after channel membership, then loses it in a fresh session after removal while standard access remains | **PASS**; 03/04/05 and explicit owner confirmations |

At Day 07 closure: **19 PASS / 13 NOT_RUN** of 32. Only T17 adds a new PASS. The earlier T16 baseline on the older Baltic Finance Lab site remains documented in [Day 01](day-01.md); this run checks the new Finance Team. M365-010 is resolved as a controlled authorization/restoration exercise.

## Supporting checks

| Phase | Observation | Source / boundary |
| --- | --- | --- |
| Existing-group workflow | From a group used; team Private | Explicit owner confirmation; no separate group-ID audit |
| Team membership | Anna Owner, Piotr Member, Marek absent | 01, full owner/member counts |
| Standard document | Initial Anna text plus saved Piotr line | 02; active identity/save and Anna reopen confirmation owner-reported |
| Direct standard-file access | Same file opens through SharePoint | Owner confirmation |
| Private membership baseline | Anna Owner, zero other members | 03 |
| Valid private link | Anna reopens PRIVATE-01 and opens the copied link | Owner confirmation; People with existing access was instructed, not separately captured |
| Private negative | Piotr does not see the channel and receives You need access at the direct link | 04 plus owner identity/visibility and positive standard-file control |
| Temporary authorization | Piotr sees channel and opens file by link and Teams after addition | 05 plus owner confirmation |
| Restoration | Piotr removed only from private channel; fresh-session private denial, standard success; Anna only at closure | Explicit owner confirmation, no extra screenshot |
| Parent SharePoint root | /sites/bfl-m365-finance | Owner-provided path |
| Private SharePoint root | /sites/BFL-M365-Finance-Finance-Confidential | 04/05 and owner-provided path |
| Meeting participants | Anna on computer; Piotr on phone with Teams app | 06 JPG and owner confirmation |
| Audio | Both Anna → Piotr and Piotr → Anna heard | Explicit owner report; still image does not prove audio |
| Screen sharing | Piotr receives STANDARD-01 and sees a view change | 06 proves received presentation; dynamic change owner-confirmed |
| Meeting closure | Sharing stopped; meeting ended | Explicit owner confirmation |

## Interpretation boundaries

The initial private denial is expected for a parent-team member excluded from the private channel. A valid Anna link and working Piotr standard file strengthen the diagnosis. The same link works after the channel grant; final fresh-session denial after removal is reported separately from the earlier screenshot. No exact propagation interval or independent effective-permission export was recorded.

The standard and private roots are different sites. This does not substitute for Stage 08's independent knowledge-site roles, inheritance and link-revocation checks. Marek's absence from membership is configuration evidence, not a new direct-file denial test.

06 is retained as the supplied **JPG**, not renamed or converted to PNG. It shows receipt of shared content; two-way audio, dynamic view changes and closure come from the owner. Device models, mobile/browser build, actual meeting title and call-quality statistics were not supplied. The Word summary interface does not validate Copilot output.

The owner revised 04 to mask the private tenant name in the hostname and encoded Source parameter. The reviewed final version is used for publication. No raw links, tenant domain, meeting URL or identifiers are transcribed into this record.

No PowerShell, automated workload test or production incident resolution is claimed. Documentation link/count checks are separate from these manual results.

[Stage](../docs/stages/07-teams-and-connected-sites.md) · [6 evidence captions](../evidence/day-07/README.md) · [Case](../tickets/M365-010-private-channel-membership-recovery.md) · [Global matrix](test-matrix.csv)
