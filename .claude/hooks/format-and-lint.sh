#!/usr/bin/env bash
# PostToolUse hook: format and lint the file Claude just edited.
# Does nothing until the app is scaffolded (no node_modules yet).
# Exit code 2 sends lint errors back to Claude so it fixes them right away.

cd "$CLAUDE_PROJECT_DIR" || exit 0
[ -d node_modules ] || exit 0

input="$(cat)"
file_path="$(printf '%s' "$input" | python3 -c 'import json,sys; print(json.load(sys.stdin).get("tool_input",{}).get("file_path",""))' 2>/dev/null)"

case "$file_path" in
  *.ts|*.tsx|*.js|*.jsx|*.css|*.json|*.md) ;;
  *) exit 0 ;;
esac

[ -x node_modules/.bin/prettier ] && node_modules/.bin/prettier --write "$file_path" >/dev/null 2>&1

case "$file_path" in
  *.ts|*.tsx|*.js|*.jsx)
    if [ -x node_modules/.bin/eslint ]; then
      if ! output="$(node_modules/.bin/eslint "$file_path" 2>&1)"; then
        echo "ESLint found problems in $file_path:" >&2
        echo "$output" >&2
        exit 2
      fi
    fi
    ;;
esac

exit 0
