# M365-013 — Paused sync leaves the local test file stale

Status: **RESOLVED**\
Type: **Guided synthetic incident / Stage 09**\
Execution date: **16 November 2026**

## Symptom and scope

In BFL-WKS01, Marek's OneDrive web test file shows V2 while the synchronized M365-Lab-D09 copy retains the V1 label. Only LAB-D09-SYNC-01.txt is in scope; this is a deliberately introduced training condition.

## Diagnosis and action

The work client was paused. A separate V2 helper in VM Downloads was uploaded with Replace through OneDrive web while the synchronized local file was not intentionally edited. Explorer's Paused state and the version-label difference support the diagnosis; the owner explicitly identified the local file as the copy in the OneDrive folder.

Resumed the client, closed the local tab and reopened the synchronized file. The owner confirmed V2 and completed synchronization; capture 03 shows matching web/local V2 and a green status. **T21 PASS.** No reset, reinstall, wider permission grant or service-outage attribution was needed.

## Evidence limits

The selected corrected 02 shows local V1 but its third line already has V2 wording. It supports the label mismatch with owner-confirmed file location, not a byte-identical original baseline. The owner's initially supplied wrong frame is superseded. No exact pause observation window or sync latency was measured.

## Final state

The client remains resumed and healthy. The later M365-014 exercise intentionally restores the original synchronized file to full V1; this is separate from the successful V2 sync recovery. The V2 helper remains in VM Downloads outside OneDrive, owner-confirmed.

## Suggested closure wording

"The lab client was paused. After resuming and reopening the actual synchronized file, local V2 matched the cloud. Subsequent recovery testing restored V1 deliberately; the separate Downloads helper is outside synchronization."

This is sample wording, not an externally sent message.

[Stage](../docs/stages/09-onedrive-sync-and-recovery.md) · [Results](../tests/day-09.md) · [Evidence](../evidence/day-09/README.md) · [Later file recovery](M365-014-onedrive-file-recovery.md)
