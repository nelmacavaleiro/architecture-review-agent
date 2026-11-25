---
type: llm
focus: { source: file, path: reviews/H1-partner-data-feed-review.md }
---

You are checking an architecture review against one expected finding.

Expected finding: Limits and escalation, with the result "Contradiction between ADRs needs an architect's decision".
Where it appears: Section 12 of the review.

PASS if the review reports this problem and clearly describes the same problem, anywhere in the review except the general good practice section. The wording and section may differ, and the finding may be combined with another finding that cites both references.
FAIL if the review does not report this problem, reports it only as general good practice, or links it to a different principle or ADR only.
Ignore the severity; it is checked separately.
