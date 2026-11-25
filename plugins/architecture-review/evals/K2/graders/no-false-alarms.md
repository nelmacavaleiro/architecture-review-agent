---
type: llm
focus: { source: file, path: reviews/K2-savings-rate-change-tool-review.md }
---

You are checking an architecture review for false alarms.

The only problems that should be graded Medium or High are these:
- KM-P03 Every change to member money is auditable (Breach)
- ADR-0007 Central logging and an immutable audit store (Conflict)
- ADR-0005 Use Azure SQL Managed Instance (Conflict)
- ADR health: relies on superseded ADR-0002 (ADR health issue)
- KM-P05 Prefer managed Azure services (Breach)

These details are known not to be problems:
- Recovery: KM-P02 and NFR-02 are met (4 hours, 15 minutes, tested before go-live).
- Access: Entra ID, multi-factor authentication, two-person approval and managed identity meet KM-P04.
- KM-P08 does not apply: this is a staff tool, not a member-facing journey.
- Backups in UK South meet KM-P01 and NFR-04 location; a reviewer may ask about quarterly restore tests, which is acceptable as a Low observation.

PASS if every finding the review grades Medium or High corresponds to one of the expected problems above, counting a finding that combines two expected problems as matching.
FAIL if the review grades any other problem Medium or High, including any of the details known not to be problems. Findings graded Low, and the general good practice section, are ignored.
