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

if ! command -v go > /dev/null 2>&1; then
        version="1.22.1"
        wget "https://go.dev/dl/go$version.linux-amd64.tar.gz"
        # echo "aab8e15785c997ae20f9c88422ee35d962c4562212bb0f879d052a35c8307c7f go1.22.1.linux-amd.tar.gz" | sha256sum -c
        sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf "go$version.linux-amd64.tar.gz"
        rm "go$version.linux-amd64.tar.gz"
fi

# install fnm 1.35.1
if ! command -v fnm > /dev/null 2>&1; then
    version="v1.35.1"
    wget "https://github.com/Schniz/fnm/releases/download/$version/fnm-linux.zip"
    unzip fnm-linux.zip
    rm fnm-linux.zip
    sudo chmod +x fnm
    sudo mv fnm /usr/local/bin/fnm
fi

# chsh -s "$(which zsh)"
