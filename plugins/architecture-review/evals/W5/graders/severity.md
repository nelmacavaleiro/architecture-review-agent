---
type: llm
focus: { source: file, path: reviews/W5-planning-document-storage-review.md }
---

You are checking the severity grades in an architecture review.

Expected severities:
- WBC-P03 Cloud first, with AWS as the standard platform: expected Medium
- WBC-P04 Use open standards and avoid lock-in: expected Medium
- ADR-0001 Use AWS in the London region for hosted services: expected High (also accepted: May be combined with finding 1 if both references are cited)

PASS if every one of these findings that the review reports carries the expected severity or an accepted alternative. Findings the review does not report are ignored here.
FAIL if any reported finding from this list carries a different severity.
