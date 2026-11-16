# Stage 08 — SharePoint structure, permissions and sharing

Status: **COMPLETE**\
Execution date: **16 November 2026**\
Target days: **14–16** — learning-plan estimates\
Evidence: [7 captures](../../evidence/day-08/README.md) · [Results](../../tests/day-08.md)

## Requirement and result

Create an independent knowledge site, verify owner/editor/reader roles, distinguish link revocation from effective access removal, and test an isolated folder permission boundary with restoration.

Anna created **BFL-M365-Knowledge** as a communication site at **/sites/BFL-M365-Knowledge**, separate from the Finance Team and private-channel sites. The recorded roles are Anna **Full Control**, Marek **Edit** and Piotr **Read**. The Knowledge library contains the original **LAB-D08-KB-01.docx** with **Category=Mail** and **Status=Draft**. Marek saved an edit that Anna saw after reopening; Piotr could read but could not edit. These outcomes complete T18 and T19.

A controlled Specific people link for Piotr with Can view was removed. The old URL returned **"This link has been removed."**, while Piotr still opened KB-01 through the library. On the separate **LAB-D08-Restricted** folder, the Visitors permission was temporarily removed after stopping inheritance. Piotr was denied the TXT while Marek could still open it and Piotr could still read the main KB-01. Restoring folder inheritance restored Piotr's access to the same TXT. This completes T20 and the controlled restoration exercise.

These are guided synthetic lab exercises. Captures and owner confirmations are distinguished below; no independent audit export or production incident is claimed.

## Resources and starting state

| Resource | Recorded state and source |
| --- | --- |
| Independent site | BFL-M365-Knowledge, /sites/BFL-M365-Knowledge; Anna-created communication site, owner-confirmed; communication template visible in 01/02 |
| Initial access | Capture 01 lists Anna Full Control; members and visitors show None |
| Assigned roles | Capture 02 lists Anna Full Control, Marek Edit and Piotr Read |
| Library and metadata | Knowledge; capture 03 shows original KB-01, Category Mail and Status Draft; other suggested choice values/defaults were not separately audited |
| Original document | LAB-D08-KB-01.docx, synthetic mail-delivery checklist created by Anna; remains the final working document |
| Editor's saved line | "Edited by Marek — SharePoint member access verified." visible in 04/05; Marek's save and Anna's reopened-owner check are owner-confirmed |
| Isolated folder | Knowledge / LAB-D08-Restricted, containing LAB-D08-RESTRICTED-01.txt; TXT baseline access and restoration owner-confirmed |
| Folder ACL baseline | Capture 07: inherits from Knowledge; BFL-M365-Knowledge Owners Full Control, Members Edit, Visitors Read |
| Client/session context | Browser sessions for Anna, Marek and Piotr; Word for the web. Exact current builds and a separate VM execution attribution were not recorded |

The sidebar section labels such as "limited control" or "no control" are not substituted for the actual Edit/Read levels displayed under the users in 02. No tenant-wide sharing-policy change or direct private-channel permission change was part of this stage.

## Original DOCX lock and observed recovery

Saving metadata on KB-01 initially returned **"The file is locked for shared use by [Anna]."** Anna had opened the file only in Word for the web. The error persisted when saving a single property, in a fresh signed-in browser session, and when attempting Check out. No successful check-out/check-in cycle occurred. The owner reported 30–60 minutes since closing Word at one still-failing point; this is not a measured release interval.

A newly uploaded **LAB-D08-LOCK-CONTROL.txt** accepted the same metadata, narrowing the problem beyond a general inability to save those columns. Downloading the DOCX, renaming the local copy to **LAB-D08-KB-02.docx** and uploading it produced a working copy whose Mail/Draft values persisted after refresh, owner-confirmed. That was an available workaround, not evidence that the original item was repaired by copying it.

The original KB-01 subsequently accepted metadata and the edit/read tests. The owner explicitly confirmed it was the **same original item, without replacement**, and explained that it needed time after Anna exited the file. Record recovery after closure and waiting as the owner's observation. The exact lock-release time and service-side mechanism were not measured or audited; do not attribute success to the failed Check out or the copy procedure. Capture 03 shows the recovered original's metadata; 04 shows its functional use.

The owner later confirmed removal of both helper files, KB-02 and LOCK-CONTROL. Their diagnostic phases do not add global tests or an additional resolved-case ID. The original document and its existing history were retained according to the owner's identity clarification.

## Reader and editor checks — T18 / T19 / M365-011

1. Marek opened the original KB-01, appended the recorded verification line and saved it. The owner confirms the action and successful save.
2. Anna reopened the document and saw Marek's change, explicitly owner-confirmed.
3. Piotr opened the content, saw the checklist and saved line, and reported editing unavailable. Capture 04 shows Viewing and disabled editing controls in his reported session.

T18 is a successful negative editing check for an authorized reader, not an inability to read. T19 uses the saved-change/reopened-owner control rather than an Edit setting alone. No exact save latency or independent author audit export is claimed.

## Controlled link revocation — M365-012

The owner confirms the test link was **Specific people / People you choose**, recipient **Piotr**, permission **Can view**. Capture 05 shows the checklist opening in Piotr's browser in Viewing mode using a redacted sharing-style URL. It does not show the link-settings dialog; audience/recipient settings are attributed to the owner's separate confirmation.

Anna removed the selected link. In the subsequent owner-reported test, the saved URL returned **"This link has been removed."** Piotr could still open the document by navigating through the site and Knowledge library.

The role capture establishes Piotr's site Read baseline, which was retained. The result demonstrates that invalidating one URL does not establish removal of all document access. Sharing can give an item unique permissions and retain copied group entries; KB-01's post-sharing inheritance flag and complete item ACL were not separately captured. Therefore the record does not assume that link deletion restored inheritance or identify an unseen exact item-level grant. Retained site/group access is the supported explanation to inspect, not an ignored revocation or a general permission failure.

## Isolated folder boundary and restoration — T20

1. Created LAB-D08-Restricted and uploaded the synthetic TXT. Piotr opened its contents before restriction, owner-confirmed. No broader sharing link was introduced for this test resource in the guided procedure.
2. Opened the folder's advanced permissions. Capture 07 explicitly states **"This folder inherits permissions from its parent. (Knowledge)"** and lists only the three site groups with their levels.
3. Used Check Permissions for Piotr, then stopped inheritance on the folder and removed **BFL-M365-Knowledge Visitors** from that folder's ACL. This removes the folder grant, not Piotr's site-group membership. The owner reports the pre/post effective-permission checks were as expected in the guided sequence; literal dialog output was not supplied, so no exact None/Limited Access string is invented.
4. Marek could still open the same TXT. In Piotr's fresh-session test, the target produced **"You need access" / "You ... don't have access to this item."** in capture 06. Piotr still opened main KB-01 through the library, owner-confirmed. These controls distinguish the scoped boundary from a general account or library outage.
5. Restored the folder's inheritance using the guided Delete unique permissions procedure. The owner confirms restoration and successful reopening of the same TXT as Piotr. This final result is a text confirmation, not a separate captured restoration screen.

The final folder is restored, not permanently restricted. No permission reset was performed on the whole site or Knowledge library. The Finance private-channel baseline remains separate and was not used as this test's target.

## Exit checks and retained state

- [x] Independent communication site, Knowledge library and working Mail/Draft metadata on original KB-01.
- [x] T18 PASS: Piotr reads but editing is unavailable.
- [x] T19 PASS: Marek saves a change that Anna sees after reopening.
- [x] Specific people link configuration owner-confirmed; selected link revoked, old URL invalid and library access retained.
- [x] T20 PASS: isolated folder denial with expected effective-access checks and working controls; inheritance and Piotr access restored.
- [x] Helper DOCX/TXT removed, owner-confirmed; original KB-01 and restored folder/TXT retained for the lab.

At Stage 08 closure: **8/14 stages COMPLETE**, **22 PASS / 10 NOT_RUN** of 32 checks and **12 RESOLVED / 3 PLANNED** lab cases. Only T18–T20 are newly counted. M365-011 closes the intended reader service request; M365-012 closes diagnosis of retained access after a selected link is revoked. The DOCX lock is an additional observation with recovery attributed to the owner, not an extra counted support case.

Exact permission-propagation times, the complete post-sharing KB-01 ACL, raw Check Permissions dialogs and independent item-ID/history exports were not collected. The owner confirmed original-item identity; browser tab text alone is not an item-ID audit. Optional Copilot and OneDrive client synchronization/version/recycle-bin recovery remain unexecuted.

[Results](../../tests/day-08.md) · [Evidence](../../evidence/day-08/README.md) · [Reader case](../../tickets/M365-011-knowledge-reader-access.md) · [Retained-access case](../../tickets/M365-012-revoked-link-retained-access.md) · [Access matrix](../access-matrix.md) · [Sources](../sources.md)

[Next: Stage 09](09-onedrive-sync-and-recovery.md) · [Back to stage index](README.md)
