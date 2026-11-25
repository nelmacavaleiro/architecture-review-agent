---
type: llm
focus: { source: file, path: reviews/F4-invoice-search-review.md }
---

You are checking an architecture review against one expected finding.

Expected finding: FB-P04 Everything we run is observable, with the result "Cannot check".
Where it appears: No monitoring or alerts described.

PASS if the review reports this problem and links it to FB-P04, anywhere in the review except the general good practice section. The wording and section may differ, and the finding may be combined with another finding that cites both references.
FAIL if the review does not report this problem, reports it only as general good practice, or links it to a different principle or ADR only.
Ignore the severity; it is checked separately.
