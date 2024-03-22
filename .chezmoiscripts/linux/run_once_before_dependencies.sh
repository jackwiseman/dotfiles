#!/bin/bash

packages=(
    "neovim"
    "zsh"
)

sudo apt update

for package in "${packages[@]}"
    do sudo apt install -y "$package"
done

# install go 1.21.0
wget "https://go.dev/dl/go1.22.1.linux-amd64.tar.gz"
echo "aab8e15785c997ae20f9c88422ee35d962c4562212bb0f879d052a35c8307c7f go1.22.1.linux-amd.tar.gz" | sha256sum -c
rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go1.22.1.linux-amd64.tar.gz

# chsh -s "$(which zsh)"
