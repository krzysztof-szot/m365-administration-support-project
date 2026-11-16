# Day 08 — SharePoint roles, links and folder inheritance

Execution date: **16 November 2026**. These are manual workload checks in a guided synthetic lab. [Stage record](../docs/stages/08-sharepoint-and-sharing.md) · [Evidence](../evidence/day-08/README.md).

## Global checks

| ID | Expected | Observed | Result / source |
| --- | --- | --- | --- |
| T18 | Reader opens the document but cannot edit | Piotr reads original KB-01 with Marek's saved line; editing unavailable; Viewing and disabled controls in 04 | PASS; capture plus owner-confirmed identity/negative editing check |
| T19 | Member makes and saves the intended change | Marek saves the verification line; Anna sees it after reopening; line visible in 04/05 | PASS; owner save/reopen confirmations plus visible content |
| T20 | Excluded identity is denied after other access paths are checked | Original folder access works; folder inherits three site groups; Visitors folder grant removed after breaking inheritance; expected Check Permissions change reported; Piotr denied while Marek TXT and Piotr main KB-01 controls work; inheritance restoration restores Piotr TXT | PASS; 06/07 plus attributed owner controls and restoration |

The global matrix now has **22 PASS / 10 NOT_RUN** out of **32**, with unchanged test IDs. Link phases, the metadata lock, working-copy diagnostics and restoration do not create additional matrix entries.

## Supporting observations

| Observation | Result and evidence boundary |
| --- | --- |
| Communication site and roles | Anna-created independent site; 01 initial owner, 02 Anna Full Control / Marek Edit / Piotr Read; site path owner-confirmed |
| Metadata persistence | 03 shows original KB-01 with Mail/Draft after the reported successful save/refresh sequence |
| Original lock | Metadata, individual-property save, fresh session and Check out failed with Anna shared-use lock; no successful check-out cycle |
| TXT control and working copy | TXT metadata and uploaded KB-02 metadata work per owner; neither establishes repair of KB-01 |
| Original recovery | Owner confirms same original KB-01 without replacement; explains recovery after Anna closed the file and time passed; exact release interval/cause not independently measured |
| Link configuration | Specific people / Piotr / Can view owner-confirmed; 05 shows opening rather than the settings dialog |
| Link revocation | Owner reports old URL: "This link has been removed."; navigating through library still opens KB-01 |
| Folder starting ACL | 07 shows folder inherits Knowledge, Owners Full Control, Members Edit, Visitors Read |
| Permission checks | Owner reports expected before/after results; no literal Check Permissions dialog text or raw export supplied |
| Denial | 06 shows Piotr-specific "You need access"; test target/session and working controls owner-confirmed |
| Restoration and cleanup | Owner confirms restored folder inheritance and TXT access; KB-02 and first LOCK-CONTROL TXT removed |

## Current retained state and limits

BFL-M365-Knowledge, Knowledge library, original KB-01 and LAB-D08-Restricted/LAB-D08-RESTRICTED-01.txt remain lab resources. The folder is restored to inherited access; Piotr is not left excluded. The selected sharing link remains removed. Site roles are retained. No final full KB-01 item-ACL audit or inheritance reset was recorded; a retained group grant can survive link deletion even on an item with unique permissions.

The screenshots do not independently prove every click, raw effective-access output, save latency or the time/cause of lock release. Fresh-session controls and restoration are accepted owner confirmations. Private-channel permissions, OneDrive desktop sync/recovery and optional Copilot output were not tested here.

[Matrix](test-matrix.csv) · [All results](README.md) · [M365-011](../tickets/M365-011-knowledge-reader-access.md) · [M365-012](../tickets/M365-012-revoked-link-retained-access.md)
