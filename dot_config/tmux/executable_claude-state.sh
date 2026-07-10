#!/bin/sh
# Claude Code hook -> tmux agent state on the originating window.
# Usage: claude-state.sh <working|blocked|done|clear>
# working = blue dot, blocked = red dot (waiting on user), done = green dot.
[ -n "$TMUX" ] && [ -n "$TMUX_PANE" ] || exit 0
state="$1"
cur="$(tmux show-options -wv -t "$TMUX_PANE" @claude_state 2>/dev/null)"
[ "$cur" = "$state" ] && exit 0
if [ "$state" = "clear" ]; then
    tmux set-option -w -t "$TMUX_PANE" -u @claude_state 2>/dev/null
else
    tmux set-option -w -t "$TMUX_PANE" @claude_state "$state" 2>/dev/null || exit 0
fi
case "$state" in
blocked|done)
    # ring the bell so monitor-bell flags the window in the status bar
    tty="$(tmux display-message -p -t "$TMUX_PANE" '#{pane_tty}')" && printf '\a' > "$tty"
    ;;
esac
# redraw every client's status line immediately
for c in $(tmux list-clients -F '#{client_name}'); do
    tmux refresh-client -S -t "$c"
done
exit 0
