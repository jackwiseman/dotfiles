#!/bin/sh

$packages=(

)

sudo apt update
sudo apt install zsh -y
chsh -s $(which zsh)
