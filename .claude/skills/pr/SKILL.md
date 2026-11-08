---
name: pr
description: Prepare a pull request for the current branch - Conventional Commit message, PR title and description linked to its issue. Use when the user asks to open, prepare or describe a PR, or types /pr.
---

# Prepare a pull request

1. Run `git status` and `git diff main...HEAD` to understand the change. If there are uncommitted changes, ask whether to commit them first.
2. Find the linked issue number (from the branch name, the commits or by asking). Every PR must close an issue.
3. Check the Definition of Done in `CLAUDE.md`. Run `npm run lint`, `npm run typecheck` and `npm test`; if anything fails, stop and report it instead of opening the PR.
4. Write:
   - **Commit message / PR title** in Conventional Commits format: `<type>(<optional scope>): <summary in imperative, under 72 characters>`.
   - **PR description** using this template:

```markdown
## What
<one or two sentences>

## Why
<the user or business reason, from the issue>

## How
- <key implementation points>

## Testing
- <what was tested and how>

## Screenshots
<if the UI changed>

Closes #<issue>
```

5. Ask the user to confirm before pushing the branch or opening the PR.
