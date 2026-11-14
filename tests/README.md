# Functional check matrix

Status: 32 checks defined; all NOT_RUN. No live test results have been collected.

[test-matrix.csv](test-matrix.csv) records the expected behavior before execution. Update Observed, Result and Evidence only after running the check. Record user/client context and actual timestamps in the corresponding stage note.

Allowed results:
- NOT_RUN: no execution.
- PASS: observed behavior meets the expected result with evidence.
- FAIL: observed behavior does not meet it.
- BLOCKED: an identified dependency prevents execution.

An expected denied-access check passes when the intended identity is actually denied. Absence of a visible UI item alone may not prove denial; test a relevant direct resource where appropriate.

A screenshot of a saved setting is configuration evidence. Delivery, activation, file recovery and effective permission claims require matching functional checks. Record propagation/retry timing instead of silently ignoring an initial failure.

This matrix is not an automated test suite. There are no claimed Pester, CI or live-tenant successes in the scaffold.
