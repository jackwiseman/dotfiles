#!/bin/bash
TERM_PIDFILE="/tmp/20718ddc-aa8a-45d8-8a97-a48578c146b0"
TERM_PID="$(<"$TERM_PIDFILE")"
if swaymsg "[ pid=$TERM_PID ] scratchpad show"
then
    # If multi-monitor configuration: resize on each monitor
    swaymsg "[ pid=$TERM_PID ] resize set 100ppt , move position 0 0"
    # swaymsg "[ pid=$TERM_PID ] resize set 100ppt 100ppt, move position 0 0"
else
    echo "$$" > "$TERM_PIDFILE"
    swaymsg "for_window [ pid=$$ ] 'floating enable ; resize set 100ppt 50ppt ; move position 0 0 ; move to scratchpad ; scratchpad show'"
    # swaymsg "for_window [ pid=$$ ] 'floating enable ; resize set 100ppt 100ppt ; move position 0 0 ; move to scratchpad ; scratchpad show'"
    exec alacritty -e zsh -c "tmux attach -t scratchpad || tmux new-session -s 'scratchpad'"
fi
