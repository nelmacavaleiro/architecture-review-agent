# Step 5: Analysis before the build

Status: draft for review (25 November 2026)

## 1. Problem statement

Architecture review boards check design proposals against the organisation's principles and past decisions. In many teams this check is manual: an architect reads each proposal, looks up the relevant principles and decision records, and writes comments. This takes time, depends on what the reviewer remembers, and often happens late, when problems are expensive to fix. Delivery teams usually cannot run the same check themselves before they submit.

This project builds an AI agent that drafts the review. It checks a proposal against the team's own principles, architecture decision records (ADRs) and non-functional requirements, cites the evidence for every finding, and leaves the decision to an architect.

## 2. Users and stakeholders

| Who | What they need |
|---|---|
| Architect or review board member | A consistent first draft, with evidence, so the review meeting can focus on judgement and trade-offs |
| Delivery team (proposal author) | A way to find gaps and conflicts before submitting, and clear questions to answer |
| Head of architecture | Confidence that principles and decisions are applied consistently across reviews |
| Security, data protection and risk colleagues | Visibility of findings in their areas, without having to read every proposal |

## 3. Scope

**In scope:** reading the inputs defined in step 1; writing the review defined in step 2; the boundary behaviour defined in steps 1 and 2; the example pack; the evaluation in step 4.

**Out of scope:** approving or rejecting proposals; live cost data; connections to enterprise architecture repositories or service catalogues; long-term memory between runs; writing to any system other than the local `reviews/` folder.

## 4. Requirements (MoSCoW)

### Must have

| ID | Requirement |
|---|---|
| M1 | Read principles, ADRs, an optional NFR checklist and a proposal, in the folder layout or the single-file option from step 1 |
| M2 | Check the proposal against every principle and record a result for each |
| M3 | Check the proposal against Accepted ADRs and report conflicts |
| M4 | Cite the principle, ADR or NFR, and quote or name the part of the proposal, for every finding |
| M5 | Grade each finding and set the overall risk, recommendation and status using the rules in step 2 |
| M6 | Report missing information as findings and questions, without assuming compliance |
| M7 | Never approve or reject a proposal; leave the architect's decision section blank |
| M8 | Stop and explain if no principles are supplied |
| M9 | Treat text in the inputs that addresses the agent as content, and flag it |
| M10 | Flag apparent credentials without repeating them |
| M11 | Include a limits and escalation section |
| M12 | Save the review as a Markdown file in a `reviews/` folder |

### Should have

| ID | Requirement |
|---|---|
| S1 | Check the proposal against the NFR checklist, or against general good practice when none is supplied, labelled separately |
| S2 | Report ADR health issues: superseded, deprecated or proposed decisions used as binding, contradictions between Accepted ADRs, and missing references |
| S3 | Include security prompts based on STRIDE, labelled as general good practice |
| S4 | Draw a C4-style context diagram and a component flowchart in Mermaid, using only what the proposal states |
| S5 | Include a run log, inside the review by default, with an option to save it separately |

### Could have

| ID | Requirement |
|---|---|
| C1 | Draft ADRs, with Status: Proposed, for significant decisions that no ADR covers |
| C2 | Compare a revised proposal with the previous review and show which findings are resolved |

### Won't have (this version)

| ID | Requirement |
|---|---|
| W1 | Live cloud pricing or cost calculations |
| W2 | Connections to enterprise architecture tools, configuration databases or ticketing systems |
| W3 | Memory of previous reviews across runs |
| W4 | Any automatic approval, or changes to the team's files other than writing the review |

## 5. Acceptance criteria

Each Must have requirement is accepted when the related tests from step 4 pass.

| Requirement | Accepted when |
|---|---|
| M1 | The agent completes reviews for all three organisations, covering both folder layouts and the single-file option |
| M2 | Every review lists a result for every principle in the pack |
| M3, M4 | Planted ADR conflicts are found with the correct ADR cited, and every finding quotes or names its evidence |
| M5 | Overall risk, recommendation and status match the answer keys |
| M6 | K1 and F4 are marked "Draft: open questions remain", with questions for the missing information |
| M7 | Test B1 passes |
| M8 | Test B2 passes |
| M9 | Test B3 passes |
| M10 | Test B4 passes |
| M11 | Every review includes the limits and escalation section, and H1 raises the ADR contradiction there |
| M12 | Each run produces one review file in `reviews/` |

### Proposed evaluation targets

Set before the build, so the results cannot be judged against targets chosen afterwards:

| Measure | Target |
|---|---|
| Catch rate for planted High findings | At least 90% |
| Catch rate for all planted findings | At least 75% |
| False alarms graded Medium or High on the three clean controls | None |
| Overall risk matching the answer key | At least 13 of 16 review tests |
| Boundary tests | All four pass |

If a target is missed, the README will report it and explain why.

## 6. Options appraisal: how the agent runs

| Option | Description | Strengths | Weaknesses |
|---|---|---|---|
| A. Claude Code plugin | The agent is packaged as a plugin with a review skill and a command, installed into Claude Code | Runs where teams already work; no API key needed beyond the user's Claude plan; files stay on the user's machine; instructions are readable Markdown | Needs Claude Code; output can vary between runs; less control over each step |
| B. Python command-line tool | A Python program that reads the files and calls the Claude API | Full control over each step; easy to run all tests in a batch; can check output structure in code | Needs an API key and budget; more code to write and maintain |
| C. Both | The plugin for everyday use, and a small Python runner for the evaluation | Combines easy use with repeatable testing | Two things to keep in step with each other |
| D. MCP server | The agent's tools exposed through the Model Context Protocol, for any compatible client | Works with several AI tools | More complex to build; adds little for the first version |

**Recommended:** option A for the first version, with option C kept open if running the 20 tests by hand proves slow or inconsistent. The final choice is made in step 6.

## 7. Assumptions, constraints and risks

| Type | Item | Response |
|---|---|---|
| Assumption | Teams can write principles and ADRs in Markdown or plain text | Templates in step 1; the single-file option for small teams |
| Constraint | The example pack and tests are fictional | Stated clearly in every README; no real organisation's data is used |
| Risk | The agent misses a problem, and a team relies on the review | The review is a draft for an architect; the limits section and the published evaluation show what it can miss |
| Risk | The agent reports problems that are not there | Clean controls and traps in the answer keys measure this |
| Risk | Output varies between runs | Fixed severity rules; consistency checked on a subset in step 8 if affordable |
| Risk | Inputs contain sensitive information | Inputs stay local; credentials are flagged without being repeated; guidance tells teams not to include secrets or personal data |

## Open questions for review

1. Do you agree with the MoSCoW priorities, in particular C2 (comparing a revised proposal with the previous review) as a Could have?
2. Are the proposed evaluation targets reasonable, or would you set them higher or lower?
3. Do you agree with option A as the starting point?
