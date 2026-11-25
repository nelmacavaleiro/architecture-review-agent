---
type: llm
focus: { source: file, path: reviews/W4-resident-chatbot-review.md }
---

You are checking an architecture review against one expected finding.

Expected finding: WBC-P05 Protect residents' personal data (storage in the UK), with the result "Breach".
Where it appears: Proposed design: conversation data in the supplier's US data centres.

PASS if the review reports this problem and links it to WBC-P05, anywhere in the review except the general good practice section. The wording and section may differ, and the finding may be combined with another finding that cites both references.
FAIL if the review does not report this problem, reports it only as general good practice, or links it to a different principle or ADR only.
Ignore the severity; it is checked separately.
