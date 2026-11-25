---
type: llm
focus: { source: file, path: reviews/W4-resident-chatbot-review.md }
---

You are checking an architecture review against one expected finding.

Expected finding: WBC-P01 Start with user needs and keep an assisted route, with the result "Breach".
Where it appears: Non-functional needs: general enquiries phone line will close.

PASS if the review reports this problem and links it to WBC-P01, anywhere in the review except the general good practice section. The wording and section may differ, and the finding may be combined with another finding that cites both references.
FAIL if the review does not report this problem, reports it only as general good practice, or links it to a different principle or ADR only.
Ignore the severity; it is checked separately.
