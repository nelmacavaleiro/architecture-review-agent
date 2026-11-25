---
type: llm
focus: { source: file, path: reviews/W2-council-tax-payments-review.md }
---

You are checking an architecture review against one expected finding.

Expected finding: ADR-0004 Use GOV.UK Pay for online card payments, with the result "Conflict".
Where it appears: Proposed design and options: own payment page with the bank's gateway.

PASS if the review reports this problem and links it to ADR-0004, anywhere in the review except the general good practice section. The wording and section may differ, and the finding may be combined with another finding that cites both references.
FAIL if the review does not report this problem, reports it only as general good practice, or links it to a different principle or ADR only.
Ignore the severity; it is checked separately.
