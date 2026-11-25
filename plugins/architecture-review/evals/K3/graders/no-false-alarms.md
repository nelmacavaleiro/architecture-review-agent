---
type: llm
focus: { source: file, path: reviews/K3-open-banking-affordability-review.md }
---

You are checking an architecture review for false alarms.

The only problems that should be graded Medium or High are these:
- KM-P07 Material third parties are assessed before use (Breach)
- ADR health: treats Proposed ADR-0008 as approved (ADR health issue)
- KM-P01 Member data stays in the UK (Concern)

These details are known not to be problems:
- Hosting in UK data centres: confirmed for stored data.
- Recovery and fallback to uploaded statements: KM-P02 and NFR-02 are met.
- Managed identity and Key Vault: follow KM-P04 and ADR-0004.
- Azure SQL Managed Instance: follows ADR-0005.
- Accessibility and alternative channel: KM-P08 and NFR-05 are met.

PASS if every finding the review grades Medium or High corresponds to one of the expected problems above, counting a finding that combines two expected problems as matching.
FAIL if the review grades any other problem Medium or High, including any of the details known not to be problems. Findings graded Low, and the general good practice section, are ignored.
