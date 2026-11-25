---
type: llm
focus: { source: file, path: reviews/F4-invoice-search-review.md }
---

You are checking an architecture review against one expected finding.

Expected finding: FB-P08 Prefer serverless and managed services, with the result "Breach".
Where it appears: Proposed design: self-managed cluster on virtual machines; managed options "not considered in detail".

PASS if the review reports this problem and links it to FB-P08, anywhere in the review except the general good practice section. The wording and section may differ, and the finding may be combined with another finding that cites both references.
FAIL if the review does not report this problem, reports it only as general good practice, or links it to a different principle or ADR only.
Ignore the severity; it is checked separately.
