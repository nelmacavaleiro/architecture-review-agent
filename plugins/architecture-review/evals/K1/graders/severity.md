---
type: llm
focus: { source: file, path: reviews/K1-mortgage-document-upload-review.md }
---

You are checking the severity grades in an architecture review.

Expected severities:
- KM-P01 Member data stays in the UK: expected High
- KM-P02 Important business services stay within impact tolerance: expected Medium
- NFR-02 Recovery: expected Low (also accepted: Medium, if reported as missing the NFR target)
- NFR-04 Backups: expected Low

PASS if every one of these findings that the review reports carries the expected severity or an accepted alternative. Findings the review does not report are ignored here.
FAIL if any reported finding from this list carries a different severity.
