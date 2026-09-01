#!/usr/bin/env bash
# Alfred launcher: open Claude in a fresh temp dir inside tmux, in a new kitty window.
# Mirrors the `tempe` helper (aliases.tmpl) + tmux-claude.sh session convention.

set -euo pipefail

TMP="$(mktemp -d)"
chmod -R 0700 "$TMP"

# Session name comes from the always-unique mktemp dir, so every invocation is a
# fresh scratch session even when the same {query} is reused.
SESSION="claude_$(basename "$TMP")"

# Optional subfolder name (Alfred {query}), matching `tempe`'s optional arg. Only
# changes the working dir, not the session identity.
DIR="$TMP"
if [[ $# -eq 1 && -n "${1:-}" ]]; then
    DIR="$TMP/$1"
    mkdir -p "$DIR"
    chmod -R 0700 "$DIR"
fi

# Spawn a new kitty window whose program is our tmux command (bypasses the
# `shell zsh -l -c tmux` default via --args, exactly like aerospace's alt-enter).
open -n /Applications/Kitty.app --args \
    zsh -lc "tmux new-session -A -s '$SESSION' -c '$DIR' 'claude || bash'"
