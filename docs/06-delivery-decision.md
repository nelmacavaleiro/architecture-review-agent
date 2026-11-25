# Step 6: How the agent runs

Status: draft for review (25 November 2026)

## Decision

The agent is delivered as a **Claude Code plugin**, installed from this repository, which also acts as the plugin's marketplace. The evaluation uses Claude Code's own plugin evaluation command, `claude plugin eval`, so a separate Python runner (option C in step 5) is not needed.

This follows the recommendation in [05-analysis.md](05-analysis.md), checked against Anthropic's Claude Code documentation on plugins, marketplaces and plugin evaluations, read on 25 November 2026.

## Why

| Need | How the plugin meets it |
|---|---|
| Teams can use it where they already work | Runs in Claude Code in the terminal, VS Code or the desktop app |
| Inputs stay under the team's control | Reads local files only; no connectors or external services |
| Easy to install and update | Users add this repository as a marketplace once and install the plugin by name |
| Instructions are open to inspection | The agent's instructions are readable Markdown in the repository |
| Repeatable evaluation | `claude plugin eval` runs each test case in a fresh, isolated session and grades the result |

## Repository layout

The repository root is a marketplace, with the plugin in its own folder. The documents, examples and tests from steps 1 to 5 stay where they are.

```
architecture-review-agent/
  .claude-plugin/
    marketplace.json                 lists the plugin
  plugins/
    architecture-review/
      .claude-plugin/
        plugin.json                  the plugin's name, description and version
      skills/
        review/
          SKILL.md                   the agent's instructions
          references/                supporting files the skill reads, such as the review template and severity rules
  docs/                              steps 1 to 6, and later the results
  examples/                          the three fictional organisations
  tests/                             proposals, answer keys and test packs
  README.md
```

The exact files inside `skills/review/` are designed in step 7.

## How a team uses it

1. Add the marketplace and install the plugin (once):

   ```
   /plugin marketplace add nelmacavaleiro/architecture-review-agent
   /plugin install architecture-review@<marketplace name>
   ```

2. In a folder that holds their architecture files and proposals, run the review skill and name the proposal:

   ```
   /architecture-review:review proposals/2026-11-payments-api.md
   ```

3. The review is written to `reviews/`.

Others can only install the plugin once the repository is public.

## How the evaluation runs

| Item | Approach |
|---|---|
| Tool | `claude plugin eval`, which needs Claude Code v2.1.269 or later and Git 2.31 or later if Git is installed |
| Test cases | One case for each of the 20 tests in step 4, each giving the agent one pack and one proposal to read |
| Graders | A check that a review file was created; one judged check for each expected finding in the answer key; text checks for the boundary tests, such as the absence of the B4 password or of approval wording in B1 |
| Runs | One run per case, as agreed in step 4 (`--runs 1`) |
| Model | The model used is fixed for the whole evaluation and recorded with the results |
| Tools allowed | Reading files, plus writing the review. Shell commands are not allowed, which keeps every run within Claude Code's restrictions and works on Windows |
| Cost | Every run and every judged check uses the account's Claude plan allowance. The command reports an estimated cost, which will be recorded with the results |

The scoring measures from step 4 (catch rate, severity agreement, false alarms and boundary tests) are calculated from the graders' results and the review files, and published in the README.

## Open questions for review

1. **Names:** are you happy with `architecture-review` for the plugin and `review` for the skill, so the command is `/architecture-review:review`?
2. **Baseline comparison:** `claude plugin eval` can also run each case without the plugin, to show how much the plugin improves on Claude alone. This would make a strong point in the README, but it doubles the number of runs. Include it?
3. **Making the repository public:** should it stay private until the evaluation results are published (step 8), or become public sooner?
