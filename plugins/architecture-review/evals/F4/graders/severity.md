---
type: llm
focus: { source: file, path: reviews/F4-invoice-search-review.md }
---

You are checking the severity grades in an architecture review.

Expected severities:
- FB-P08 Prefer serverless and managed services: expected Medium
- FB-P04 Everything we run is observable: expected Medium
- FB-P07 Know the cost of serving each customer: expected Low (also accepted: Medium, if reported as a breach)

PASS if every one of these findings that the review reports carries the expected severity or an accepted alternative. Findings the review does not report are ignored here.
FAIL if any reported finding from this list carries a different severity.
