# Day 14 — Documentation and preservation review

Review date: 18 November 2026. Stage 14 status: **IN_PROGRESS**. This is repository/evidence QA, not an additional workload test. T32 uses the separately documented practical-validation criterion.

## Verification scope

The publication validator checks the reviewed path allowlist against the actual GitHub base tree; all 153 existing image blobs remain unchanged and no file is deleted. All local Markdown links/anchors, stage counts, 32 unique matrix IDs and fifteen-case registry are checked. Exact private tenant/UPN/object/run identifiers, local paths and token-like strings are screened out of public text. Raw output/config stays excluded.

Selected Stage 13 exports are inspected from actual metadata/CSV with source/output hashes, expected account/tenant and Piotr identity checks. Human group relations and configured mailbox ACLs are not a full effective-access audit. The original Stage 11 report samples remain historical, not rewritten to resemble current values.

A public-only ZIP is built from the explicit reviewed public file list and checked for per-file hash equality and absence of private paths. It preserves repository material, not complete service data. Private archive/audit sidecars record exact outputs and published revision.

## Acceptance boundaries

- Global matrix: **32 PASS / 0 NOT_RUN**, with T32 PASS for the revised five-task practical criterion. Supplied procedures were allowed; independent execution was not assessed.
- Stage 13: COMPLETE for the revised five-task practical-validation scope. T32 is PASS for that practical criterion; the original independent-assessment criterion was replaced.
- Retained lab state is owner-selected; no resource or billing mutation is performed during review.
- Fresh subscription term dates and recurring-billing settings have been requested privately and remain unconfirmed. An older check is not substituted for this closing review.
- The earlier 25 isolated offline code cases remain historical code checks; unchanged source/fixtures do not require a redundant rerun.

[Stage 14](../docs/stages/14-portfolio-and-lab-closure.md) · [Closure](../docs/lab-closure.md) · [Portfolio summary](../docs/portfolio-summary.md)
