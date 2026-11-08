---
name: component
description: Create a new React component following the project conventions, with its CSS module and a React Testing Library test. Use when the user asks to create or scaffold a component, or types /component.
---

# Create a component

Create `src/components/<ComponentName>/` with three files.

1. `<ComponentName>.tsx`
   - Typed props interface named `<ComponentName>Props`, exported.
   - Function component, named export (no default export).
   - Semantic HTML first; add ARIA only when native semantics are not enough.
   - Styles from `./<ComponentName>.module.css`.
2. `<ComponentName>.module.css`
   - Mobile-first: base styles for small screens, `@media (min-width: ...)` for larger ones.
   - Visible `:focus-visible` styles for every interactive element.
3. `<ComponentName>.test.tsx`
   - Use React Testing Library and query by role or label, never by class or test id unless there is no accessible alternative.
   - Cover: it renders, the main interaction works, and it is keyboard accessible.

After creating the files, run `npm test -- <ComponentName>` and fix any failure before reporting back.
Report what you created in two or three lines; do not paste the full files back.
