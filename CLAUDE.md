# Backlog Pilot

An AI-assisted backlog board: write user stories, estimate them and spot dependencies, with AI helping at every step.
This repo is also a showcase of an AI-first development workflow built with Claude Code (skills, subagents, hooks, GitHub Actions).

## Working agreement

- Everything technical is written in English: code, comments, commits, PR descriptions, issues, docs.
- The product owner is Laura. Do not make product or architecture decisions on your own: propose options with trade-offs and wait for her approval.
- Work from GitHub issues. Every change must be linked to an issue (`Closes #123` in the PR description).
- Keep pull requests small: one issue per PR.

## Stack

- Next.js (App Router) + React + TypeScript (strict mode)
- Styling: CSS Modules (no UI library unless an issue decides otherwise)
- Testing: Jest + React Testing Library
- Package manager: npm
- No backend yet: board data lives in `localStorage`. AI features call the Anthropic API from server-side route handlers only.

> The app has not been scaffolded yet. See the issue "Scaffold the Next.js app". Until then, the commands below do not exist.

## Commands

- `npm run dev` — start the dev server
- `npm run lint` — ESLint
- `npm run typecheck` — `tsc --noEmit`
- `npm test` — Jest
- `npm run build` — production build

## Conventions

- Components: one folder per component under `src/components/<ComponentName>/` with `ComponentName.tsx`, `ComponentName.module.css` and `ComponentName.test.tsx`.
- Accessibility is part of done: semantic HTML first, keyboard support, visible focus, labelled controls.
- Responsive first: design for mobile, enhance for larger screens.
- Never put secrets in code. API keys come from environment variables (`ANTHROPIC_API_KEY`) and are only read on the server.
- Commits follow Conventional Commits (`feat:`, `fix:`, `chore:`, `docs:`, `test:`, `refactor:`, `ci:`).

## Definition of Done

1. Acceptance criteria of the linked issue are met.
2. Tests cover the new behaviour; `npm test`, `npm run typecheck` and `npm run lint` pass.
3. Accessible and responsive.
4. PR description explains what and why, and links the issue.
5. Reviewed by the `code-reviewer` and `product-owner` subagents.

## AI tooling in this repo

- Skills (`.claude/skills/`): `/story`, `/component`, `/pr`
- Subagents (`.claude/agents/`): `code-reviewer`, `product-owner`
- Hooks (`.claude/settings.json`): protect `.env*` and CI workflows from edits, format and lint after edits, run checks before finishing
