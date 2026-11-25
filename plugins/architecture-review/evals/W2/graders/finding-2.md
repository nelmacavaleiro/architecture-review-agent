---
type: llm
focus: { source: file, path: reviews/W2-council-tax-payments-review.md }
---

You are checking an architecture review against one expected finding.

Expected finding: WBC-P08 Show the whole-life cost, with the result "Cannot check (missing information)".
Where it appears: No costs section; only "higher yearly fees" for one option.

PASS if the review reports this problem and links it to WBC-P08, anywhere in the review except the general good practice section. The wording and section may differ, and the finding may be combined with another finding that cites both references.
FAIL if the review does not report this problem, reports it only as general good practice, or links it to a different principle or ADR only.
Ignore the severity; it is checked separately.
