# Day 13 — Practical validation and assessment boundary

Status: COMPLETE for the revised five-task practical scope adopted 18 November 2026.

Executed 18 November 2026. Five owner-operated practical tasks used supplied procedures/launchers. Each has functional controls. **T32 is PASS** against the revised five-task practical criterion adopted 18 November 2026. This replaces the original independent-assessment criterion; independent execution without the supplied procedures was not assessed. The global matrix stays **32 PASS / 0 NOT_RUN**; subcases do not add IDs.

| Supporting subcase | Verified functional result | Evidence |
| --- | --- | --- |
| CAP-01 | Anna on behalf of Helpdesk received by Marek; return reply read in Helpdesk | 01 plus owner hop confirmations |
| CAP-02 | Correct Word account/subscription, local persistence and desktop/web mail round trip | 02/03 plus owner save/reopen/client attribution |
| CAP-03 | Deny → approved single-file edit → deny, with Anna control and no Team membership | 04/05 plus initial and reopened-owner controls |
| CAP-04 | Cached file opens/changes offline, then complete V2 appears online and locally | 06/07 plus actual adapter/reopen/final-health confirmations |
| CAP-05 | Three COMPLETE report reads match selected fresh portal values | Inspected raw private metadata/output hashes, redacted samples and owner UI values |

Report counts: Piotr zero DATA plus one EMPTY marker, Finance three DATA, Helpdesk five DATA. The five Helpdesk rows preserve both distinct FullAccess SELF entries, SELF SendAs, Anna FullAccess and Anna SendOnBehalf. Human-only/direct group coverage and configured rather than group-expanded effective mailbox access are explicit limits. Expected account/tenant and the intended current Piotr identity verify. Actual Graph scopes include write permissions; code reads are not a least-privilege claim.

Capture 04's AF avatar means saved contents/editing UI, not an independent Marek actor check; actor/save and Anna reopen are owner-confirmed. Capture 05 identifies Marek denied for the item. Exact final inheritance is not captured. Capture 07 shows cloud V2 only; final local reopen and healthy sync are owner-confirmed. No transport/sync latency, file payload hash or comprehensive role/ACL audit is inferred.

All five practical acceptance checks are complete. T32 records their supported functional outcomes against the revised practical criterion. The replaced independent-assessment requirement was not assessed. The earlier 25 isolated report-code cases were not rerun for these documentation/private-launcher additions; production source and fixtures remain unchanged.

[Stage scope](../docs/stages/13-independent-capstone.md) · [Seven captures](../evidence/day-13/README.md) · [Current extracts](../samples/capstone/README.md)
