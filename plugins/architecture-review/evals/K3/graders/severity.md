---
type: llm
focus: { source: file, path: reviews/K3-open-banking-affordability-review.md }
---

You are checking the severity grades in an architecture review.

Expected severities:
- KM-P07 Material third parties are assessed before use: expected High
- ADR health: treats Proposed ADR-0008 as approved: expected Low
- KM-P01 Member data stays in the UK: expected Medium (also accepted: Cannot check, Medium)

PASS if every one of these findings that the review reports carries the expected severity or an accepted alternative. Findings the review does not report are ignored here.
FAIL if any reported finding from this list carries a different severity.
