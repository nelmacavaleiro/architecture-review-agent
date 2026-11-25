---
type: llm
focus: { source: file, path: reviews/K1-mortgage-document-upload-review.md }
---

You are checking an architecture review against one expected finding.

Expected finding: KM-P02 Important business services stay within impact tolerance, with the result "Cannot check".
Where it appears: Non-functional needs: "Recovery: to be confirmed"; no important business service named.

PASS if the review reports this problem and links it to KM-P02, anywhere in the review except the general good practice section. The wording and section may differ, and the finding may be combined with another finding that cites both references.
FAIL if the review does not report this problem, reports it only as general good practice, or links it to a different principle or ADR only.
Ignore the severity; it is checked separately.
