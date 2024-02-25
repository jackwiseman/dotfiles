#!/bin/bash

# Brewfile hash: {{ include "Brewfile.tmpl" | sha256sum }}

brew bundle install

title () {
    local title="$1"
    local term_width=$(tput cols)
    local padding=$((($term_width - ${#title}) / 2))
    printf "\n\n%${padding}s%s%${padding}s\n" " " "$title" " "
}

title "== EXTRA FORMULAE =="
comm -23 <(brew list --formula | sort) <(brew bundle list --formula | sort) | awk '{printf "%-30s", $1; if(NR%6==0) printf "\n";}'

title "== EXTRA CASKS =="
comm -23 <(brew list --cask | sort) <(brew bundle list --cask | sort) | awk '{printf "%-30s", $1; if(NR%6==0) printf "\n";}'

echo;echo;
echo "Remove extras with \`brew bundle cleanup\` or add to Brewfile"
