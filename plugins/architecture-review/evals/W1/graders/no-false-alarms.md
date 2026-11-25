---
type: llm
focus: { source: file, path: reviews/W1-housing-repairs-portal-review.md }
---

You are checking an architecture review for false alarms.

The only problems that should be graded Medium or High are these:
- WBC-P07 Each type of case data has one system of record (Breach)
- ADR health: relies on deprecated ADR-0007 (ADR health issue)
- NFR-02 Recovery (Target missed)

These details are known not to be problems:
- Nightly file export from the housing system: follows ADR-0005.
- Data in the AWS London region and DPIA completed: WBC-P05 is met.
- GOV.UK Notify: follows ADR-0003 and WBC-P06.
- Accessibility testing and phone route: WBC-P01, WBC-P02 and NFR-04 are met.
- Whole-life cost: WBC-P08 is met.

PASS if every finding the review grades Medium or High corresponds to one of the expected problems above, counting a finding that combines two expected problems as matching.
FAIL if the review grades any other problem Medium or High, including any of the details known not to be problems. Findings graded Low, and the general good practice section, are ignored.
