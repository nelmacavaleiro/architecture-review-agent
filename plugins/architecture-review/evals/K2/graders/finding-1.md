---
type: llm
focus: { source: file, path: reviews/K2-savings-rate-change-tool-review.md }
---

You are checking an architecture review against one expected finding.

Expected finding: KM-P03 Every change to member money is auditable, with the result "Breach".
Where it appears: Data: audit table in the tool's own database, which administrators can correct.

PASS if the review reports this problem and links it to KM-P03, anywhere in the review except the general good practice section. The wording and section may differ, and the finding may be combined with another finding that cites both references.
FAIL if the review does not report this problem, reports it only as general good practice, or links it to a different principle or ADR only.
Ignore the severity; it is checked separately.
