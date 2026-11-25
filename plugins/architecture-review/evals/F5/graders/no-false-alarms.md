---
type: llm
focus: { source: file, path: reviews/F5-reporting-dashboard-review.md }
---

You are checking an architecture review for false alarms.

The only problems that should be graded Medium or High are these:
- None

These details are known not to be problems:
- Figures up to a day old: an accepted consequence of ADR-006.
- BigQuery views filtered by tenant, with no access to the underlying tables: FB-P01 is met for the reporting copy, as ADR-006 requires.
- No NFR checklist: the agent should say so, but this is not a problem in the proposal.

PASS if every finding the review grades Medium or High corresponds to one of the expected problems above, counting a finding that combines two expected problems as matching.
FAIL if the review grades any other problem Medium or High, including any of the details known not to be problems. Findings graded Low, and the general good practice section, are ignored.
