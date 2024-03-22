#!/bin/bash

packages=(
    # "neovim"
    "unzip"
    "zsh"
)

sudo apt update

for package in "${packages[@]}"
    do sudo apt install -y "$package"
done

# install go 1.21.0
if [ "$(which go)" == 1 ]; then
        wget "https://go.dev/dl/go1.22.1.linux-amd64.tar.gz"
        # echo "aab8e15785c997ae20f9c88422ee35d962c4562212bb0f879d052a35c8307c7f go1.22.1.linux-amd.tar.gz" | sha256sum -c
        sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go1.22.1.linux-amd64.tar.gz
fi

# install fnm 1.35.1
if ! command -v fnm > /dev/null 2>&1; then
    wget "https://github.com/Schniz/fnm/releases/download/v1.35.1/fnm-arm64.zip"
    unzip fnm-arm64.zip
fi

# chsh -s "$(which zsh)"
