---
type: llm
focus: { source: file, path: reviews/W1-housing-repairs-portal-review.md }
---

You are checking an architecture review against one expected finding.

Expected finding: ADR health: relies on deprecated ADR-0007, with the result "ADR health issue".
Where it appears: Proposed design: forms built with the low-code form builder.

PASS if the review reports this problem and clearly describes the same problem, anywhere in the review except the general good practice section. The wording and section may differ, and the finding may be combined with another finding that cites both references.
FAIL if the review does not report this problem, reports it only as general good practice, or links it to a different principle or ADR only.
Ignore the severity; it is checked separately.
