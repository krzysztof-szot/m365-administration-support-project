# Functional check matrix

Status: **32 global checks: 4 PASS, 28 NOT_RUN.** Stage 01 is COMPLETE; Stages 02–14 remain PLANNED.

[test-matrix.csv](test-matrix.csv) preserves the expected behavior and records Observed, Result and Evidence after execution. T01/T02 cover baseline workloads and the administration boundary. T03 (licensed Exchange access) and T16 (standard-channel parent-site files) were exercised early in Stage 01.

Allowed global results:

- NOT_RUN: no execution of the defined check.
- PASS: observed behavior meets the expected result with evidence.
- FAIL: observed behavior does not meet it.
- BLOCKED: an identified dependency prevents execution.

An expected denial passes when the intended identity is actually denied. A saved setting is configuration evidence; effective access requires a functional observation. Record the tested identity, client, actual event time and material propagation delay.

The [Day 01 result record](day-01.md) separates screenshot observations from the owner's confirmation of refresh/reopen actions and emergency-account checks. Its supporting observation states, including NOT_CAPTURED for a fresh MFA approval, do not add entries to the global matrix.

The selected after-change MFA event reuses an existing claim. It supports the successful MFA policy requirement, not a fresh Authenticator notification at that moment. No optional fresh-method capture is required to close this stage.

Stage 08 permission-role comparisons and Stage 10 support triage remain NOT_RUN despite successful baseline SharePoint writing and a Service health observation. Parent-stage completion requires all relevant exit checks.

These are manual results. No Pester or CI tests were run.
