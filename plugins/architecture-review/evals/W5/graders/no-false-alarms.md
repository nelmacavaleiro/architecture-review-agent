---
type: llm
focus: { source: file, path: reviews/W5-planning-document-storage-review.md }
---

You are checking an architecture review for false alarms.

The only problems that should be graded Medium or High are these:
- WBC-P03 Cloud first, with AWS as the standard platform (Breach)
- WBC-P04 Use open standards and avoid lock-in (Breach)
- ADR-0001 Use AWS in the London region for hosted services (Conflict)

These details are known not to be problems:
- Data stored in the council's own server room and second site: in the UK, and a DPIA has been completed, so WBC-P05 is met.
- Whole-life cost, including replacement after five years: WBC-P08 is met.
- Cloud storage was considered with a reason given: this does not cancel the WBC-P03 breach, but WBC-P06 is met.
- Recovery of 2 working days and 24 hours: NFR-03 applies and is met.
- Accessibility report and testing: WBC-P02 and NFR-04 are met.

PASS if every finding the review grades Medium or High corresponds to one of the expected problems above, counting a finding that combines two expected problems as matching.
FAIL if the review grades any other problem Medium or High, including any of the details known not to be problems. Findings graded Low, and the general good practice section, are ignored.
