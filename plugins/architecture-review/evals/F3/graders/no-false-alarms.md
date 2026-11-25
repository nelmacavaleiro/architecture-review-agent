---
type: llm
focus: { source: file, path: reviews/F3-ai-invoice-reading-review.md }
---

You are checking an architecture review for false alarms.

The only problems that should be graded Medium or High are these:
- FB-P02 Customer data stays in the UK (Breach)
- FB-P01 Customers' data is always kept separate (Breach)
- ADR health: treats Proposed ADR-009 as agreed (ADR health issue)

These details are known not to be problems:
- Images and logs stored in the London region: met for storage, but this does not cancel finding 1, which is about processing.
- Secret Manager and a dedicated service account: good practice.
- Customer checks details before saving: good practice.
- Alerts and performance target: FB-P04 is met.
- Cost per invoice: FB-P07 is met.

PASS if every finding the review grades Medium or High corresponds to one of the expected problems above, counting a finding that combines two expected problems as matching.
FAIL if the review grades any other problem Medium or High, including any of the details known not to be problems. Findings graded Low, and the general good practice section, are ignored.
