#!/usr/bin/env bash

# Emit a marker for tmux status-right when a Claude popup session for the
# current directory is alive. The pane path is passed as $1.
#
# tmux-claude.sh builds the session name by replacing '/' with '_'. tmux then
# further sanitizes the name on creation, replacing '.' and ':' (its target
# delimiters) with '_' -- so we must mirror that here to match the *stored*
# name, otherwise has-session would parse a '.' as a pane target and fail for
# any dotfile directory (e.g. ~/.local/share/chezmoi).

dir="$1"
[[ -n "$dir" ]] || exit 0
session="claude_$(echo "$dir" | sed 's|^/||; s|[/.:]|_|g')"
tmux has-session -t "=$session" 2>/dev/null && printf '*'
exit 0
