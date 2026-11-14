# Day 01 evidence checklist

Status: capture plan prepared; no image files published in this directory.

This checklist identifies evidence checkpoints for Stage 01. Filenames below are planned names, not links to existing screenshots. Tests and publication status remain separate.

## Planned captures

| File | Capture moment and content | Publication |
| --- | --- | --- |
| `01-pilot-license-assignment.png` | After saving Anna's assignment: display name, selected Business Premium with Copilot and usage location; the previously supplied capture may be reused after review | NOT_PUBLISHED |
| `02-pilot-mail-sent.png` | After a marked synthetic message is delivered to another lab user: the matching Sent Items message | NOT_PUBLISHED |
| `03-pilot-mail-received.png` | After receiving a marked message from another lab user: the received message and synthetic sender/recipient | NOT_PUBLISHED |
| `04-pilot-admin-center-denied.png` | While signed in as Anna: actual administrative portal denial | NOT_PUBLISHED |
| `05-signin-before-basic-info.png` | Before MFA policy changes: matching successful Exchange sign-in with time, resource and authentication requirement | NOT_PUBLISHED |
| `06-signin-before-authentication-details.png` | Authentication Details of that exact sign-in, including an empty-events message if present | NOT_PUBLISHED |
| `07-signin-before-conditional-access.png` | Conditional Access results of that exact sign-in, with relevant policy names/results | NOT_PUBLISHED |
| `08-mfa-pilot-group-members.png` | After creating the assigned security group SG-M365-MFA-Pilot: group name and Anna as the only intended pilot member | NOT_PUBLISHED |
| `09-authenticator-method-scope.png` | Authentication methods policy: Authenticator enabled state and actual target scope/mode; mark whether this is a baseline or a later saved change | NOT_PUBLISHED |
| `10-mfa-policy-report-only.png` | After saving the scoped MFA policy in Report-only: selected pilot group, target resources, grant requirement and state | NOT_PUBLISHED |
| `11-report-only-signin-evaluation.png` | After a pilot test: the actual report-only policy evaluation and any limitations | NOT_PUBLISHED |
| `12-mfa-policy-enabled.png` | Only after deliberate pilot enablement: saved policy scope and On state | NOT_PUBLISHED |
| `13-pilot-registered-method.png` | After private enrollment: completed authentication method/type, with private details removed and no QR code | NOT_PUBLISHED |
| `14-signin-after-authentication-details.png` | After a fresh pilot sign-in: actual MFA requirement/method/result; identify a reused MFA claim if that is what occurred | NOT_PUBLISHED |
| `15-signin-after-conditional-access.png` | The same post-change sign-in: intended MFA policy applied with the observed result | NOT_PUBLISHED |
| `16-pilot-admin-denied-after-mfa.png` | After successful MFA sign-in: ordinary Anna still cannot administer the tenant | NOT_PUBLISHED |
| `17-service-health-baseline.png` | When inspecting Service health: the actual relevant service state without private incident/customer details | NOT_PUBLISHED |

## Interpretation and sequencing

The operator has reported a successful Exchange sign-in with a Single-factor authentication requirement, no authentication events in the selected record and Conditional Access results of Not applied or Disabled. These are reported diagnostic observations, not a captured authentication sequence or proof about every tenant sign-in.

Collect captures 05–07 before policy changes. The group, Authenticator scope, report-only evaluation, enabled policy and after-change results are later checkpoints; no such configuration or outcome is claimed yet.

Use Anna's actual sign-in/client context throughout. A registration prompt alone does not prove MFA enforcement. A reused claim is recorded as a reused claim rather than a newly observed challenge. An admin-portal denial verifies the ordinary-user boundary separately from authentication.

Before a policy change, confirm the applicable role, pilot membership, available authentication methods and recovery path. Initial pilot membership is Anna only. Any later additions need appropriate licenses and verification.

## Evidence index after collection

For each published capture, add the actual capture time, operator or test identity, action, observation and relevant result reference. Link image files only after they exist. Do not claim that pending filenames have already been captured.

[Stage 01](../../docs/stages/01-tenant-and-roles.md) · [Evidence rules](../README.md) · [Test matrix](../../tests/test-matrix.csv)
