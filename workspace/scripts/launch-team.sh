#!/usr/bin/env bash
# Start Claude Code in tmux so Agent Teams can show each teammate in its own
# pane. Run from any directory.
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

command -v claude >/dev/null || { echo "claude is not on PATH" >&2; exit 127; }
command -v tmux >/dev/null || { echo "tmux is required; install it and retry" >&2; exit 127; }

export CLAUDE_CODE_EXPERIMENTAL_AGENT_TEAMS=1

# Reuse the current tmux session when launched from inside tmux.
if [[ -n "${TMUX:-}" ]]; then
  exec claude --teammate-mode tmux
fi

SESSION="claude-team"
if tmux has-session -t "$SESSION" 2>/dev/null; then
  exec tmux attach-session -t "$SESSION"
fi

tmux new-session -d -s "$SESSION" -c "$ROOT" \
  "exec claude --teammate-mode tmux"
exec tmux attach-session -t "$SESSION"
