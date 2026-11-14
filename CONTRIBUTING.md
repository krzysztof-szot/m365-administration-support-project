# Recording work in this lab

This is a personal learning repository. Use English for implementation notes and public case records; the Polish plan is a coaching companion.

1. Select a stage and confirm its prerequisites.
2. Record expected behavior and recovery before introducing a controlled problem.
3. Perform the exercise with synthetic identities and files.
4. Update the relevant stage note, ticket and functional test rows.
5. Review all staged content for private identifiers, credentials and raw exports.
6. Commit a coherent result with a message describing the verified change.

Stage statuses are PLANNED, IN_PROGRESS, BLOCKED and COMPLETE. A completed stage has evidence for its relevant exit checks; directory creation does not complete it. Test-result values are defined in [tests/README.md](tests/README.md).

When a check is exercised early, record the actual execution stage and carry its evidence forward. Keep the parent stage planned until its remaining exit checks pass. Attribute owner-reported results explicitly rather than presenting them as directly captured observations.

Separate live Microsoft 365 validation from later offline script checks. Do not add invented successful output, error text, incidents or screenshots.

Use the [lab note](docs/LAB-NOTE-TEMPLATE.md), [support template](tickets/TICKET-TEMPLATE.md) and [evidence rules](evidence/README.md).
