#!/bin/sh
# herdr port of vim-tmux-navigator's smart pane switching (see is_vim in
# ~/.config/tmux/keybindings.conf): when the focused pane is running (n)vim,
# forward the key so nvim moves between its own splits (nvim hands back to
# herdr at its edge, see nvim's tmux-navigator.lua); otherwise move herdr focus.
#
# usage: vim-nav.sh <left|down|up|right> <h|j|k|l>
dir=$1
key=$2
pane=${HERDR_ACTIVE_PANE_ID:?}

if herdr pane process-info --pane "$pane" \
	| jq -e 'any(.result.process_info.foreground_processes[]?; .argv0 | test("(^|/)g?(view|n?vim?x?)(diff)?$"))' >/dev/null; then
	herdr pane send-keys "$pane" "ctrl+$key"
else
	herdr pane focus --direction "$dir" --pane "$pane"
fi
