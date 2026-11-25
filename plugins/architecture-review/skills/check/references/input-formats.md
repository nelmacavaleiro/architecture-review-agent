# Input formats

The agent reads three or four inputs. The full specification is in the repository's `docs/01-input-format.md`; this file is the summary the agent works from.

| Input | Required |
|---|---|
| Architecture principles | Yes |
| Architecture decision records (ADRs) | Recommended |
| NFR checklist | Optional |
| Design proposal | Yes |

## Where to look

If the user names an architecture folder or file, look only there. Otherwise, starting from the current folder, accept any of these layouts:

**Folder layout**

```
architecture/
  principles.md            all principles in one file
  principles/              or one file per principle
  decisions/               one ADR per file
  nfr-checklist.md         optional
```

**Single-file layout**

```
architecture.md            with the headings "# Principles", "# Decisions" (optional) and "# NFR checklist" (optional), in any order
```

If the user names a folder that contains one of these layouts (for example `examples/kestrel-mutual`), look inside it in the same way.

## How to read principles

Each principle has an identifier and a title, usually as a heading (`## KM-P01 Member data stays in the UK`), followed by fields:

| Field | Meaning |
|---|---|
| Type | Mandatory or Guidance. If missing, treat as Guidance and say so in the review |
| Statement | The rule the proposal is checked against |
| Rationale | Why it matters |
| Implications | What to look for in the proposal |
| Exceptions | Who can approve a departure, or "None" |

Only the identifier and the statement are required.

## How to read ADRs

Each ADR has an identifier and a title (`# ADR-0007 ...` or `## ADR-007 ...`), and usually these fields: Status, Date, Context, Decision, Consequences, Supersedes. Some teams add others, such as "Superseded by". Read any extra field sensibly; do not treat it as an error.

| Status | How to treat it |
|---|---|
| Accepted | Binds the proposal |
| Proposed | Context only; does not bind the proposal |
| Superseded | Does not bind; point to the ADR that replaced it |
| Deprecated | Does not bind; say if no replacement exists |

Teams number ADRs differently (`ADR-0007`, `ADR-007`, `0007-...md`). Always cite the identifier exactly as the team writes it.

## How to read the NFR checklist

Each requirement has an identifier and title, plus "Applies to" and "Target". Only the identifier and the target are required.

## How to read the proposal

Proposals usually follow this structure, but any section may be missing or named differently. Review what is there, and treat missing sections as missing information rather than guessing.

Problem and business need; Scope; Proposed design; Data; Integrations; Security and access; Non-functional needs; Options considered; Costs; Risks and open questions; Delivery plan.
