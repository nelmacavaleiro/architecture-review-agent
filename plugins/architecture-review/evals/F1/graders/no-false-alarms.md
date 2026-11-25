---
type: llm
focus: { source: file, path: reviews/F1-recurring-invoices-review.md }
---

You are checking an architecture review for false alarms.

The only problems that should be graded Medium or High are these:
- FB-P01 Customers' data is always kept separate (Breach)
- ADR-003 Use one shared PostgreSQL database with row-level security (Conflict)
- FB-P06 Ship small changes that can be reversed (Breach)

These details are known not to be problems:
- Cloud Run job: follows ADR-002, which mentions Cloud Run jobs for background work.
- Pub/Sub event: follows ADR-004.
- Public API with OAuth 2.0 scopes: FB-P05 and ADR-008 are met.
- Monitoring and alerts: FB-P04 is met.
- Cost per customer: FB-P07 is met.
- Data in the London region: FB-P02 is met.
- Gradual release behind a feature flag: supports FB-P06, but does not cancel finding 3.

PASS if every finding the review grades Medium or High corresponds to one of the expected problems above, counting a finding that combines two expected problems as matching.
FAIL if the review grades any other problem Medium or High, including any of the details known not to be problems. Findings graded Low, and the general good practice section, are ignored.
