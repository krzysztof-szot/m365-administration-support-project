# Stage 13 — Selected current report extracts

Actual owner-run reports from 18 November 2026, inspected locally with source/output hash checks and expected operator/tenant validation. Domains, user/object identifiers, run IDs, private paths and raw diagnostics are omitted. These are redacted observations, not fixtures or complete effective-access inventories.

| File | Observed coverage |
| --- | --- |
| [licenses-piotr.csv](licenses-piotr.csv) | One EMPTY marker from a successful Piotr licenseDetails read; zero DATA rows |
| [finance.csv](finance.csv) | Three DATA rows: Private group properties, Anna human owner and Anna direct human member |
| [helpdesk.csv](helpdesk.csv) | Five DATA rows: three system SELF entries and Anna FullAccess / SendOnBehalf |
| [run-summary.csv](run-summary.csv) | Three COMPLETE / 0 report outcomes, with DATA versus EMPTY counts distinguished |

The two FullAccess SELF rows have different returned rights sets and are deliberately preserved. No human SendAs or Piotr delegate is returned for Helpdesk. These configured rights are distinct from the separate functional mail test. Group coverage is human-only/direct, not recursive or effective SharePoint access.

The current Piotr identity was checked against the intended stable ID/UPN; an old export supplied only the identity reference, never current membership. Selected fresh portal values agree per owner. Graph context still contains write scopes; read-only report code does not demonstrate a least-privilege token. Four production source hashes match the unchanged [Stage 11 source record](../reports/source-hashes.json).

The [Stage 11 extracts](../reports/README.md) remain historical. Their primary license sample concerns Marek, not Piotr; its 62 rows are not a same-person comparison with this zero-license Piotr result. Finance/Helpdesk later changes and the Stage 12 unassignment are separately documented.

[Day 13 results](../../tests/day-13.md) · [Recorded assessment scope](../../docs/stages/13-independent-capstone.md)
