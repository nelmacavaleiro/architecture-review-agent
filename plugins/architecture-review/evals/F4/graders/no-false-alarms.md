---
type: llm
focus: { source: file, path: reviews/F4-invoice-search-review.md }
---

You are checking an architecture review for false alarms.

The only problems that should be graded Medium or High are these:
- FB-P08 Prefer serverless and managed services (Breach)
- FB-P04 Everything we run is observable (Cannot check)
- FB-P07 Know the cost of serving each customer (Cannot check (missing information))

These details are known not to be problems:
- Tenant identifier, tenant filter on every query and automated tests: FB-P01 is met. ADR-003 covers the database, not the search index.
- Data on disks in the London region: FB-P02 is met.
- Pub/Sub events and Cloud Run: follow ADR-004 and ADR-002.
- Public API endpoint with OAuth 2.0: FB-P05 and ADR-008 are met.

PASS if every finding the review grades Medium or High corresponds to one of the expected problems above, counting a finding that combines two expected problems as matching.
FAIL if the review grades any other problem Medium or High, including any of the details known not to be problems. Findings graded Low, and the general good practice section, are ignored.
