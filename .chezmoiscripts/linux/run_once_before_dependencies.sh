#!/bin/bash

packages=(
    "neovim"
    "zsh"
    "go"
)

sudo apt update
sudo apt install -y "${packages[*]}"
chsh -s "$(which zsh)"
