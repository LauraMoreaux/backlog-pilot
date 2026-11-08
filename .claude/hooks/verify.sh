#!/usr/bin/env bash
# Stop hook: before Claude finishes, make sure types and tests pass.
# Does nothing until the app is scaffolded.
# Exit code 2 tells Claude to keep working and fix the failures.

input="$(cat)"

# Avoid an endless loop: if Claude is already continuing because of this hook, let it stop.
active="$(printf '%s' "$input" | python3 -c 'import json,sys; print(json.load(sys.stdin).get("stop_hook_active", False))' 2>/dev/null)"
[ "$active" = "True" ] && exit 0

cd "$CLAUDE_PROJECT_DIR" || exit 0
[ -f package.json ] && [ -d node_modules ] || exit 0

# Only check when something changed in this working tree.
git diff --quiet HEAD -- 2>/dev/null && [ -z "$(git ls-files --others --exclude-standard)" ] && exit 0

if ! out="$(npm run --silent typecheck 2>&1)"; then
  echo "Type check failed. Fix these errors before finishing:" >&2
  echo "$out" | tail -40 >&2
  exit 2
fi

if ! out="$(npm test --silent -- --watchAll=false 2>&1)"; then
  echo "Tests failed. Fix them before finishing:" >&2
  echo "$out" | tail -60 >&2
  exit 2
fi

exit 0
