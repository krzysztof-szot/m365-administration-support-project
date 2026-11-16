# Stage 07 — Teams and connected SharePoint sites

Status: **COMPLETE**\
Execution date: **16 November 2026**\
Target days: **12–13** — learning-plan estimates\
Evidence: [6 captures](../../evidence/day-07/README.md) · [Results](../../tests/day-07.md)

## Requirement and result

Add Teams to the existing Private Finance Microsoft 365 group, verify collaboration in a standard channel, and demonstrate that parent-team membership alone does not grant private-channel access. Identify the parent and private-channel SharePoint sites and test a meeting with a second device.

The owner confirms creating BFL-M365-Finance through **From a group** and retaining **Private** privacy. Anna is the team owner and Piotr is a member; Marek is not listed. Piotr edits the standard-channel document, opens it through SharePoint, and Anna sees the saved change after reopening. Piotr is initially denied the private file, gains access when added to the private channel, and is denied again in a fresh session after removal while standard-channel access continues. The private channel ends with Anna only.

Anna's desktop meeting shares the standard document to Piotr's phone in the Teams app. The mobile capture shows the received presentation; two-way audio, dynamic view changes and meeting closure are explicitly owner-confirmed. These are guided synthetic lab exercises, not a production outage or independent assessment.

## Resources and client context

| Resource | Recorded state and source |
| --- | --- |
| BFL-M365-Finance | Existing Day 02 Private Microsoft 365 group, now Teams-enabled via the owner-confirmed From a group workflow |
| Team membership | Anna Owner, Piotr Member, Marek absent; capture 01 |
| Standard channel | Finance-Operations; file LAB-D07-STANDARD-01 created by Anna |
| Parent SharePoint site | **/sites/bfl-m365-finance**, owner-reported after Open in SharePoint |
| Private channel | Finance-Confidential; Anna Owner, initially zero other members in 03; temporary Piotr membership later removed per owner |
| Private SharePoint site | **/sites/BFL-M365-Finance-Finance-Confidential**, visible in redacted 04/05 and owner-confirmed |
| Private document | LAB-D07-PRIVATE-01, synthetic Anna-only baseline content |
| Browser work | Separate Anna/Piotr sessions; Word for the web and Teams web in the guided workflow; exact current browser builds not recorded |
| Meeting endpoint | Anna on a computer, Piotr on a second device: phone with the Teams app, owner-confirmed; mobile app version not supplied |

The older Public Baltic Finance Lab team/site from Day 01 is a different resource. From a group and Private privacy are explicit owner confirmations; no independent group-ID inventory audit was captured. Stage 06's VM/client setup does not establish that every Stage 07 browser action ran inside that VM.

## Standard-channel collaboration — T16 extended

As Anna, created Finance-Operations as a Standard channel and created LAB-D07-STANDARD-01 with the channel/team baseline text. Piotr opened it from Teams, appended **"Edited by Piotr — standard-channel access verified."**, and saved it. Capture 02 shows the document and that line. Piotr's session identity, the save and successful direct SharePoint opening are explicitly owner-confirmed. Anna also confirms seeing the change after reopening.

This extends **T16**, which already passed on Day 01 using the older Baltic Finance Lab site's General folder. It is not a second global check or a second increment to the PASS count. The new run verifies a member of the actual Finance Team rather than reusing the older resource as proof.

## Private-channel diagnosis, authorization and restoration — T17 / M365-010

1. As Anna, created **Finance-Confidential** with Private type and skipped adding other members. Capture 03 shows Anna as its sole owner and zero members/guests.
2. Created LAB-D07-PRIVATE-01 and reopened it. The owner confirms that Anna could also open the copied direct link. The guided link setting was **People with existing access**; the link-setting dialog was not separately captured.
3. Piotr could still open STANDARD-01 but could not see the private channel. Opening the private link produced **"You need access" / "You don't have access to this item."** in 04. The test identity and working standard-file control are owner-confirmed.
4. Anna added Piotr **as a private-channel Member** through Teams. The owner confirms channel visibility and access through both Teams and the same document link; 05 shows the private document open in Piotr's browser context.
5. Anna removed Piotr from the private channel, retaining his parent-team membership. In a fresh Piotr session the private file no longer opened while STANDARD-01 still worked. These final checks and Anna-only channel membership are explicitly owner-confirmed; no extra restoration screenshot was required.

The cause of the controlled initial denial is missing **private-channel membership**, not a general SharePoint outage or missing parent-team membership. Recovery used the intended membership boundary in Teams. The case closes as a validated temporary authorization and restoration exercise, not as permanent access for Piotr. No direct SharePoint grant or tenant-wide permission redesign forms part of the recorded correction. Exact propagation intervals were not measured.

## Parent site and channel site

The owner supplied two different site paths after opening the corresponding channel libraries in SharePoint. Finance-Operations uses the Finance parent site; Finance-Confidential uses its own channel site. Comparing those site roots, rather than just two document URLs, establishes the recorded distinction. The private root is also visible in 04/05 with the tenant hostname redacted.

Private-channel membership was managed in Teams. This does not establish the independent knowledge-site reader/editor/inheritance tests planned for Stage 08.

## Meeting, audio and screen sharing

The guided meeting was started from **Finance-Operations**. Anna used the computer and Piotr joined on a phone using Teams. The owner confirms both joined, **Anna → Piotr** audio and **Piotr → Anna** audio, and Piotr seeing the standard document plus a change in its view.

Capture **06-meeting-screen-share-piotr.jpg** shows the phone's meeting interface receiving Anna's presentation of LAB-D07-STANDARD-01, including the earlier saved Piotr line. The owner confirms that sharing was stopped and the meeting ended. The actual meeting title, microphone/speaker model and Teams mobile version were not recorded; a guided suggested title is not asserted as a captured fact.

This was a real two-device exercise, not a single-device-only test. It does not measure call-quality statistics, independent networks or sustained performance. Two-way audio and dynamic changes are owner-reported rather than proved by a still image. A visible Word summary-generation interface is not a deliberate or source-validated Copilot exercise. Recording, transcription, Teams Phone and camera operation were not validated.

## Exit checks and retained state

- [x] Finance Team attached to the existing group in the owner-confirmed workflow, with membership/privacy recorded.
- [x] **T16 remains PASS:** Finance member opens, edits and saves the standard file; direct SharePoint and reopened-owner controls succeed.
- [x] **T17 PASS:** authorized private access, excluded member denial, temporary authorization and post-removal denial with a positive control.
- [x] Parent and separate private-channel site roots identified.
- [x] Meeting, two-way audio and cross-device screen sharing exercised; sharing stopped and meeting ended per owner.

Final recorded state: the Private Finance Team retains Anna as Owner and Piotr as Member; Marek is not listed. Finance-Operations and its document remain available to the team. Finance-Confidential retains **Anna only**; Piotr's temporary channel membership was removed. Both synthetic documents and the associated sites remain lab resources. No fresh Marek direct-file denial test or full effective-access audit is claimed.

At Stage 07 closure: **7/14 stages COMPLETE**, **19 PASS / 13 NOT_RUN** of 32 checks and **10 resolved / 5 planned** lab cases. T16's repeated run and the meeting phases do not add global test IDs. Stages 08–14 remain PLANNED. The Stage 05 role-delegation exception remains unresolved; PowerShell reports and the optional Copilot extension remain unexecuted.

I can explain why team and private-channel membership differ, how channel files map to SharePoint sites, why a working standard-file control strengthens a private-file denial, and why a received screen image and an audio report support different claims.

[Membership case](../../tickets/M365-010-private-channel-membership-recovery.md) · [Sources](../sources.md#day-07-implementation-references) · [Stage index](README.md) · [Next: Stage 08](08-sharepoint-and-sharing.md)
