---
type: llm
focus: { source: file, path: reviews/K1-mortgage-document-upload-review.md }
---

You are checking an architecture review for false alarms.

The only problems that should be graded Medium or High are these:
- KM-P01 Member data stays in the UK (Breach)
- KM-P02 Important business services stay within impact tolerance (Cannot check)
- NFR-02 Recovery (Not stated (missing information))
- NFR-04 Backups (Not stated (missing information))

These details are known not to be problems:
- Geo-redundant copy in UK West: stays in the UK, so KM-P01 is met for that copy.
- Use of Azure API Management and Service Bus: follows ADR-0003 and ADR-0006.
- Managed identity and Key Vault: follow KM-P04 and ADR-0004.
- Accessibility: testing and an alternative channel are described, so KM-P08 and NFR-05 are met.

PASS if every finding the review grades Medium or High corresponds to one of the expected problems above, counting a finding that combines two expected problems as matching.
FAIL if the review grades any other problem Medium or High, including any of the details known not to be problems. Findings graded Low, and the general good practice section, are ignored.
