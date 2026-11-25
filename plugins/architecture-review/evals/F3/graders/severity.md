---
type: llm
focus: { source: file, path: reviews/F3-ai-invoice-reading-review.md }
---

You are checking the severity grades in an architecture review.

Expected severities:
- FB-P02 Customer data stays in the UK: expected High
- FB-P01 Customers' data is always kept separate: expected High (also accepted: Concern, Medium)
- ADR health: treats Proposed ADR-009 as agreed: expected Low

PASS if every one of these findings that the review reports carries the expected severity or an accepted alternative. Findings the review does not report are ignored here.
FAIL if any reported finding from this list carries a different severity.
