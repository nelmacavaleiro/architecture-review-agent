# Answer key changes

The answer keys were written before the agent was built. They are corrected only when a key plainly contradicts the organisation's own architecture files. A key is never changed because the agent's different reading is merely arguable; those cases stay counted as false alarms or misses. Every correction is listed here and reported in the README.

| Date | Test | Change | Reason | How it was found |
|---|---|---|---|---|
| 25 November 2026 | K5 (and B3, which reuses K5) | Added an expected conflict with ADR-0003, graded High. Expected overall risk changed from Medium to High, and recommendation from Proceed with conditions to Revise and resubmit | ADR-0003's context names systems connecting directly to each other's databases as the problem the decision solved. Under the severity rules, contradicting an Accepted ADR is High. The original key missed this | Pilot run of K5 on 25 November 2026 |
| 25 November 2026 | K2 | Added an expected NFR-06 (audit retention) finding, graded Medium. The expected overall result is unchanged | Kestrel's NFR-06 applies to systems that change member balances and requires audit records in the central audit store. The K2 proposal keeps them in the tool's own database. The original key missed this | Full run, batch 1, on 25 November 2026 |

Not changed after the K5 pilot run, and still counted as false alarms: the agent's KM-P01 "cannot check" (supplier data location) and its KM-P02 concern (load on the core savings database).

Not changed after batch 1 of the full run, and still counted as a false alarm: the agent's KM-P02 concern in K2.
