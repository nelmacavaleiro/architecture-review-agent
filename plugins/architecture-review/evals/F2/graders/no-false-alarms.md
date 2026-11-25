---
type: llm
focus: { source: file, path: reviews/F2-partner-marketplace-review.md }
---

You are checking an architecture review for false alarms.

The only problems that should be graded Medium or High are these:
- ADR-008 Use OAuth 2.0 for the public API (Conflict)
- ADR health: relies on superseded ADR-007 (ADR health issue)

These details are known not to be problems:
- Cloud Run service: follows ADR-002.
- Listings in the shared database with row-level security: follows ADR-003.
- Logs in the London region, and alerts: FB-P02 and FB-P04 are met.
- Customers can revoke partners: this reduces, but does not remove, the conflict in finding 1.

PASS if every finding the review grades Medium or High corresponds to one of the expected problems above, counting a finding that combines two expected problems as matching.
FAIL if the review grades any other problem Medium or High, including any of the details known not to be problems. Findings graded Low, and the general good practice section, are ignored.
