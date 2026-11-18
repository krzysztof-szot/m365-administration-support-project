# Stage 13 — Cross-workload practical validation

Status: COMPLETE  
Target days: 26–27  
Execution date: 18 November 2026, Europe/Warsaw

## Recorded scope

Stage completion is assessed against a revised scope adopted on 18 November 2026: execute and verify the five practical tasks below. All five are complete. The owner performed the operations using supplied procedures and report launchers.

T32 uses the revised five-task practical-validation criterion adopted on 18 November 2026. Supplied procedures and report launchers are permitted. All five supported functional outcomes below meet that criterion, so **T32 is PASS** and Stage 13 is COMPLETE.

This explicitly replaces the original independent-assessment criterion. An assessment without a supplied repair sequence was not performed; its independent-execution requirement is not presented as passed. The recorded result applies to the revised practical scope.

This is a synthetic lab. Several tasks validate healthy services rather than repair a current outage.

## Verified practical tasks

| Subcase | Observed result | Verification |
| --- | --- | --- |
| CAP-01 — Helpdesk mail | Marek receives Anna on behalf of Helpdesk; Marek's return reply is read by Anna in Helpdesk | Capture 01 shows actual received sender; other hops owner-confirmed |
| CAP-02 — desktop identity | Word user and subscription identify Marek; local document reopens with full contents; classic Outlook round trip works | Capture 02 account/product UI; capture 03 received reply and connection status; local persistence and VM attribution owner-confirmed |
| CAP-03 — one-file permission | Initial Marek denial, temporary edit/save, Anna sees reopened edit; Marek stays outside Finance Team; removal restores item denial | Initial/member/owner controls reported; capture 04 saved text; capture 05 identifies denied m365.marek |
| CAP-04 — offline work | Pinned V1 opens offline; V2 saved/reopened offline; reconnect produces full matching V2 in cloud and locally | Capture 06 Offline/local V2; capture 07 full cloud V2; reconnect/local reopen/final health owner-confirmed |
| CAP-05 — current reporting | Piotr successful empty license read; Finance Anna-only; Helpdesk Anna configured delegates; selected fresh portal agreement | Actual CSV/JSON and source/output hashes inspected; redacted extracts published |

## Decisions and source boundaries

FullAccess and sender authorization were checked separately. The actual received mail identifies `M365 Anna Finance on behalf of BFL-M365-Helpdesk`. Existing Anna delegation was used; no new grant is reported for the mail task. Word shows `Subscription Product for` Marek and Microsoft 365 Apps for business, Version 2610 / Build 20527.20196 / Current Channel. Its current frame does not show a fresh bitness or activation-token audit. A local save/reopen is not OneDrive synchronization evidence.

The temporary collaboration target is only `LAB-D13-ACCESS-01.docx` in Finance. Anna creates the baseline; Marek's edit is reported saved and Anna sees it after reopening. Capture 04 has an AF avatar, so its contents/editing UI do not independently identify Marek as the current editor. Capture 05 explicitly identifies Marek in the final item denial. Exact temporary-grant source and final inheritance/ACL inventory were not captured; no Team/site-wide grant, complete ACL restoration or tenant-wide purge is claimed. Anna retains the file and saved line.

The offline target is `M365-Lab-D13/LAB-D13-OFFLINE-01.txt` in Marek's work OneDrive. Complete final text:

```text
LAB-D13-OFFLINE-01
Version: V2
Edited offline by Marek.
```

The file was marked Always keep on this device before a controlled disconnect of the lab VM. Online-only blue-cloud status means the content is not locally downloaded; it can coexist with a healthy synchronized client. Capture 06 shows Offline and pending sync; capture 07 shows the full cloud contents but not the final client-health panel. The owner confirms VM connectivity restored, fresh local/web agreement and `Backed up and synced`. No measured latency, payload hash equality, backup or whole-drive recovery is inferred.

## Current report reconciliation

| Selected target | API/report result | Fresh portal observation |
| --- | --- | --- |
| Piotr | COMPLETE / 0, zero DATA and one EMPTY marker; current identity verified | Zero assigned products; sign-in blocked |
| Finance | Private; Anna human Owner and direct human Member; three DATA rows | Private, Owners Anna, Members Anna |
| Helpdesk | Five configured rows: three SELF, Anna FullAccess and Anna SendOnBehalf; no human SendAs | FullAccess Anna, no human SendAs, Send on behalf Anna |

Metadata account/tenant, selected target, source hashes and CSV output hashes verify. Graph includes broader write scopes; the source calls read APIs, not a least-privilege session demonstration. The Helpdesk total is not five people. A failed read with zero data would not establish no licenses; the actual Piotr EMPTY response is a successful selected-target read.

The main Stage 11 license sample is for Marek and is not a historical Piotr baseline. Historical Finance/Helpdesk samples are unchanged; the new [current extracts](../../samples/capstone/README.md) preserve their own observation time and coverage. No new workload mutation is made by the reports.

## Remaining state and assessment limit

Anna's retained Piotr mailbox/file custody, blocked unlicensed Piotr anchor, existing pilot security scope and the disabled training transport rule remain as previously recorded. The Finance test document keeps its saved edit with Anna access and Marek denied. The local Word test remains in VM Downloads; the OneDrive TXT remains V2. Existing D09/D10 originals were not test targets. No extra M365 backlog incident is created.

Any future independent assessment would need a separately defined criterion and new evidence; it is not part of the completed practical T32.

[Seven captures](../../evidence/day-13/README.md) · [Day 13 test record](../../tests/day-13.md) · [Current extracts](../../samples/capstone/README.md) · [Portfolio review](14-portfolio-and-lab-closure.md)

[Back to stage index](README.md)
