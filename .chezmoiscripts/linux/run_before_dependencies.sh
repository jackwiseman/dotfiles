#!/bin/bash

packages=(
    # "neovim"
    "unzip"
    "zsh"
    "gcc"
)

echo "Updating dependencies"
sudo apt update > /dev/null 2>&1

for package in "${packages[@]}"
    do sudo apt install -y "$package" > /dev/null 2>&1
done

if ! command -v go > /dev/null 2>&1; then
        version="1.22.1"
        echo "Installing go"
        wget "https://go.dev/dl/go$version.linux-amd64.tar.gz" > /dev/null 2>&1
        # echo "aab8e15785c997ae20f9c88422ee35d962c4562212bb0f879d052a35c8307c7f go1.22.1.linux-amd.tar.gz" | sha256sum -c
        sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf "go$version.linux-amd64.tar.gz"
        rm "go$version.linux-amd64.tar.gz"
fi

# install fnm 1.35.1
if ! command -v fnm > /dev/null 2>&1; then
    version="v1.35.1"
    echo "Installing fnm"
    wget "https://github.com/Schniz/fnm/releases/download/$version/fnm-linux.zip" > /dev/null 2>&1
    unzip fnm-linux.zip
    rm fnm-linux.zip
    sudo chmod +x fnm
    sudo mv fnm /usr/local/bin/fnm
fi

if ! command -v nvim > /dev/null 2>&1; then
    echo "Installing neovim"
    wget "https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz" > /dev/null 2>&1
    sudo rm -rf /opt/nvim
    sudo tar -C /opt -xzf nvim-linux64.tar.gz
    sudo rm "nvim-linux64.tar.gz"
fi

if ! command -v fzf > /dev/null 2>&1; then
    version="0.48.1"
    echo "Installing fzf $version"
    wget "https://github.com/junegunn/fzf/releases/download/$version/fzf-$version-linux_amd64.tar.gz" > /dev/null 2>&1
    sudo tar -C /usr/local/bin -xzf "fzf-$version-linux_amd64.tar.gz"
    sudo rm "fzf-$version-linux_amd64.tar.gz"
fi
# chsh -s "$(which zsh)"
