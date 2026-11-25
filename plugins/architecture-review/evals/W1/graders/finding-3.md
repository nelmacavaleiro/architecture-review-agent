---
type: llm
focus: { source: file, path: reviews/W1-housing-repairs-portal-review.md }
---

You are checking an architecture review against one expected finding.

Expected finding: NFR-02 Recovery, with the result "Target missed".
Where it appears: Non-functional needs: 2 working days and 24 hours, but repairs are housing cases (target 8 hours and 1 hour).

PASS if the review reports this problem and links it to NFR-02, anywhere in the review except the general good practice section. The wording and section may differ, and the finding may be combined with another finding that cites both references.
FAIL if the review does not report this problem, reports it only as general good practice, or links it to a different principle or ADR only.
Ignore the severity; it is checked separately.
