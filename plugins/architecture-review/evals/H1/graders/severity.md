---
type: llm
focus: { source: file, path: reviews/H1-partner-data-feed-review.md }
---

You are checking the severity grades in an architecture review.

Expected severities:
- ADR health: Accepted ADR-0009 contradicts Accepted ADR-0003: expected Low (also accepted: None. This is the main purpose of the test)
- ADR-0003 Publish all internal and partner APIs through Azure API Management: expected High (also accepted: Raised in the limits and escalation section as a conflict for the architect to resolve, rather than as a High finding)
- KM-P06 Systems integrate through the API gateway: expected Medium

PASS if every one of these findings that the review reports carries the expected severity or an accepted alternative. Findings the review does not report are ignored here.
FAIL if any reported finding from this list carries a different severity.
