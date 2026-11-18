# Evidence handling

**153 owner-supplied captures are indexed across Days 01–10, Day 12 and Day 13; Stage 11 adds reviewed console/export evidence.** Configuration, captured functional results and owner-reported checks are labelled separately.

| Stage | Screenshots | Results |
| --- | --- | --- |
| [Day 01](day-01/README.md) | 31 | Baseline workloads, MFA rollout and CA role cleanup |
| [Day 02](day-02/README.md) | 21 | Licensing recovery, three-user MFA scope and group configuration |
| [Day 03](day-03/README.md) | 11 | Explicit external alias delivery and DL membership recovery |
| [Day 04](day-04/README.md) | 27 | Mailbox delegation, calendar reader/editor restoration and room conflict recovery |
| [Day 05](day-05/README.md) | 14 | Service health, NDR/Trace diagnosis, scoped rejection/control and delivery after disabling the rule |
| [Day 06](day-06/README.md) | 9 | Apps activation, Office identity mismatch, offline/online comparison, desktop delegation and client version |
| [Day 07](day-07/README.md) | 6 | Finance Team, standard/private files, membership grant/removal and a phone receiving shared content; five PNGs and one JPG |
| [Day 08](day-08/README.md) | 7 | Independent knowledge site, roles, Mail/Draft metadata, reader content, link opening, folder denial and inherited group baseline |
| [Day 09](day-09/README.md) | 7 | Work OneDrive baseline, paused/resumed labels, history and full-content version/deleted-file recovery |
| [Day 10](day-10/README.md) | 4 | Current Service health, future change notice, four Knowledge articles and local-content/cloud-presence recovery evidence |
| [Day 12](day-12/README.md) | 9 | Lifecycle baseline, mover access, handover, blocked sign-in, shared mailbox, retained mail and product unassignment |
| [Day 13](day-13/README.md) | 7 | Practical mail/client/file/offline/report validation; original independence not assessed |

Stage 11 uses [console/export evidence](day-11/README.md) and reviewed redacted samples, with no new screenshots. Future evidence folders do not establish execution. Stage 13 is COMPLETE with T32 PASS for the revised practical criterion; independent execution was not assessed. Stage 14 is COMPLETE for the portfolio review and retained-lab decision.

## Current publication review

The reviewed Day 03 images mask SPO identifiers, the tenant domain and the external sender's display name while preserving the alias local part and test results. The [Day 03 index](day-03/README.md#publication-review) records the publication boundary. Day 04 captures were also reviewed: the owner's revised 02 masks the lab domain, 06 supplies the Send As grant, 09 masks diagnostic identifiers including cv, and final 19/20 plus 23/24 show the corrected requests and actual room replies. See the [Day 04 limits](day-04/README.md#interpretation-boundaries). Documentation does not reproduce raw identifiers or headers; the owner's uploaded image bytes are retained. The 14 Day 05 images were opened and reviewed, including the owner's revised 11 with the How to Fix It domain masked. Captured UTC/status fields support T11–T13; actor attribution and RULE-02 opening are owner-reported, and RULE-03 recovery is based on Trace. The [Day 05 index](day-05/README.md#interpretation-boundaries) records the unresolved role-delegation exception and deliberately omitted auxiliary captures.

Day 06 preserves the eight owner-supplied numbered PNGs plus the additional version crop as 09-outlook-version.png. The [Day 06 index](day-06/README.md) distinguishes captured product/account information, offline state, received messages and Read-Only calendar behavior from owner-reported timing, controls and final restoration. The product in the wrong-user capture still names Marek; no Piotr activation outage is invented.

Day 07 uses the owner's corrected 04 with the tenant name masked in both the hostname and Source. The [Day 07 index](day-07/README.md) separates initial channel membership, denied access, temporary authorized access and owner-reported final removal. Its phone meeting capture remains JPG; audio and closure are attributed to the owner, and distinct site roots are recorded without private hostnames.

Day 08 preserves six numbered owner images and the additional folder-inheritance clipboard capture as seven PNGs. The [Day 08 index](day-08/README.md) identifies 05 as link opening rather than a settings capture, attributes revocation/restoration and expected permission-check changes to the owner, and retains the owner-uploaded filenames even where 05 describes opening rather than settings. The unredacted lock troubleshooting frame is not published; its sanitized observation is described in the stage record.

Day 09 preserves seven selected PNGs, including the owner's corrected 02. Its local third line differs from the original baseline, so full recovery uses 05/07 and explicit owner confirmations. The [Day 09 index](day-09/README.md) separates labels, complete text, status icons and reported controls; it does not infer latency, final pin retention, payload length or independent backup.

Day 10 preserves four owner PNGs. The [Day 10 index](day-10/README.md) distinguishes current status from reported lab impact, broad/detailed future rollout windows, library publication from reader tests, and local contents from owner-confirmed cloud contents. Article outcomes and the removed-link error include explicit text confirmations; no additional screenshots of every click were required.

## Capture checkpoints during guided work

The tutor announces essential screenshot checkpoints before the relevant action, stating the view, moment, filename and behavior supported. Use a small set covering meaningful starting/final configuration and functional results; a separate image for every click is not required. Attribute accepted text confirmations and waived auxiliary captures explicitly.

Use the [Day 01 capture checklist](day-01/README.md) for the first learning stage. Each future stage gets its own numbered captures and a short evidence index.

Record the tested identity/role, client, actual timestamp, action, expected behavior, observed result and material propagation delay. Existing captures can be reused if they depict the correct state; do not recreate an earlier state and present it as an original observation.

## Configuration and functional evidence

A saved permission or policy setting does not establish allowed/denied access or an enforced MFA challenge. Keep configuration, functional results and recovery proof separate.

Use the same sign-in record when comparing its Basic info, Authentication Details and Conditional Access tabs. If no authentication events are recorded, preserve that limitation rather than inferring an unseen password or MFA step. Previously satisfied / MFA requirement satisfied by claim in the token documents claim reuse, not a fresh MFA approval. Registration, requirement, method details and the matching policy result answer different questions.

## Publication review

Publish only reviewed synthetic or redacted captures. Retain the synthetic display name and relevant result where possible so the test identity remains understandable. Remove private contact information, public IP/location, unnecessary tenant/object identifiers and unrelated personal content.

Passwords, QR enrollment codes, authentication secrets, recovery codes, tokens, billing records, real correspondence and raw exports must stay outside the repository. Registration evidence shows a completed method/type after enrollment, never the enrollment QR code.

Ignored directories include `local-output/`, `local-config/` and `raw-evidence/`. A file is marked published only when it actually exists in GitHub and has been reviewed.

Do not fabricate logs, NDR codes or passing checks. Record a healthy service as healthy and distinguish training conditions from Microsoft incidents.


## Day 11 console and export review

Three owner-run COMPLETE report exports were checked locally, including source/output hashes and selected fresh portal confirmations. Mixed-target partial output and same-session own/Helpdesk visibility plus operator recovery are recorded in [Day 11](../tests/day-11.md). A failed lookup and supplemental nested 401 are not labelled as an explicit 403. Public samples remove raw tenant/UPN/GUID/connection identifiers and host paths. The 25 isolated offline code checks use synthetic fixtures and remain separate from live evidence. All 137 prior image blobs are retained.

## Day 12 lifecycle publication review

Nine new original PNGs preserve source bytes; all previous 137 images are unchanged. [Day 12 captions](day-12/README.md) distinguish visible configuration/content from owner-attributed actors, session effects, final reopens and bounded controls. Raw OWA error identifiers and raw tenant exports stay private. The Knowledge query's policy message is textual/inconclusive, not a captured effective denial. Selected redacted API facts and final manual confirmations are labelled separately. Total images: 146 (145 PNG plus one JPG).

## Day 13 and final portfolio review

Seven additional original PNGs bring the image total to 153. Their GitHub hashes match staged source copies; all previous images are preserved. [Day 13](day-13/README.md) attributes actors, saved/reopened controls and final health, including AF avatar in 04 and cloud-only crop in 07. [Day 14](day-14/README.md) adds file/link/privacy/archive review without new workload screenshots. Raw private diagnostics remain local.
