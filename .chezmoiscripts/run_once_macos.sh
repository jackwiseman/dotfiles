#!/bin/sh

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
mkdir ~/Screenshots
defaults write com.apple.screencapture location "~/Screenshots"

# Set hammerspoon home directory to ~/.config/hammerspoon
defaults write org.hammerspoon.Hammerspoon MJConfigFile "~/.config/hammerspoon/init.lua"
