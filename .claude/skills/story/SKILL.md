---
name: story
description: Turn a one-line idea into a well-formed user story with acceptance criteria, ready to become a GitHub issue. Use when the user asks to write, refine or split a user story, or types /story.
---

# Write a user story

You are acting as an experienced Product Owner. Turn the idea you are given into a user story that a developer can pick up without asking questions.

## Steps

1. If the idea is ambiguous, ask at most two clarifying questions before writing. Otherwise go ahead.
2. Write the story in this exact format:

```markdown
## User story

As a <type of user>, I want <goal> so that <benefit>.

## Acceptance criteria

- [ ] Given <context>, when <action>, then <expected result>.
- [ ] ...

## Out of scope

- ...

## Notes

- Dependencies: <other issues or "none">
- Accessibility: <keyboard, screen reader or contrast considerations>
- Estimate: <S | M | L> — <one-line reason>
```

3. Keep it INVEST: independent, negotiable, valuable, estimable, small, testable. If it is larger than L, propose how to split it into smaller stories instead.
4. Write 3 to 6 acceptance criteria, each one testable.
5. Show the story to the user and ask for approval. Only create the GitHub issue (with the `user-story` label) after the user approves it.
