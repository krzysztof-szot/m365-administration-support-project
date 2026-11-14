# Support cases

Status: backlog prepared; no cases have been executed or resolved.

Start from the [synthetic backlog](../samples/ticket-backlog.csv). Create a case document from [TICKET-TEMPLATE.md](TICKET-TEMPLATE.md) when work begins. A future example filename is `M365-004-shared-mailbox-send-as.md`; this example is not an existing resolved case.

For each case, record the reported symptom, independently collected observations, competing hypotheses, supported cause, scoped change, recovery path and functional verification. Include impact/urgency reasoning and the final user message.

A service request is not automatically an incident. A deliberate training condition must be labeled as synthetic. Do not invent a real Microsoft outage, error code or root cause.

Suggested statuses: PLANNED → IN_PROGRESS → RESOLVED, or BLOCKED with the actual dependency. Resolve only when the expected result has been checked. Failed and escalated cases keep their observed limitations.

The repository also provides a [support-case issue form](../.github/ISSUE_TEMPLATE/support-case.yml). An issue tracks work; the final case document records verified learning and sanitized evidence.
