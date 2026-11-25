---
type: llm
focus: { source: file, path: reviews/F2-partner-marketplace-review.md }
---

You are checking an architecture review against one expected finding.

Expected finding: ADR-008 Use OAuth 2.0 for the public API, with the result "Conflict".
Where it appears: Proposed design: long-lived API keys with full account access for small partners.

PASS if the review reports this problem and links it to ADR-008, anywhere in the review except the general good practice section. The wording and section may differ, and the finding may be combined with another finding that cites both references.
FAIL if the review does not report this problem, reports it only as general good practice, or links it to a different principle or ADR only.
Ignore the severity; it is checked separately.
