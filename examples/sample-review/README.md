# Sample review

[W1-housing-repairs-portal-review.md](W1-housing-repairs-portal-review.md) is a complete review written by the agent, unedited. Open it on GitHub to see the tables and the two diagrams.

## How it was produced

| Item | Detail |
|---|---|
| Plugin | `architecture-review` version 0.1.0, installed from this repository's marketplace on GitHub |
| Model | Sonnet 5.5, in Claude Code in VS Code |
| Date | 25 November 2026 |
| Architecture files | [Wrenford Borough Council](../wrenford-borough-council/) (fictional) |
| Proposal | [W1 Housing repairs portal](../../tests/proposals/W1-housing-repairs-portal.md) (fictional) |
| Command | `/architecture-review:check proposals/W1-housing-repairs-portal.md` |

This run was made after the evaluation, to check the install from GitHub. It is not part of the evaluation results.

## Compared with the answer key

| Answer key | Expected | This review |
|---|---|---|
| WBC-P07: officers keep an editable copy of tenant contact details | Breach, High | Breach, High |
| NFR-02: recovery targets weaker than required for housing cases | Medium | Medium |
| Relies on deprecated ADR-0007 | Low | Low |
| Overall risk | High | High |
| Recommendation | Revise and resubmit | Revise and resubmit |
| Status | Ready for architect review | Ready for architect review |

All three planted problems were found with the expected severity, and the architect's decision was left blank.

## Points to note

- **Extra Low findings.** The review also lists eight Low findings, mostly missing information such as the cost of leaving (WBC-P08) and the export format (WBC-P04). Low findings are not counted as errors, but some of these add reading time for the architect. This is the caution described in the [evaluation results](../../docs/08-evaluation-results.md).
- **One small misreading.** Section 12 says ADR-0005 expects the housing system to be replaced by early 2027. ADR-0005 says a replacement must be *chosen* by early 2027, and the current contract ends in March 2028.
- **Variation between runs.** In the evaluation run, W1 also had one unexpected Medium finding. This run had none. The same proposal can be graded slightly differently on different runs.
