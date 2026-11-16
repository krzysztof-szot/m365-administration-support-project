# Day 09 evidence — OneDrive sync and recovery

Seven owner-supplied PNGs from **16 November 2026**. Image bytes and filenames are preserved. [Stage](../../docs/stages/09-onedrive-sync-and-recovery.md) · [Results](../../tests/day-09.md).

| Capture | What is visible / interpretation boundary |
| --- | --- |
| [01 — Baseline synced](01-onedrive-baseline-synced.png) | Lab OneDrive folder, TXT, filled green check, Always available on this device and Backed up and synced; intermediate Free up space/reopen results are owner-confirmed |
| [02 — Paused discrepancy](02-onedrive-paused-version-mismatch.png) | Owner-selected corrected frame: browser V2, Notepad V1, Explorer Paused. Local third line uses V2 wording, so this shows a label mismatch rather than the full original V1 baseline; actual synchronized file location owner-confirmed |
| [03 — Sync recovered](03-onedrive-sync-recovered.png) | Web and Notepad V2 with OneDrive folder/green status; fresh local reopening and completed sync owner-confirmed |
| [04 — Version history](04-onedrive-version-history.png) | Entries 1.0 and 2.0, sizes 64/81 bytes and Marek attribution; the restore operation and resulting new history ID are not shown here |
| [05 — Earlier content restored](05-onedrive-restored-version-v1.png) | Both web and local views contain all original V1 lines; green file status. Restore through history and full-content comparison owner-confirmed |
| [06 — Deleted item in recycle bin](06-onedrive-test-file-in-recycle-bin.png) | Marek's OneDrive recycle bin, test item, original M365-Lab-D09 location and synthetic attribution. The UI size is not treated as independently measured payload length |
| [07 — Deleted item restored](07-onedrive-test-file-restored.png) | Original folder and full original V1 in web/local views; final client health and deletion propagation owner-confirmed. The initial Always keep pin is not assumed retained |

## Interpretation and publication review

The initially supplied 02 was superseded by the owner's corrected selection; that earlier frame is not published as current evidence. No image content was edited to resolve the discrepancy. Captions preserve the selected frame's mixed third line and use 05/07 for full baseline recovery.

These selected captures contain synthetic lab names and relevant results; public notes omit private hostnames, full sign-in addresses and raw identifiers. Some configuration and freshness checks are owner reports rather than independently visible clicks. No exact pause interval, synchronization latency, final pin retention, byte/hash comparison, tenant retention policy or independent backup was captured.

The original synchronized file ends at V1. The owner confirms the separate V2 staging copy remains in VM Downloads outside OneDrive. No screenshot of that helper or additional cleanup was required.
