# Severity rules

These rules are fixed. Apply them exactly, so that reviews are consistent and can be tested.

## Results for each principle

| Result | Use when |
|---|---|
| Meets | The proposal clearly follows the principle, or shows what the principle requires it to show |
| Breach | The proposal clearly goes against the principle |
| Concern | The proposal may go against the principle, but its wording is unclear |
| Cannot check | The proposal does not give the information needed to decide |
| Not applicable | The principle does not apply to this proposal, for example a rule about member-facing journeys for a staff-only tool |

Use **Cannot check** only when the principle clearly applies to the proposal and the information needed to judge it is missing. If nothing in the proposal suggests that the principle applies (for example, a rule about new suppliers when the proposal names no new supplier and uses only platforms the team already uses), the result is **Not applicable**. If it is genuinely uncertain whether the principle applies, use Not applicable and add a question for the proposer.

## Severity of each finding

| Severity | When it applies |
|---|---|
| High | The proposal breaches a Mandatory principle, or contradicts an Accepted ADR |
| Medium | The proposal breaches a Guidance principle; raises a concern against a Mandatory principle; misses an NFR target; or a Mandatory principle cannot be checked because information is missing |
| Low | A concern against a Guidance principle; a Guidance principle that cannot be checked; other missing information; ADR health issues; observations based on general good practice |

Principles with a result of Meets or Not applicable are not findings and have no severity.

When one problem breaks both a principle and an ADR, you may report it as one finding citing both, graded at the higher severity.

## Overall risk

The overall risk is the highest severity among all findings. With no findings, the overall risk is Low.

## Status

- **Draft: open questions remain** if any Mandatory principle has the result Cannot check.
- **Ready for architect review** otherwise.

## Recommendation

| Overall risk | Recommendation |
|---|---|
| High | Revise and resubmit |
| Medium | Proceed with conditions |
| Low | Proceed |

The recommendation is advice to the architect. It is never a decision. The architect may change the severity of any finding, with a reason, and may override the recommendation; both are recorded in the architect's decision section.
