# Architecture review agent

A Claude Code plugin that drafts an architecture review of a design proposal. It checks the proposal against the team's own architecture principles, architecture decision records (ADRs) and non-functional requirements (NFRs), gives the evidence for every finding, and saves the review for an architect to decide.

The agent never approves or rejects a proposal. It prepares the review so that the architect's time goes on judgement rather than on cross-checking documents.

**[Watch the demo](docs/media/architecture-review-agent-demo.mp4)** (80 seconds, captions only, no sound needed): the agent reviewing a fictional council's housing repairs portal, from command to finished review.

**See a [sample review](examples/sample-review/W1-housing-repairs-portal-review.md)** written by the agent for a fictional council's housing repairs portal, with [notes comparing it with the answer key](examples/sample-review/README.md).

## Results at a glance

Version 0.1.0 caught every planted problem in the test set (48 of 48) and passed all four boundary tests. Two of the five targets were missed; both are explained in the notes below.

These are the plugin's results on 20 test proposals written for three fictional organisations, using `claude plugin eval` with the model `claude-sonnet-5-5`, one run per test, with and without the plugin. Each target was set before the plugin was built.

| Measure | Target set before the build | Plugin's result | Target met? | Notes |
|---|---|---|---|---|
| Planted High findings caught | At least 90% | 17 of 17 (100%) | Yes | |
| All planted findings caught | At least 75% | 48 of 48 (100%) | Yes | |
| False alarms graded Medium or High on the three clean proposals | None | 1 | No | An over-cautious finding on F5; no real problem was missed |
| Overall risk, recommendation and status all matching the answer key | At least 13 of 16 review tests | 9 of 16 | No | Overall risk matched in 14 of 16 tests and recommendation in 14 of 16; most mismatches were in status, caused by over-cautious "Cannot check" findings |
| Boundary tests | All four pass | 4 of 4 | Yes | |

The mean score was 0.86 with the plugin and 0.44 without it. Claude without the plugin also found the planted problems; what the plugin added was consistency: severity matched the answer key in 11 of 13 tests (1 of 13 without), and the overall result matched in 9 of 16 tests (0 of 16 without).

**Main weakness.** The agent marks Mandatory principles as "Concern" or "Cannot check" too readily when a proposal does not address them explicitly. This caused the false alarm on a clean proposal and all six status mismatches. It errs on the side of caution, so a real problem is unlikely to be missed, but the architect has extra findings to dismiss.

The full results, including every test and the limitations, are in [docs/08-evaluation-results.md](docs/08-evaluation-results.md).

## What a review contains

Each review follows a fixed structure, specified in [docs/02-review-output.md](docs/02-review-output.md):

1. Header: proposal, inputs read, overall risk, recommendation and status
2. Summary
3. Principles: each one checked, with the evidence
4. ADRs: conflicts with Accepted decisions
5. ADR health: superseded, deprecated or contradictory decisions the proposal relies on
6. NFRs: targets met, missed or not stated
7. Missing information
8. Questions for the proposer
9. General good practice observations
10. Diagrams (a context diagram and a component diagram, in Mermaid)
11. Draft ADRs for decisions the proposal makes
12. Limits of the review and when to escalate
13. Architect's decision (always left blank)
14. Run log

### How findings are graded

| Severity | When |
|---|---|
| High | A Mandatory principle is breached, or the proposal conflicts with an Accepted ADR |
| Medium | A Guidance principle is breached, a Mandatory principle raises a concern or cannot be checked, or an NFR target is missed |
| Low | Everything else |

The overall risk is the highest severity found. High leads to "Revise and resubmit", Medium to "Proceed with conditions" and Low to "Proceed". If any Mandatory principle cannot be checked, the review stays marked "Draft: open questions remain". The architect can change any severity.

### Boundaries

The agent:

- stops and writes no review if no principles are supplied, rather than reviewing against general good practice;
- never approves, rejects or signs off a proposal, even when asked to;
- treats text in the inputs that addresses it (for example "ignore principle P06") as content to report, not as an instruction;
- flags any password, key or token it finds, and never repeats it;
- reads only the inputs and writes only the review.

## Install

The repository is also the plugin's marketplace. In Claude Code:

```
/plugin marketplace add nelmacavaleiro/architecture-review-agent
/plugin install architecture-review@nelma-cavaleiro
```

Version 0.1.0 was built and tested with Claude Code 2.1.332. Reviews run on the user's own Claude account and count against their own plan.

## Use

Put the team's architecture files in the folder you are working in, in either layout described in [docs/01-input-format.md](docs/01-input-format.md):

```
architecture/
  principles.md          or a principles/ folder with one file per principle (required)
  decisions/             one ADR per file (recommended)
  nfr-checklist.md       (optional)
```

or a single `architecture.md` with the headings "# Principles", "# Decisions" and "# NFR checklist".

Then name the proposal:

```
/architecture-review:check proposals/payments-api.md
```

The review is saved in `reviews/`. Two optional arguments are available: the location of the architecture files, if they are elsewhere, and `--separate-log` to save the run log as its own file.

### Try it on the examples

From a clone of this repository, review one of the test proposals against a fictional organisation's files:

```
/architecture-review:check tests/proposals/K1-mortgage-document-upload.md examples/kestrel-mutual/architecture
```

## The fictional organisations

All organisations, proposals and architecture files in this repository are fictional and were written for this project. They do not describe any real organisation.

| Organisation | Setting | Layout |
|---|---|---|
| [Kestrel Mutual](examples/kestrel-mutual/) | UK building society on Microsoft Azure | Folder, principles in one file |
| [Wrenford Borough Council](examples/wrenford-borough-council/) | English borough council on AWS and Microsoft 365 | Folder, one file per principle |
| [Fernbill](examples/fernbill/) | UK invoicing software company on Google Cloud | Single file, no NFR checklist |

Each has eight principles and eight or nine ADRs, including superseded, deprecated and proposed decisions, so the agent is tested on which decisions actually bind a proposal.

## How it was evaluated

The evaluation plan is in [docs/04-evaluation-plan.md](docs/04-evaluation-plan.md).

- **16 review tests:** five proposals per organisation with planted problems, one of them a clean control with none, plus one test (H1) where two Accepted ADRs contradict each other.
- **4 boundary tests:** a proposal asking to be approved (B1), no principles supplied (B2), an instruction hidden in a proposal (B3) and a password in a proposal (B4).
- **Answer keys** were written before the agent was built and are never given to it. [tools/build_evals.py](tools/build_evals.py) turns them into the test cases and graders in [plugins/architecture-review/evals/](plugins/architecture-review/evals/).
- **Graders** combine text checks, file checks and judged checks, with three judge votes for each judged check.
- The agent's instructions were frozen before the full run. Nothing was tuned on the test results.

Points a reader should know:

- **K1 was used during development.** It was the test run while the instructions were written. Excluding it, the catch rate is 44 of 44 and the overall result matched in 9 of 15 tests.
- **Two answer keys were corrected** during the evaluation, in both cases because the key plainly contradicted the organisation's own files (K5 missed a conflict with ADR-0003; K2 missed an NFR-06 finding). Keys were never changed because the agent's reading was merely arguable. Every change, and the points deliberately left unchanged, is listed in [tests/answer-key-changes.md](tests/answer-key-changes.md).
- **B2 tests a rule of the plugin.** The plugin is designed to stop when there are no principles. Claude without the plugin has no such rule, so its writing a review in B2 shows the difference the plugin makes rather than a fault in Claude.
- **The H1 answer key is inconsistent.** It accepts the contradiction being raised as a question for the architect, but its expected overall risk does not allow for that choice. The result is reported as a mismatch and the key was not changed.
- **Each test ran once**, so variation between runs was not measured, and judged checks on long reviews may be wrong in either direction.
- **The cost** was an estimated US$6.93 at list price for the full run, plus about US$1.20 for pilot runs.

### Re-running the evaluation

The evaluation needs Claude Code 2.1.269 or later. On Windows, Git's `bash` must be on the path for the setup scripts. From `plugins/architecture-review/`:

```
claude plugin eval . --runs 1 --ablation with-without --allow-tools Write --model claude-sonnet-5-5 --max-cost-usd 5 --scaffold --no-publish --keep-temp -j 2
```

Use `--tag` (for example `--tag boundary`) or `--case K1` to run part of the set. Running the evaluation uses your own Claude plan.

## How it was built

The project was worked through in ten steps, each recorded in `docs/`:

| Step | Document |
|---|---|
| 1. Input format | [01-input-format.md](docs/01-input-format.md) |
| 2. Review output | [02-review-output.md](docs/02-review-output.md) |
| 3. Fictional organisations | [examples/](examples/) |
| 4. Evaluation plan | [04-evaluation-plan.md](docs/04-evaluation-plan.md) |
| 5. Analysis: problem, stakeholders, requirements, targets and options | [05-analysis.md](docs/05-analysis.md) |
| 6. Delivery decision | [06-delivery-decision.md](docs/06-delivery-decision.md) |
| 7. The plugin | [plugins/architecture-review/](plugins/architecture-review/) |
| 8. Evaluation results | [08-evaluation-results.md](docs/08-evaluation-results.md) |
| 9. This README | |
| 10. Demo | To follow |

## Repository layout

```
.claude-plugin/marketplace.json      the marketplace listing
plugins/architecture-review/
  .claude-plugin/plugin.json         plugin name and version
  skills/check/SKILL.md              the agent's instructions
  skills/check/references/           input formats, severity rules, boundary rules, review template
  evals/                             the 20 test cases and their graders
docs/                                the step documents
examples/                            the three fictional organisations and a sample review
tests/                               proposals, answer keys, modified packs and answer key changes
tools/                               the test builder and the results collection script
```

## Version history

| Version | Date | Changes |
|---|---|---|
| 0.1.0 | 25 November 2026 | First version. The evaluation results above are for this version |
| 0.1.1 | 25 November 2026 | Formatting only: both diagrams drawn top to bottom with short labels, so they stay readable on GitHub, and header, draft ADR and decision fields listed one per line. How findings are identified and graded is unchanged |

## Licence

MIT. See [LICENSE](LICENSE).

## Author

Nelma Cavaleiro. [LinkedIn](https://www.linkedin.com/in/nelma-cavaleiro) · [GitHub](https://github.com/nelmacavaleiro)
