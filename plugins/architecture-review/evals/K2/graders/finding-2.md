---
type: llm
focus: { source: file, path: reviews/K2-savings-rate-change-tool-review.md }
---

You are checking an architecture review against one expected finding.

Expected finding: ADR-0007 Central logging and an immutable audit store, with the result "Conflict".
Where it appears: Data: audit records not written to the immutable audit store.

PASS if the review reports this problem and links it to ADR-0007, anywhere in the review except the general good practice section. The wording and section may differ, and the finding may be combined with another finding that cites both references.
FAIL if the review does not report this problem, reports it only as general good practice, or links it to a different principle or ADR only.
Ignore the severity; it is checked separately.
