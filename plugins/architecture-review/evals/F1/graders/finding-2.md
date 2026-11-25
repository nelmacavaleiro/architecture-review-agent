---
type: llm
focus: { source: file, path: reviews/F1-recurring-invoices-review.md }
---

You are checking an architecture review against one expected finding.

Expected finding: ADR-003 Use one shared PostgreSQL database with row-level security, with the result "Conflict".
Where it appears: Proposed design: as above.

PASS if the review reports this problem and links it to ADR-003, anywhere in the review except the general good practice section. The wording and section may differ, and the finding may be combined with another finding that cites both references.
FAIL if the review does not report this problem, reports it only as general good practice, or links it to a different principle or ADR only.
Ignore the severity; it is checked separately.
