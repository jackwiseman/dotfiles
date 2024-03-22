#!/bin/bash

packages=(
    "neovim"
    "zsh"
    "go"
)

sudo apt update

for package in "${packages[@]}"
    do apt install -y "$package"
done

# chsh -s "$(which zsh)"
