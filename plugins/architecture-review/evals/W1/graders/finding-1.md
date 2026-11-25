---
type: llm
focus: { source: file, path: reviews/W1-housing-repairs-portal-review.md }
---

You are checking an architecture review against one expected finding.

Expected finding: WBC-P07 Each type of case data has one system of record, with the result "Breach".
Where it appears: Proposed design: officers update tenant contact details in the portal, and changes are not sent back.

PASS if the review reports this problem and links it to WBC-P07, anywhere in the review except the general good practice section. The wording and section may differ, and the finding may be combined with another finding that cites both references.
FAIL if the review does not report this problem, reports it only as general good practice, or links it to a different principle or ADR only.
Ignore the severity; it is checked separately.
