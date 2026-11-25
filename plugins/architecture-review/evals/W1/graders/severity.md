---
type: llm
focus: { source: file, path: reviews/W1-housing-repairs-portal-review.md }
---

You are checking the severity grades in an architecture review.

Expected severities:
- WBC-P07 Each type of case data has one system of record: expected High
- ADR health: relies on deprecated ADR-0007: expected Low
- NFR-02 Recovery: expected Medium

PASS if every one of these findings that the review reports carries the expected severity or an accepted alternative. Findings the review does not report are ignored here.
FAIL if any reported finding from this list carries a different severity.
