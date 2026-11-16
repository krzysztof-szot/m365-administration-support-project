# Day 09 — OneDrive synchronization and content recovery

Execution date: **16 November 2026**. Manual guided checks in BFL-WKS01, Marek's work OneDrive. Client **26.204.1019.0007, 64-bit**, owner-reported. [Stage record](../docs/stages/09-onedrive-sync-and-recovery.md) · [Evidence](../evidence/day-09/README.md).

## Global checks

| ID | Expected | Observed | Result / source |
| --- | --- | --- | --- |
| T21 | Changes appear in browser and client after sync resumes | Paused client; cloud label V2, actual synchronized local label V1; after Resume the reopened OneDrive-folder file is V2 and client healthy | PASS; selected 02/03 plus explicit owner confirmation of file location, fresh reopening and final health |
| T22 | Restored content matches the synthetic baseline | Restore history entry 1.0, then delete/restore the same test item through OneDrive web recycle bin; full original three-line V1 confirmed in web and local after both recoveries | PASS; 04–07 plus owner confirmations of deletion propagation, full contents and final health |

The global matrix now has **24 PASS / 8 NOT_RUN** out of **32**. Files On-Demand, history and recycle-bin phases support these checks without creating additional IDs. T23 support triage and T28 leaver handover remain NOT_RUN.

## Supporting observations and boundaries

| Observation | Result / source |
| --- | --- |
| Initial local-to-web baseline | Full V1 matches, owner-confirmed; 01 shows healthy sync and pinned local availability |
| Files On-Demand | Blue cloud after Free up space, local V1 after reopening, filled green check after Always keep, owner-confirmed; 01 captures the final phase |
| Controlled discrepancy | Selected 02 shows web V2 / local V1 labels and Paused; local third line is already the V2 wording, so it is not full original-baseline proof |
| Corrected evidence selection | Owner replaced the initial wrong 02; only the selected corrected frame is published, with unchanged image bytes |
| Sync recovery | 03 shows matching V2; actual file location, fresh reopening and completed client state owner-confirmed |
| Service history | 04 shows IDs 1.0 and 2.0 at 64/81 bytes; these IDs and timestamps are not text markers or measured latency |
| Version restore | Full original V1 visible in both views in 05 and owner-confirmed; resulting new history ID not captured |
| Delete propagation | Disappearance from web and local folder owner-confirmed; 06 shows the item and original location in OneDrive recycle bin |
| Recycle-bin restore | Full original V1 visible in 07 and owner-confirmed; final Backed up and synced owner-confirmed |
| Availability after final restore | Green available-file icon shown; retention of the earlier Always keep pin not established |
| Size fields | Recycle-bin 23.0 KB differs from history sizes; no explanation or byte-level comparison inferred |

The recovered baseline is **LAB-D09-SYNC-01 / Version: V1 / Baseline created locally by Marek.** All three lines, rather than the version label alone, were compared after each recovery.

## Current state and untested scope

The original file remains in M365-Lab-D09 with V1 and the client resumed. The owner confirms a separate V2 staging copy remains in VM Downloads outside OneDrive. It is retained deliberately as a helper, separate from the synchronized original.

The comparison with Stage 08's shared Knowledge library adds no SharePoint sync or new permission test. No exact pause duration/latency, hash/encoding audit, backup scope, configured retention, entire-drive rollback or offboarding handover was verified. The Backed up and synced panel text alone does not establish Known Folder Move. These are manual workload results; documentation validation is separate from live service checks.

[Matrix](test-matrix.csv) · [All results](README.md) · [M365-013](../tickets/M365-013-onedrive-paused-sync-recovery.md) · [M365-014](../tickets/M365-014-onedrive-file-recovery.md)
