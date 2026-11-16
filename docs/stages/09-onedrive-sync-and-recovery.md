# Stage 09 — OneDrive synchronization and file recovery

Status: COMPLETE  
Target days: 17–18  
Execution date: **16 November 2026**

## Objective and scope

Diagnose a controlled stale local copy and recover both earlier contents and a deleted file. All mutations were limited to Marek's synthetic **M365-Lab-D09/LAB-D09-SYNC-01.txt** in his work OneDrive. The owner operated the UI in the dedicated BFL-WKS01 VM with guided instructions.

The work sync client was signed in as Marek, owner-confirmed, at version **26.204.1019.0007, 64-bit**. The initial panel showed **Backed up and synced**. This label alone does not establish Desktop/Documents/Pictures backup, the complete selected-folder scope, or an independent backup service. A fresh client installation was not independently established.

## Baseline and Files On-Demand

Created the TXT locally in the OneDrive folder and checked the same three lines in OneDrive web:

```text
LAB-D09-SYNC-01
Version: V1
Baseline created locally by Marek.
```

The owner confirmed Free up space produced a blue cloud, reopening downloaded the file with V1 contents, and Always keep on this device produced a filled green check. Capture 01 shows the final pinned state, **Always available on this device**, and the healthy cloud panel. It does not capture every intermediate icon.

## Controlled paused synchronization — M365-013 / T21

1. Closed the test file and paused the work sync client.
2. Prepared a separate V2 TXT in VM Downloads, outside OneDrive, and used browser Upload/Replace on the existing cloud test file. The staging copy was not the synchronized local original.
3. During the pause, the cloud showed Version: V2 while the actual OneDrive-folder file showed Version: V1, explicitly confirmed by the owner. The selected capture 02 shows those labels and Explorer's Paused state.
4. Resumed synchronization, closed the local tab and reopened the file from the OneDrive folder. The owner confirmed V2 and completed synchronization; capture 03 shows matching V2 and a green file status.

The controlled cause was the paused client. Resume restored the affected local contents without a reset, reinstall or permission change. No Microsoft outage or measured synchronization latency is claimed.

**Evidence boundary:** the owner replaced an initially supplied wrong frame with the selected 02. In that selected frame the local label is V1, but its third line already says "Updated through OneDrive web while sync was paused." It demonstrates a version-label discrepancy, supported by the owner-confirmed file location; it does not prove the full original baseline. Full baseline recovery is established separately in 05 and 07.

## Previous-version restoration — M365-014 / T22

Capture 04 shows service history entries **1.0, 64 bytes** and **2.0, 81 bytes**, both attributed to Marek. History IDs are distinct from V1/V2 text markers. The operator selected Restore on entry 1.0 and compared the full restored text in web and the freshly reopened synchronized file.

The owner confirmed all three original lines matched; capture 05 shows those same original lines in both views and a green file status. No manual rewrite is presented as version recovery. The resulting new history ID and complete post-restore history were not captured. The timestamps in 04 are not a measurement of sync delay.

## Deleted-file restoration — M365-014 / T22

Deleted only SYNC-01 through OneDrive web. The owner confirmed it disappeared from both web and the synchronized local folder. Capture 06 identifies the item in Marek's OneDrive web recycle bin and its original M365-Lab-D09 location.

Restored that item from the OneDrive recycle bin to its original folder. The owner confirmed full three-line V1 in web and the reopened local file, plus final **Backed up and synced**. Capture 07 shows both full contents and the available-file green status. Retention of the initial Always keep pin after delete/restore was not established.

The recycle-bin UI displays 23.0 KB, whereas the earlier history table displays 64/81 bytes. Those fields are preserved as shown; their difference was not investigated and is not used as payload-length proof. Verification compared text, not hashes or byte encoding.

## Storage and recovery distinctions

| Capability / resource | Meaning and observed boundary |
| --- | --- |
| Marek's work OneDrive | User workspace synchronized with BFL-WKS01; this is a work account, distinct from a consumer Microsoft account |
| Shared Knowledge library | Existing independent communication site /sites/BFL-M365-Knowledge; Stage 08 verified Anna Full Control, Marek Edit and Piotr Read. This comparison does not add a SharePoint client sync test |
| Synchronization | Brings changes and deletions between the connected folder and cloud; the pause/resume and deletion propagation were verified here |
| Version history | Restores older contents of an existing item; entry 1.0 recovery was checked against all original lines |
| Recycle bin | Restores the deliberately deleted item; checked in its original folder with its expected contents |
| Backup coverage | Sync plus these recovery tests do not establish an independent backup, configured retention, recovery of the entire drive or Desktop/Documents/Pictures protection |

See the official [Day 09 references](../sources.md#day-09-implementation-references). General product behavior is separate from this lab's observed results.

## Exit checks

- [x] Changes appear in browser and client after Resume: V2 verified in the actual OneDrive-folder file.
- [x] Restored earlier contents match all three original V1 lines in both views.
- [x] Recovered deleted file opens in the original folder with the same full V1.
- [x] The note distinguishes synchronization, history, recycle-bin recovery and unverified backup coverage.

**T21/T22 PASS; M365-013/014 RESOLVED.** The global matrix is now **24 PASS / 8 NOT_RUN** out of 32. Substeps and Files On-Demand do not create additional matrix IDs.

## Retained state and limitations

Marek's work client is resumed and healthy. The original synchronized SYNC-01 remains in M365-Lab-D09 with full V1. The separate V2 staging copy remains in VM Downloads, owner-confirmed; it is an explicitly retained helper outside OneDrive, not a remaining sync failure.

No exact pause observation interval, sync latency, hash comparison, tenant retention configuration, cross-user OneDrive denial, SharePoint-library sync, entire-drive recovery, independent backup or leaver handover was tested. The earlier knowledge-site lock and folder-permission restoration remain separate Stage 08 findings. These guided checks do not establish the independent Stage 13 assessment.

[Results](../../tests/day-09.md) · [7 captures](../../evidence/day-09/README.md) · [Paused-sync case](../../tickets/M365-013-onedrive-paused-sync-recovery.md) · [Recovery case](../../tickets/M365-014-onedrive-file-recovery.md) · [Stage index](README.md)
