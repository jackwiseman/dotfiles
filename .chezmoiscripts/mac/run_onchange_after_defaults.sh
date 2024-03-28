#!/bin/sh

echo "Setting defaults, password may be required"

# Prevent display from sleeping
sudo pmset -a displaysleep 0

# Stop iTunes from responding to media keys
launchctl unload -w /System/Library/LaunchAgents/com.apple.rcd.plist 2> /dev/null

# Enable using ⌘ + Q to quit Finder
defaults write com.apple.finder QuitMenuItem -bool true

# Automatically show/hide the Dock
defaults write com.apple.dock autohide -bool true

# Disable bottom right hotcorner
defaults write com.apple.dock wvous-br-corner -int 0

# Create a new folder for storing screenshots
mkdir -p "$HOME/Screenshots"
defaults write com.apple.screencapture location "$HOME/Screenshots"

# Set hammerspoon home directory to ~/.config/hammerspoon
defaults write org.hammerspoon.Hammerspoon MJConfigFile "$HOME/.config/hammerspoon/init.lua"

# Set alt-tab defaults
defaults write com.lwouis.alt-tab-macos holdShortcut "\\U2318"
# counter intuitive, but hide stuff in other spaces
defaults write com.lwouis.alt-tab-macos spacesToShow 1
