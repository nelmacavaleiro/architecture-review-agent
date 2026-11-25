# Answer key changes

The answer keys were written before the agent was built. They are corrected only when a key plainly contradicts the organisation's own architecture files. A key is never changed because the agent's different reading is merely arguable; those cases stay counted as false alarms or misses. Every correction is listed here and reported in the README.

| Date | Test | Change | Reason | How it was found |
|---|---|---|---|---|
| 25 November 2026 | K5 (and B3, which reuses K5) | Added an expected conflict with ADR-0003, graded High. Expected overall risk changed from Medium to High, and recommendation from Proceed with conditions to Revise and resubmit | ADR-0003's context names systems connecting directly to each other's databases as the problem the decision solved. Under the severity rules, contradicting an Accepted ADR is High. The original key missed this | Pilot run of K5 on 25 November 2026 |

Not changed after the same pilot run, and still counted as false alarms: the agent's KM-P01 "cannot check" (supplier data location) and its KM-P02 concern (load on the core savings database).
