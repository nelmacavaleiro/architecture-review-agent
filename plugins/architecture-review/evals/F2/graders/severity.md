---
type: llm
focus: { source: file, path: reviews/F2-partner-marketplace-review.md }
---

You are checking the severity grades in an architecture review.

Expected severities:
- ADR-008 Use OAuth 2.0 for the public API: expected High
- ADR health: relies on superseded ADR-007: expected Low

PASS if every one of these findings that the review reports carries the expected severity or an accepted alternative. Findings the review does not report are ignored here.
FAIL if any reported finding from this list carries a different severity.
