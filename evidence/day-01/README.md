# Day 01 evidence

Status: **9 screenshots published; Stage 01 IN_PROGRESS.** The owner supplied these redacted screenshots for the lab. Their image bytes are preserved.

## Published captures

| File | Observed evidence and limits |
| --- | --- |
| [01-pilot-license-assignment.png](01-pilot-license-assignment.png) | Anna's Business Premium with Copilot assignment and Poland usage location. This is configuration evidence; Apps is collapsed. |
| [02-pilot-mail-sent.png](02-pilot-mail-sent.png) | Anna's Sent Items shows the synthetic message addressed to a redacted external Gmail mailbox. Displayed time: 08:41 on 14 November 2026; client timezone was not captured. |
| [03-pilot-mail-received.png](03-pilot-mail-received.png) | Anna's Inbox shows the corresponding Gmail reply at displayed time 08:44. Together with capture 02 and the operator report, this supports the external mail round trip. |
| [04-pilot-admin-center-denied.png](04-pilot-admin-center-denied.png) | Microsoft 365 Admin Center explicitly denies the ordinary m365.anna account permission to view or manage the page. |
| [05-signin-before-basic-info.png](05-signin-before-basic-info.png) | Interactive sign-in at 2026-11-14T07:15:27Z: One Outlook Web, Office 365 Exchange Online, Success and Single-factor authentication. |
| [06-signin-before-authentication-details.png](06-signin-before-authentication-details.png) | Authentication Details for the same UTC sign-in states that no authentication events were triggered. No password/MFA sequence can be reconstructed from this record alone. |
| [07-signin-before-conditional-access.png](07-signin-before-conditional-access.png) | Conditional Access tab for the same sign-in shows visible policies as Not applied or Disabled. The separate Report only tab was not captured. |
| [08-mfa-pilot-group-members.png](08-mfa-pilot-group-members.png) | SG-M365-MFA-Pilot has one direct member: M365 Anna Finance. This establishes pilot membership, not an enforced MFA requirement. |
| [09-authenticator-method-scope.png](09-authenticator-method-scope.png) | Authentication methods overview shows Microsoft Authenticator enabled for All users. Detailed authentication mode and effective exclusions are not visible. |

## Timing and interpretation

The sign-in captures 05–07 refer to the same interactive event at **2026-11-14T07:15:27Z**. The mail captures show displayed times 08:41 and 08:44 on 14 November 2026 without the client's timezone. Do not equate these times or claim that the screenshots show the initial password-change event.

The mail counterpart is an **external Gmail mailbox**, not a second Microsoft 365 pilot. The sender's Sent Items alone is not recipient-side delivery evidence; the corresponding Gmail reply and the owner's report support the round trip. Raw external addresses are redacted.

The selected Exchange event has a single-factor requirement and no visible applied CA policy. Its empty Authentication Details is retained as a limitation. It does not prove that MFA is disabled everywhere, that Anna has no registered methods, or what every authentication step was. The report-only evaluation and the exact reasons each existing policy did not apply have not been captured.

Authenticator is enabled for All users in the overview. Mode, detailed exclusions, registration and enforced MFA remain to be checked. A Copilot summary button visible in Outlook is not evidence that Copilot was used or produced a validated result.

## Next capture checkpoints

No pending filename below represents an existing image.

| Planned file | Capture moment |
| --- | --- |
| `09a-authenticator-mode-and-exclusions.png` | Open Microsoft Authenticator's detailed Enable and Target view; capture allowed mode and effective scope/exclusions before changing anything. |
| `09b-ca-operator-role-assignment.png` | If a dedicated CA role is assigned for setup, record the operator and active role assignment without private identifiers; remove a temporary assignment when its work is finished. |
| `10-mfa-policy-report-only.png` | After saving the policy: pilot group scope, target resources, MFA grant and Report-only state. Add 10a/10b detail captures if a single view cannot show the scope/control. |
| `11-report-only-signin-evaluation.png` | The actual Report only tab for a matching post-creation pilot sign-in, including the policy's observed result. |
| `12-mfa-policy-enabled.png` | Only after deliberate enablement: saved pilot policy in On state. |
| `13-pilot-registered-method.png` | Completed method/type after private enrollment; never an enrollment QR code or authentication secret. |
| `14-signin-after-authentication-details.png` | A matching fresh pilot sign-in with actual MFA requirement/method/result; explicitly identify a reused claim if present. |
| `15-signin-after-conditional-access.png` | The same post-change sign-in with the intended MFA policy applied. |
| `16-pilot-admin-denied-after-mfa.png` | After MFA verification, Anna remains unable to administer the tenant. |
| `17-service-health-baseline.png` | Actual service health observation, excluding private customer/incident details. |

The tutor announces each screenshot checkpoint when the relevant action is performed. Keep the tested identity, event time, target resource and result readable. Publish completed registration state only; keep passwords, QR enrollment codes, tokens, recovery material, private addresses, unnecessary tenant IDs and public IPs outside this repository.

[Stage 01 notes](../../docs/stages/01-tenant-and-roles.md) · [Day 01 result record](../../tests/day-01.md) · [Global test matrix](../../tests/test-matrix.csv) · [Evidence rules](../README.md)
