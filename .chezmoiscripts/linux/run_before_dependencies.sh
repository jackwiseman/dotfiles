#!/bin/bash

packages=(
    "unzip"
    "zsh"
    "gcc"
)

echo "Updating dependencies"
sudo apt update > /dev/null 2>&1

for package in "${packages[@]}"
    do sudo apt install -y "$package" > /dev/null 2>&1
done

# $1 user/repo
# $2 version
# $3 file (tar)
# $4 command
installFromGithub () {
    if ! command -v "$4" > /dev/null 2>&1; then
        echo "Installing $4 $2"
        wget "https://github.com$1/releases/download/$2/$3" > /dev/null 2>&1
        sudo tar -C /usr/local/bin -xzf "$3" > /dev/null 2>&1
        sudo rm "$3"
    fi
}

if ! command -v go > /dev/null 2>&1; then
        version="1.22.1"
        echo "Installing go $version"
        wget "https://go.dev/dl/go$version.linux-amd64.tar.gz" > /dev/null 2>&1
        # echo "aab8e15785c997ae20f9c88422ee35d962c4562212bb0f879d052a35c8307c7f go1.22.1.linux-amd.tar.gz" | sha256sum -c
        sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf "go$version.linux-amd64.tar.gz"
        rm "go$version.linux-amd64.tar.gz"
fi

if ! command -v fnm > /dev/null 2>&1; then
    version="v1.35.1"
    echo "Installing fnm $version"
    wget "https://github.com/Schniz/fnm/releases/download/$version/fnm-linux.zip" > /dev/null 2>&1
    unzip fnm-linux.zip > /dev/null 2>&1
    rm fnm-linux.zip
    sudo chmod +x fnm
    sudo mv fnm /usr/local/bin/fnm
fi

if ! command -v nvim > /dev/null 2>&1; then
    echo "Installing latest neovim release"
    wget "https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz" > /dev/null 2>&1
    sudo rm -rf /opt/nvim
    sudo tar -C /opt -xzf nvim-linux64.tar.gz
    sudo rm "nvim-linux64.tar.gz"
fi

installFromGithub "junegunn/fzf" "0.48.1" "fzf-0.48.1-linux_amd64.tar.gz" "fzf"
installFromGithub "dandavision/delta" "0.17.0" "delta-0.17.0-arm-unknown-linux-gnueabihf.tar.gz" "delta"

# ensure pinned node is installed
fnm install 21.7.1

nodepackages=(
    "neovim"
    "tldr"
)

echo "Installing node packages"
for package in "${nodepackages[@]}"
    do npm install -g "$package" > /dev/null 2>&1
done
