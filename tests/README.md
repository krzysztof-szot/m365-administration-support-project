# Functional check matrix

Status: **32 global checks: 2 PASS, 30 NOT_RUN.** T02 and T03 are supported by the Day 01 screenshots and operator report. No stage is complete.

[test-matrix.csv](test-matrix.csv) records the expected behavior before execution. Update Observed, Result and Evidence only after running the check. Record user/client context and actual timestamps in the corresponding stage note.

Allowed results:
- NOT_RUN: no execution.
- PASS: observed behavior meets the expected result with evidence.
- FAIL: observed behavior does not meet it.
- BLOCKED: an identified dependency prevents execution.

An expected denied-access check passes when the intended identity is actually denied. Absence of a visible UI item alone may not prove denial; test a relevant direct resource where appropriate.

A screenshot of a saved setting is configuration evidence. Delivery, activation, file recovery and effective permission claims require matching functional checks. Record propagation/retry timing instead of silently ignoring an initial failure.

See the [Day 01 result record](day-01.md) for the mail tests, denied administration, configuration observations and pending MFA work. T03 was performed early in Stage 01; Stage 02's remaining exercises are still planned. The detailed rows are supporting observations, not extra global matrix checks.

This is a manual validation record. No Pester or CI tests have been run.
