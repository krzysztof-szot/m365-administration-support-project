# Evidence handling

**119 owner-supplied captures are indexed across seven completed stages.** Configuration, captured functional results and owner-reported checks are labelled separately.

| Stage | Screenshots | Results |
| --- | --- | --- |
| [Day 01](day-01/README.md) | 31 | Baseline workloads, MFA rollout and CA role cleanup |
| [Day 02](day-02/README.md) | 21 | Licensing recovery, three-user MFA scope and group configuration |
| [Day 03](day-03/README.md) | 11 | Explicit external alias delivery and DL membership recovery |
| [Day 04](day-04/README.md) | 27 | Mailbox delegation, calendar reader/editor restoration and room conflict recovery |
| [Day 05](day-05/README.md) | 14 | Service health, NDR/Trace diagnosis, scoped rejection/control and delivery after disabling the rule |
| [Day 06](day-06/README.md) | 9 | Apps activation, Office identity mismatch, offline/online comparison, desktop delegation and client version |
| [Day 07](day-07/README.md) | 6 | Finance Team, standard/private files, membership grant/removal and a phone receiving shared content; five PNGs and one JPG |

Future evidence folders do not establish execution. Stages 08–14 remain planned.

## Current publication review

The reviewed Day 03 images mask SPO identifiers, the tenant domain and the external sender's display name while preserving the alias local part and test results. The [Day 03 index](day-03/README.md#publication-review) records the publication boundary. Day 04 captures were also reviewed: the owner's revised 02 masks the lab domain, 06 supplies the Send As grant, 09 masks diagnostic identifiers including cv, and final 19/20 plus 23/24 show the corrected requests and actual room replies. See the [Day 04 limits](day-04/README.md#interpretation-boundaries). Documentation does not reproduce raw identifiers or headers; the owner's uploaded image bytes are retained. The 14 Day 05 images were opened and reviewed, including the owner's revised 11 with the How to Fix It domain masked. Captured UTC/status fields support T11–T13; actor attribution and RULE-02 opening are owner-reported, and RULE-03 recovery is based on Trace. The [Day 05 index](day-05/README.md#interpretation-boundaries) records the unresolved role-delegation exception and deliberately omitted auxiliary captures.

Day 06 preserves the eight owner-supplied numbered PNGs plus the additional version crop as 09-outlook-version.png. The [Day 06 index](day-06/README.md) distinguishes captured product/account information, offline state, received messages and Read-Only calendar behavior from owner-reported timing, controls and final restoration. The product in the wrong-user capture still names Marek; no Piotr activation outage is invented.

Day 07 uses the owner's corrected 04 with the tenant name masked in both the hostname and Source. The [Day 07 index](day-07/README.md) separates initial channel membership, denied access, temporary authorized access and owner-reported final removal. Its phone meeting capture remains JPG; audio and closure are attributed to the owner, and distinct site roots are recorded without private hostnames.

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
