---
type: llm
focus: { source: file, path: reviews/K5-member-notification-service-review.md }
---

You are checking the severity grades in an architecture review.

Expected severities:
- KM-P06 Systems integrate through the API gateway: expected Medium
- ADR-0003 Publish all internal and partner APIs through Azure API Management: expected High (also accepted: May be combined with finding 1 if both references are cited)
- NFR-01 Availability: expected Medium
- NFR-05 Accessibility: expected Medium
- KM-P08 Digital journeys work for all members: expected Medium (also accepted: Low, if reported as a concern)

PASS if every one of these findings that the review reports carries the expected severity or an accepted alternative. Findings the review does not report are ignored here.
FAIL if any reported finding from this list carries a different severity.
