#!/usr/bin/env bash

# No arg: jump to the next Claude window blocked on user input
#         (fallback: next-window -a, the old bell-chasing behaviour).
# With a choose-tree target ("session:index"): jump there -- claude_* popup
# sessions are re-opened as a popup, never switched into directly.

target="$1"
if [[ -z "$target" ]]; then
    current="$(tmux display-message -p '#{session_name}:#{window_index}')"
    target="$(tmux list-windows -a -F '#{@claude_state} #{session_name}:#{window_index}' \
        | awk -v cur="$current" '$1 == "blocked" && $2 != cur { print $2; exit }')"
    if [[ -z "$target" ]]; then
        tmux next-window -a
        exit 0
    fi
fi

session="${target%%:*}"
if [[ "$session" == claude_* ]]; then
    # popup sessions are meant to be viewed inside a popup (mirrors tmux-claude.sh)
    tmux display-popup -x 6% -y C -w 90% -h 90% -E \
        "tmux attach-session -t '=$session'"
else
    tmux switch-client -t "$target"
fi
