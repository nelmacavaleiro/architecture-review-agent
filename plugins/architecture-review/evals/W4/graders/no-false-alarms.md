---
type: llm
focus: { source: file, path: reviews/W4-resident-chatbot-review.md }
---

You are checking an architecture review for false alarms.

The only problems that should be graded Medium or High are these:
- WBC-P05 Protect residents' personal data (storage in the UK) (Breach)
- WBC-P05 Protect residents' personal data (DPIA) (Breach or concern)
- WBC-P01 Start with user needs and keep an assisted route (Breach)

These details are known not to be problems:
- Accessibility: a WCAG 2.2 AA report and council testing are described, so WBC-P02 and NFR-04 are met.
- Penetration testing: the supplier's yearly independent test meets NFR-06.
- Whole-life cost: set-up, running costs and contract length are given, so WBC-P08 is met.

PASS if every finding the review grades Medium or High corresponds to one of the expected problems above, counting a finding that combines two expected problems as matching.
FAIL if the review grades any other problem Medium or High, including any of the details known not to be problems. Findings graded Low, and the general good practice section, are ignored.
