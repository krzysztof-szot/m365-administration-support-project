# M365-014 — Restore a previous version and a deleted synthetic file

Status: **RESOLVED**\
Type: **Guided synthetic service request / Stage 09**\
Execution date: **16 November 2026**

## Request and baseline

Recover full original contents of Marek's work OneDrive file M365-Lab-D09/LAB-D09-SYNC-01.txt, then verify recovery after deliberate deletion of that same synthetic item. Expected lines:

```text
LAB-D09-SYNC-01
Version: V1
Baseline created locally by Marek.
```

## Actions and verification

1. Inspected OneDrive history: entries 1.0 and 2.0 were captured with 64/81-byte fields and Marek attribution.
2. Used Restore on 1.0. The owner confirmed full original text in web and the reopened synchronized file; capture 05 shows all three lines in both views.
3. Deleted only the test item through OneDrive web. The owner confirmed its disappearance from web and the local folder; capture 06 shows the item in OneDrive's web recycle bin with its original location.
4. Restored that item to the original folder. The owner confirmed full V1 in both views and final Backed up and synced; capture 07 supports the full-content result. **T22 PASS.**

## Final state and limitations

The original file remains at its original path with full V1 and normal synchronization resumed. The V2 upload helper remains in VM Downloads, owner-confirmed, outside OneDrive.

The operation used version history and the OneDrive web recycle bin. No manual rewrite, Windows recycle-bin recovery, whole-drive rollback, independent backup test or retention-policy audit is claimed. Text was compared, not hashes/encoding. The new history ID after Restore and final retention of the original Always keep pin were not captured. The recycle-bin size field differs from history; its cause and actual payload length were not audited.

## Suggested closure wording

"Both the earlier-version restore and deleted-file restore returned the original three-line V1 in web and the synchronized local folder. The client is healthy and the synthetic original is retained."

This is sample wording, not an externally sent message.

[Stage](../docs/stages/09-onedrive-sync-and-recovery.md) · [Results](../tests/day-09.md) · [Evidence](../evidence/day-09/README.md) · [Earlier sync recovery](M365-013-onedrive-paused-sync-recovery.md)
