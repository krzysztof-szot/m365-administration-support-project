# Evidence handling

**63 owner-uploaded screenshots are indexed across three completed stages.** Configuration, captured functional results and owner-reported checks are labelled separately.

| Stage | Screenshots | Results |
| --- | --- | --- |
| [Day 01](day-01/README.md) | 31 | Baseline workloads, MFA rollout and CA role cleanup |
| [Day 02](day-02/README.md) | 21 | Licensing recovery, three-user MFA scope and group configuration |
| [Day 03](day-03/README.md) | 11 | Explicit external alias delivery and DL membership recovery |

Future evidence folders do not establish execution. Stages 04–14 remain planned.

## Current publication review

The reviewed Day 03 images mask SPO identifiers, the tenant domain and the external sender's display name while preserving the alias local part and test results. The [Day 03 index](day-03/README.md#publication-review) records the publication boundary. Documentation does not reproduce raw identifiers or headers; the owner's uploaded image bytes are retained.

## Capture checkpoints during guided work

The tutor announces each screenshot checkpoint at the relevant step, stating when to capture, which view to show, the filename and the behavior it supports. Capture the starting state before a change and the observed result afterwards.

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
