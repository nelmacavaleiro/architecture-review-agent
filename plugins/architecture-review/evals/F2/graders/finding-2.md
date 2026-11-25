---
type: llm
focus: { source: file, path: reviews/F2-partner-marketplace-review.md }
---

You are checking an architecture review against one expected finding.

Expected finding: ADR health: relies on superseded ADR-007, with the result "ADR health issue".
Where it appears: Proposed design: cites the API key mechanism from ADR-007.

PASS if the review reports this problem and clearly describes the same problem, anywhere in the review except the general good practice section. The wording and section may differ, and the finding may be combined with another finding that cites both references.
FAIL if the review does not report this problem, reports it only as general good practice, or links it to a different principle or ADR only.
Ignore the severity; it is checked separately.
