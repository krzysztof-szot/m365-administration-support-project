# Environment baseline

Status: owner-reported subscription active; baseline checks PLANNED. No workload test has been run for this repository.

## Known and unverified state

| Field | Record |
| --- | --- |
| Subscription | Microsoft 365 Business Standard, 30-day trial; reported by the owner |
| Active subscription independently inspected | Not recorded |
| Teams entitlement and enabled service plans | Not confirmed |
| Licensed pilot seats | Not confirmed |
| Trial end date and renewal state | Not recorded; keep billing details private |
| Administrative and recovery identities | Not recorded |
| Windows, browser and Outlook versions | Not recorded |
| Functional evidence | None |

## Initial checklist

- [ ] Inspect the exact subscription, enabled service plans and available seats.
- [ ] Record actual expiry and renewal decisions privately; do not assume removing a user's license stops subscription billing.
- [ ] Confirm Exchange, SharePoint, OneDrive, Teams and desktop Apps for the relevant pilot identity.
- [ ] Select one initial synthetic pilot for service checks; create the remaining users in Stage 02.
- [ ] Separate administration from ordinary user accounts.
- [ ] Configure MFA and privately verify administrative recovery access.
- [ ] Choose the role needed for each task; record additional permission dependencies.
- [ ] Prepare an isolated lab client/profile and clearly identified browser profiles.
- [ ] Inspect Service health and record actual observations.
- [ ] Verify an allowed administrative task and a denied ordinary-user attempt.
- [ ] Record provisioning delays and unresolved entitlement questions.

A portal landing page opening is not proof of permission to perform an administrative operation. A product name is not proof that every service is enabled for a user.

Start [Stage 01](stages/01-tenant-and-roles.md). Keep actual domains, tenant IDs, recovery details and billing records outside this public repository. Public summaries can record product names, role names, client versions and sanitized observations.
