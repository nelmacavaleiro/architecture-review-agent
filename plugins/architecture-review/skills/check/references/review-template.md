# Review template

Use this structure exactly, with every section in this order and these headings. Replace everything in angle brackets. Where a section has nothing to report, keep the heading and write one line saying so (for example "No ADR health issues found.").

````markdown
# Architecture review: <proposal title>

- **Proposal:** <path to the proposal file>
- **Architecture inputs:** <path to the principles, ADRs and NFR checklist used>
- **Reviewed:** <date, if known; otherwise "Date not available">
- **Status:** <Ready for architect review | Draft: open questions remain>
- **Overall risk:** <High | Medium | Low>
- **Recommendation:** <Revise and resubmit | Proceed with conditions | Proceed>
- **Findings:** <n> High, <n> Medium, <n> Low

This is a draft for an architect. It does not approve or reject the proposal.

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
flowchart TB
  subgraph people [People]
    <one node per person or role, for example: tenant(["Tenant"])>
  end
  system["<proposed system name>"]
  subgraph external [External systems]
    <one node per external system, for example: notify["GOV.UK Notify"]>
  end
  <connections, for example: tenant -->|"reports repairs"| system>
  classDef person fill:#08427b,color:#ffffff,stroke:#052e56
  classDef proposed fill:#1168bd,color:#ffffff,stroke:#0b4884
  classDef ext fill:#999999,color:#ffffff,stroke:#6b6b6b
  class <person node ids> person
  class system proposed
  class <external node ids> ext
```

- <Notes: any detail too long for a label, and anything the proposal leaves unclear>

**Components**

```mermaid
flowchart TB
  <entry points, such as users or incoming feeds, at the top>
  subgraph <group id> [<group name, for example the hosting platform>]
    <components inside the proposed system>
  end
  <external systems at the bottom>
  <connections>
```

- <Notes: product names, hosting details and anything unclear that did not fit in the labels>

## 11. Draft ADRs

### <ADR identifier and title>

- **Status:** Proposed
- **<Each of the team's other ADR fields, such as Date, Context, Decision and Consequences, one per list item>:** <content>

<One sub-heading like this for each draft, or "No draft ADRs needed.">

## 12. Limits and escalation

- **Checks not completed:** <what could not be checked, and why>
- **Conflicts between principles or decisions:** <any, for the architect to resolve>
- **Needs human judgement:** <risks to accept, exceptions to approve, and who can approve them>
- **Outside this review's scope:** costs, contracts, legal advice and anything else not covered by the inputs

## 13. Architect's decision

- **Decision:** Approved / Approved with conditions / Revise and resubmit / Rejected
- **Severity changes (finding, from, to, reason):**
- **Recommendation overridden (yes or no, reason):**
- **Conditions:**
- **Exceptions granted (principle, approver):**
- **Architect:**
- **Date:**

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
- Fields in the header, the draft ADRs and section 13 are always written as list items, one per line, so they do not run together when the review is displayed.
- Diagrams are always `flowchart TB`, never `C4Context` or `flowchart LR`, because those layouts overlap labels or shrink too far to read on GitHub. Keep box labels to about five words and connection labels to about three; put longer detail in the notes under the diagram. Wrap any label containing brackets, commas or other punctuation in double quotes.
- If the run log is saved separately, replace section 14's content with a link to the run log file.
- Count findings once each, by severity, for the "Findings" line. Principles with a result of Meets or Not applicable are not findings.
