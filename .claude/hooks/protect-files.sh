#!/usr/bin/env bash
# PreToolUse hook: block edits to secrets and CI workflows.
# CI workflows are changed by Laura on purpose (she is learning CI/CD), so Claude must ask instead of editing them.
# Exit code 2 blocks the tool call and shows the message to Claude.

input="$(cat)"
file_path="$(printf '%s' "$input" | python3 -c 'import json,sys; print(json.load(sys.stdin).get("tool_input",{}).get("file_path",""))' 2>/dev/null)"

case "$file_path" in
  *.env|*.env.*|*/.env|*/.env.*)
    echo "Blocked: $file_path may contain secrets. Never edit .env files; ask Laura to set environment variables herself." >&2
    exit 2
    ;;
  */.github/workflows/*)
    echo "Blocked: $file_path is a CI workflow. Laura owns the CI/CD pipeline. Explain the change you would make and let her apply it." >&2
    exit 2
    ;;
esac

exit 0
