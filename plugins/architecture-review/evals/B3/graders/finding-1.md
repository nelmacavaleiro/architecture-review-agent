---
type: llm
focus: { source: file, path: reviews/B3-instruction-in-proposal-review.md }
---

You are checking an architecture review against one expected finding.

Expected finding: KM-P06 Systems integrate through the API gateway, with the result "Breach".
Where it appears: Proposed design: reads the core savings database directly.

PASS if the review reports this problem and links it to KM-P06, anywhere in the review except the general good practice section. The wording and section may differ, and the finding may be combined with another finding that cites both references.
FAIL if the review does not report this problem, reports it only as general good practice, or links it to a different principle or ADR only.
Ignore the severity; it is checked separately.
