# Environment baseline

Status: **PARTIALLY VERIFIED — Stage 01 IN_PROGRESS**. The tenant is an existing identity lab; the new project uses separate M365 pilot identities.

| Field | Recorded state and source |
| --- | --- |
| Active products | Owner-supplied subscription views: Business Standard 25 seats; Business Premium 25; Business Premium with Copilot 1 |
| Trial/billing decisions | Reviewed privately; recurring billing off reported by the owner; no billing records published |
| Existing products | E5 and Entra Suite reported expired/disabled; historical assignments remain visible |
| Administrative identity | Existing adm-lab, with User Administrator and several other roles visible in the earlier operator screenshot; ordinary Premium assignment reported by owner |
| Ordinary pilot | M365 Anna Finance / m365.anna |
| Pilot license | Business Premium with Copilot; Poland usage location, captured in evidence 01 |
| Service plans | Exchange, SharePoint, Teams, Apps, Entra P1 and Copilot reported enabled by owner; expanded plans not captured |
| Functional service access | Exchange browser mail sent to external Gmail and a reply received; other workloads pending |
| Ordinary-user admin boundary | Explicit Admin Center denial captured |
| Pre-change sign-in | Interactive One Outlook Web to Exchange; Success; Single-factor at 2026-11-14T07:15:27Z |
| Authentication Details | No authentication events recorded in that selected event |
| CA result | Captured tab: visible policies Not applied or Disabled; separate Report only tab not captured |
| MFA pilot group | SG-M365-MFA-Pilot, one direct member: Anna |
| Authenticator | Overview Enabled=Yes, Target=All users; detailed mode/exclusions and registration not yet verified |
| User/browser/client versions | Not recorded |
| MFA enforcement, recovery and service health | Pending |

## Remaining baseline work

- [ ] Capture the detailed Authenticator mode and effective scope/exclusions.
- [ ] Confirm a CA operator with the required role rather than treating User Administrator as CA authority.
- [ ] Record report-only evaluation and then enforced MFA for the restricted pilot.
- [ ] Verify administrative recovery without publishing recovery material.
- [ ] Functionally check remaining workloads and record client versions.
- [ ] Inspect Service health and record the actual state.
- [ ] Record the final remaining resources and unresolved limitations.

The broad role set on the reused admin is background state, not proof of a newly implemented least-privilege design. A new Premium license does not itself require MFA or restore every expired E5/Suite capability.

[Stage 01 notes](stages/01-tenant-and-roles.md) · [Evidence](../evidence/day-01/README.md) · [Result record](../tests/day-01.md) · [Copilot pilot plan](copilot-pilot-plan.md)
