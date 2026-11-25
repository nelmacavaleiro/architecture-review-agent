---
type: llm
focus: { source: file, path: reviews/K2-savings-rate-change-tool-review.md }
---

You are checking the severity grades in an architecture review.

Expected severities:
- KM-P03 Every change to member money is auditable: expected High
- ADR-0007 Central logging and an immutable audit store: expected High (also accepted: May be combined with finding 1 if both references are cited)
- ADR-0005 Use Azure SQL Managed Instance: expected High
- ADR health: relies on superseded ADR-0002: expected Low
- KM-P05 Prefer managed Azure services: expected Medium (also accepted: Concern, Low)

PASS if every one of these findings that the review reports carries the expected severity or an accepted alternative. Findings the review does not report are ignored here.
FAIL if any reported finding from this list carries a different severity.
