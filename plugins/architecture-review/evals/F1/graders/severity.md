---
type: llm
focus: { source: file, path: reviews/F1-recurring-invoices-review.md }
---

You are checking the severity grades in an architecture review.

Expected severities:
- FB-P01 Customers' data is always kept separate: expected High
- ADR-003 Use one shared PostgreSQL database with row-level security: expected High (also accepted: May be combined with finding 1 if both references are cited)
- FB-P06 Ship small changes that can be reversed: expected Medium

PASS if every one of these findings that the review reports carries the expected severity or an accepted alternative. Findings the review does not report are ignored here.
FAIL if any reported finding from this list carries a different severity.
