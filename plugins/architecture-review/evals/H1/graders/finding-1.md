---
type: llm
focus: { source: file, path: reviews/H1-partner-data-feed-review.md }
---

You are checking an architecture review against one expected finding.

Expected finding: ADR health: Accepted ADR-0009 contradicts Accepted ADR-0003, with the result "ADR health issue".
Where it appears: Pack: ADR-0009 allows direct database access; ADR-0003 requires all partner APIs to go through API Management.

PASS if the review reports this problem and clearly describes the same problem, anywhere in the review except the general good practice section. The wording and section may differ, and the finding may be combined with another finding that cites both references.
FAIL if the review does not report this problem, reports it only as general good practice, or links it to a different principle or ADR only.
Ignore the severity; it is checked separately.
