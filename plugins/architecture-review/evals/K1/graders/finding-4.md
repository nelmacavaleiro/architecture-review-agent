---
type: llm
focus: { source: file, path: reviews/K1-mortgage-document-upload-review.md }
---

You are checking an architecture review against one expected finding.

Expected finding: NFR-04 Backups, with the result "Not stated (missing information)".
Where it appears: Data section does not mention backups or restore testing.

PASS if the review reports this problem and links it to NFR-04, anywhere in the review except the general good practice section. The wording and section may differ, and the finding may be combined with another finding that cites both references.
FAIL if the review does not report this problem, reports it only as general good practice, or links it to a different principle or ADR only.
Ignore the severity; it is checked separately.
