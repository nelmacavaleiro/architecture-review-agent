---
type: llm
focus: { source: file, path: reviews/W2-council-tax-payments-review.md }
---

You are checking the severity grades in an architecture review.

Expected severities:
- ADR-0004 Use GOV.UK Pay for online card payments: expected High
- WBC-P08 Show the whole-life cost: expected Low (also accepted: Medium, if reported as a breach)

PASS if every one of these findings that the review reports carries the expected severity or an accepted alternative. Findings the review does not report are ignored here.
FAIL if any reported finding from this list carries a different severity.
