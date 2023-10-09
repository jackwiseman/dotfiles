#!/bin/sh

sudo apt install zsh -y
chsh -s $(which zsh)

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
