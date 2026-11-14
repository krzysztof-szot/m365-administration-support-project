# Stage 01 — Tenant baseline and administrative roles

Status: **COMPLETE**  
Execution date: **14 November 2026**  
Target day: 1  
Published evidence: **31 screenshots**

## Learning objective

Connect tenant configuration to actual user behavior: provision an ordinary M365 pilot, establish working services, introduce a scoped MFA requirement and verify the administration boundary and recovery path.

## Starting environment and scope

This project reuses the owner's Baltic Finance identity lab. Expired/disabled E5 and Entra Suite subscriptions, historical users and older Conditional Access policies are background state.

The owner supplied active subscription views for Business Standard (25 seats), Business Premium (25) and Business Premium with Copilot (1). Recurring billing off and ordinary Premium assigned to adm-lab were reported privately. Anna is the new, separate m365.anna pilot; [01](../../evidence/day-01/01-pilot-license-assignment.png) captures Business Premium with Copilot and Poland usage location. Expanded service plans remain owner-reported.

| Client context | Recorded value |
| --- | --- |
| Operating system | Windows 11; edition/build not recorded |
| Ordinary user | M365 Anna Finance in Chrome 157.0.8103.52, 64-bit |
| Administrative sessions | Edge 157.0.4341.46, 64-bit |
| Versions source | Owner's version-page report; not independently inventoried |

## Implementation and reasoning

### 1. Verify the pilot and its boundaries

Anna completed the initial sign-in/password change according to the owner. A synthetic email went to external Gmail and a matching reply arrived ([02–03](../../evidence/day-01/README.md)). Microsoft 365 Admin Center explicitly denied her access ([04](../../evidence/day-01/04-pilot-admin-center-denied.png)).

The selected baseline Exchange sign-in at **07:15:27Z** succeeded with a single-factor requirement. Authentication Details contained no events; visible CA results were Not applied/Disabled. This does not establish why every older policy failed to match or reconstruct the initial password-change interaction.

### 2. Separate an available method from an enforced requirement

SG-M365-MFA-Pilot contains Anna as its one captured direct member. Authenticator is enabled for All users, mode Any, with no excluded groups; registration is Optional ([08–09c](../../evidence/day-01/README.md)). These settings permit the method and do not themselves require MFA on a sign-in.

For configuration, adm-lab received Direct, Active, tenant-scope **Conditional Access Administrator**. The assignment was **Permanent** and therefore needed manual cleanup.

### 3. Evaluate before enforcing

Created **CA-M365-001-Require-MFA-Pilot** with:

- Include: SG-M365-MFA-Pilot.
- Exclude: Emergency Access 01 and Emergency Access 02.
- Target: All resources; no additional conditions or session controls.
- Grant access: Require authentication strength, built-in **Multifactor authentication**.
- Initial state: Report-only.

At **08:36:27Z**, Anna's Outlook sign-in returned **Report-only: User action required** for this policy ([11](../../evidence/day-01/11-report-only-signin-evaluation.png)). The policy matched and evaluated; it did not enforce a challenge in that mode.

Anna's completed Authenticator push registration is captured in [13](../../evidence/day-01/13-pilot-registered-method.png). The pilot policy was then saved **On** ([12](../../evidence/day-01/12-mfa-policy-enabled.png)).

### 4. Verify enforcement and retain the actual authentication result

The Exchange event at **08:54:24Z** records:

| View | Observed result |
| --- | --- |
| Basic info (14a) | Success; Multifactor authentication; MFA requirement satisfied by claim in the token |
| Authentication Details (14) | Conditional Access and Authentication Strength(s); Previously satisfied steps |
| Conditional Access (15) | CA-M365-001-Require-MFA-Pilot: Success |

This verifies the pilot policy's successful MFA requirement using an existing claim. **A fresh Authenticator push approval is not captured in these records.** Supplementary capture 14b is also claim reuse. Anna remained denied administration after MFA ([16](../../evidence/day-01/16-pilot-admin-denied-after-mfa.png)); MFA did not grant an administrator role.

### 5. Check actual workload behavior and health

- OneDrive/Word web: created Day01-Anna-Test.docx, saved, closed and reopened; contents retained (18 and owner confirmation).
- Teams web: sent a self-chat message, refreshed and verified persistence (19 and owner confirmation).
- SharePoint: opened the existing team's General files through Teams, created Day01-SharePoint-Test.docx and reopened it with contents retained. Capture 20a confirms **Baltic Finance Lab > Documents > General**, Modified By Anna.
- Service health: Microsoft 365 suite showed **five advisories**. Separate Exchange, SharePoint and Teams service rows were not available in the owner's view. No tenant-wide healthy state or reproduced Microsoft incident is claimed.

The existing site is labelled Public group with 28 members. These are baseline observations; later stages will exercise explicit membership and permission boundaries.

### 6. Remove the additional role and validate recovery

Removed the added Conditional Access Administrator assignment. Capture [21](../../evidence/day-01/21-ca-operator-role-removed.png) shows no matching active assignment for adm-lab. Other historical administrator roles remain outside this cleanup.

The owner then confirmed a new adm-lab session could open Active users; [22](../../evidence/day-01/22-admin-access-after-role-removal.png) shows the list, while the operator identity is supplied by that report. Separately, fresh bg01 and bg02 sign-ins succeeded and both active Global Administrator assignments were checked. These recovery results are **owner-reported without screenshots**.

## Exit checks

- [x] Configuration role/scope and its subsequent removal are recorded.
- [x] Ordinary pilot is denied administration before and after MFA.
- [x] Exchange, OneDrive/Word web, Teams web and SharePoint baseline functions are verified.
- [x] Restricted MFA policy is evaluated in Report-only and then successfully enforced.
- [x] Service health, browser versions, continued administration and both recovery-account checks are recorded.

## Final state and limits

Anna and the pilot group/policy remain in place; the MFA policy remains On. The test documents and self-chat message remain as synthetic baseline material. The added CA role has been removed.

This is baseline completion, not full M365 project completion. Desktop Apps activation belongs to Stage 06; private-channel isolation to Stage 07; permission-role comparisons to Stage 08; OneDrive sync/recovery to Stage 09. No validated Copilot exercise, PowerShell report, support-case resolution or automated test run is claimed.

Global matrix: **T01, T02, T03 and T16 PASS; 28 NOT_RUN**. T03 and T16 were exercised early during Day 01; their parent stages remain planned.

[Detailed results](../../tests/day-01.md) · [31 evidence captions](../../evidence/day-01/README.md) · [Environment baseline](../01-environment-baseline.md) · [Next: Stage 02](02-users-licenses-and-groups.md)
