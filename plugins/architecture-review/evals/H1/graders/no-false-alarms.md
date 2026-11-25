---
type: llm
focus: { source: file, path: reviews/H1-partner-data-feed-review.md }
---

You are checking an architecture review for false alarms.

The only problems that should be graded Medium or High are these:
- ADR health: Accepted ADR-0009 contradicts Accepted ADR-0003 (ADR health issue)
- ADR-0003 Publish all internal and partner APIs through Azure API Management (Conflict)
- KM-P06 Systems integrate through the API gateway (Breach)
- Limits and escalation (Contradiction between ADRs needs an architect's decision)

These details are known not to be problems:
- Data in UK South and broker staff in the UK: KM-P01 is met.
- Broker already assessed in 2025: KM-P07 is met.
- Read-only account, credentials in Key Vault with rotation, and access logging: KM-P04 is largely met. A reviewer may note that a managed identity is not possible for an external partner; this is acceptable as a Low observation.
- Not an important business service, with a phone alternative: KM-P02 does not apply.

PASS if every finding the review grades Medium or High corresponds to one of the expected problems above, counting a finding that combines two expected problems as matching.
FAIL if the review grades any other problem Medium or High, including any of the details known not to be problems. Findings graded Low, and the general good practice section, are ignored.
