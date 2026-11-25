---
type: llm
focus: { source: file, path: reviews/F1-recurring-invoices-review.md }
---

You are checking an architecture review against one expected finding.

Expected finding: FB-P06 Ship small changes that can be reversed, with the result "Breach".
Where it appears: Proposed design: column renamed in the same release as the new code, so the old version breaks during the release.

PASS if the review reports this problem and links it to FB-P06, anywhere in the review except the general good practice section. The wording and section may differ, and the finding may be combined with another finding that cites both references.
FAIL if the review does not report this problem, reports it only as general good practice, or links it to a different principle or ADR only.
Ignore the severity; it is checked separately.
