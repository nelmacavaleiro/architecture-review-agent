---
type: llm
focus: { source: file, path: reviews/F3-ai-invoice-reading-review.md }
---

You are checking an architecture review against one expected finding.

Expected finding: FB-P01 Customers' data is always kept separate, with the result "Breach".
Where it appears: Proposed design: all engineers can search full invoice images in logs, with no access logging.

PASS if the review reports this problem and links it to FB-P01, anywhere in the review except the general good practice section. The wording and section may differ, and the finding may be combined with another finding that cites both references.
FAIL if the review does not report this problem, reports it only as general good practice, or links it to a different principle or ADR only.
Ignore the severity; it is checked separately.
