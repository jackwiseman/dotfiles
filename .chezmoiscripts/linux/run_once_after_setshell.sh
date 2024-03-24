#!/bin/sh

# of course assumes default is always jack
sudo chsh -s /usr/bin/zsh $USER
echo "shell changed, log out and log in again to update"
