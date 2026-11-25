# Sample review

[W1-housing-repairs-portal-review.md](W1-housing-repairs-portal-review.md) is a complete review written by the agent, unedited. Open it on GitHub to see the tables and the two diagrams.

## How it was produced

| Item | Detail |
|---|---|
| Plugin | `architecture-review` version 0.1.1, installed from this repository's marketplace on GitHub |
| Model | Sonnet 5.5, in Claude Code in VS Code |
| Date | 25 November 2026 |
| Architecture files | [Wrenford Borough Council](../wrenford-borough-council/) (fictional) |
| Proposal | [W1 Housing repairs portal](../../tests/proposals/W1-housing-repairs-portal.md) (fictional) |
| Command | `/architecture-review:check proposals/W1-housing-repairs-portal.md` |

This run was made after the evaluation, to check the install from GitHub and the formatting changes in version 0.1.1. It is not part of the evaluation results, which are for version 0.1.0.

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

- **Extra Low findings.** The review also lists 13 Low findings, including concerns on WBC-P01 and WBC-P08, which the answer key treats as met. Low findings are not counted as errors, but they add reading time for the architect. This is the caution described in the [evaluation results](../../docs/08-evaluation-results.md).
- **One small inaccuracy.** The notes under the components diagram say the proposal does not say where photos are stored. The proposal says all data, which includes photos, is stored in the AWS London region; it does not say which service holds them.
- **Variation between runs.** Three runs of W1 on the same evening all found the three planted problems with the expected severities, but the number of Low findings varied between 8 and 14, and one run drafted a third ADR. The same proposal can be graded slightly differently on different runs.
