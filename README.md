# Backlog Pilot

**An AI-assisted backlog board.** Turn a one-line idea into a user story with acceptance criteria, estimate it and spot dependencies, with AI helping at every step.

> Status: early development. The project is built in public, one issue at a time.

## Why

Backlog refinement is where product and engineering meet, and where a lot of time goes into writing, splitting and estimating stories. Backlog Pilot explores how AI can take the busywork out of that process while the product owner stays in control.

## How this repo is built

Backlog Pilot is also an experiment in **AI-first development**. The project manages itself:

1. Ideas become user stories with the `/story` skill and are tracked as GitHub issues.
2. Claude Code implements each issue on its own branch, following the conventions in [`CLAUDE.md`](CLAUDE.md).
3. Two subagents review every change before a pull request is opened:
   - `code-reviewer` checks correctness, security, accessibility and conventions.
   - `product-owner` checks that every acceptance criterion is met.
4. Hooks enforce the rules automatically: secrets and CI workflows cannot be edited by the AI, code is formatted and linted after each edit, and types and tests must pass before a task is finished.

| Tool | Where | Purpose |
| --- | --- | --- |
| Skills | [`.claude/skills/`](.claude/skills) | `/story`, `/component`, `/pr` |
| Subagents | [`.claude/agents/`](.claude/agents) | `code-reviewer`, `product-owner` |
| Hooks | [`.claude/settings.json`](.claude/settings.json) | Protect files, format and lint, verify before finishing |
| Issue templates | [`.github/ISSUE_TEMPLATE/`](.github/ISSUE_TEMPLATE) | User stories and decisions |

## Tech stack

Next.js · React · TypeScript · CSS Modules · Jest · React Testing Library · Anthropic API

## Roadmap

See the [issues](../../issues) for what is planned and in progress.

## Author

Built by [Laura Moreaux](https://www.linkedin.com/in/laura-moreaux-cueto/), front-end developer with a product mindset.
