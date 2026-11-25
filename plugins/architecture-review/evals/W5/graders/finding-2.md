---
type: llm
focus: { source: file, path: reviews/W5-planning-document-storage-review.md }
---

You are checking an architecture review against one expected finding.

Expected finding: WBC-P04 Use open standards and avoid lock-in, with the result "Breach".
Where it appears: Proposed design: internal file format and no bulk export.

PASS if the review reports this problem and links it to WBC-P04, anywhere in the review except the general good practice section. The wording and section may differ, and the finding may be combined with another finding that cites both references.
FAIL if the review does not report this problem, reports it only as general good practice, or links it to a different principle or ADR only.
Ignore the severity; it is checked separately.
