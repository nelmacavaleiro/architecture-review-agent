---
type: llm
focus: { source: file, path: reviews/W4-resident-chatbot-review.md }
---

You are checking the severity grades in an architecture review.

Expected severities:
- WBC-P05 Protect residents' personal data (storage in the UK): expected High
- WBC-P05 Protect residents' personal data (DPIA): expected High (also accepted: Medium, as a concern; may be combined with finding 1 if both points are raised)
- WBC-P01 Start with user needs and keep an assisted route: expected Medium

PASS if every one of these findings that the review reports carries the expected severity or an accepted alternative. Findings the review does not report are ignored here.
FAIL if any reported finding from this list carries a different severity.
