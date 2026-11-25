# Review template

Use this structure exactly, with every section in this order and these headings. Replace everything in angle brackets. Where a section has nothing to report, keep the heading and write one line saying so (for example "No ADR health issues found.").

````markdown
# Architecture review: <proposal title>

Proposal: <path to the proposal file>
Architecture inputs: <path to the principles, ADRs and NFR checklist used>
Reviewed: <date, if known; otherwise "Date not available">
Status: <Ready for architect review | Draft: open questions remain>
Overall risk: <High | Medium | Low>
Recommendation: <Revise and resubmit | Proceed with conditions | Proceed>

This is a draft for an architect. It does not approve or reject the proposal.

Findings: <n> High, <n> Medium, <n> Low

## 2. Summary

<Three to five sentences: what the proposal is, the most serious findings, and what the proposer needs to do next.>

## 3. Check against principles

| Principle | Type | Result | Severity | Evidence from the proposal | Why it matters |
|---|---|---|---|---|---|
| <ID and title> | <Mandatory or Guidance> | <Meets, Breach, Concern, Cannot check or Not applicable> | <High, Medium, Low, or blank> | <Section name: "short quotation", or "Section missing"> | <One sentence> |

<One row for every principle, including those that are met.>

## 4. Check against decisions (ADRs)

**Conflicts with Accepted ADRs**

| ADR | Severity | Evidence from the proposal | Why it matters |
|---|---|---|---|

**Significant decisions not covered by an ADR**

- <Decision, and where it appears in the proposal>

## 5. ADR health

| Issue | ADRs involved | Severity | Detail |
|---|---|---|---|

## 6. Check against non-functional requirements

<If an NFR checklist was supplied:>

| NFR | Target | What the proposal states | Result | Severity |
|---|---|---|---|---|

<If not: "No NFR checklist was supplied. Non-functional observations are in section 9, as general good practice.">

## 7. Missing information

| Missing information | Checks it prevented | Severity |
|---|---|---|

## 8. Questions for the proposer

1. <Question> (relates to <finding or principle ID>)

## 9. General good practice (not based on your principles)

These observations come from general frameworks, not from your team's own rules. All are graded Low.

**Well-Architected observations**

- <Pillar>: <observation, with evidence>

**Security prompts (STRIDE)**

- <Data flow>: <question>

## 10. Diagrams of the proposal

Drawn only from what the proposal states. Anything unclear is labelled, not filled in.

**Context**

```mermaid
C4Context
  title System context: <proposal title>
  <Person, System, System_Ext and Rel lines>
```

**Components**

```mermaid
flowchart LR
  <components and connections>
```

## 11. Draft ADRs

### <ADR identifier and title>

Status: Proposed
<The team's other ADR fields, such as Date, Context, Decision and Consequences>

<One sub-heading like this for each draft, or "No draft ADRs needed.">

## 12. Limits and escalation

- **Checks not completed:** <what could not be checked, and why>
- **Conflicts between principles or decisions:** <any, for the architect to resolve>
- **Needs human judgement:** <risks to accept, exceptions to approve, and who can approve them>
- **Outside this review's scope:** costs, contracts, legal advice and anything else not covered by the inputs

## 13. Architect's decision

Decision: Approved / Approved with conditions / Revise and resubmit / Rejected
Severity changes (finding, from, to, reason):
Recommendation overridden (yes or no, reason):
Conditions:
Exceptions granted (principle, approver):
Architect:
Date:

## 14. Run log

- Files read: <list of every file read>
- Principles loaded: <n>; ADRs loaded: <n> (<n> Accepted); NFRs loaded: <n, or "none supplied">
- Proposal sections found: <list>; missing: <list>
- Principles, ADRs and NFRs cited in this review: <list of identifiers>
````

## Notes on the template

- The header block at the top is section 1.
- Draft ADRs in section 11 always use level-three headings (`###`), never `#` or `##`, so they stay inside the review's structure.
- Section 13 is always left exactly as shown, for the architect to complete.
- If the run log is saved separately, replace section 14's content with a link to the run log file.
- Count findings once each, by severity, for the "Findings" line. Principles with a result of Meets or Not applicable are not findings.
