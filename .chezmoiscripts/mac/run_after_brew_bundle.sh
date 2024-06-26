#!/bin/bash

# Brewfile hash: {{ include "Brewfile.tmpl" | sha256sum }}

brew bundle --no-upgrade | grep -i "Homebrew Bundle"
