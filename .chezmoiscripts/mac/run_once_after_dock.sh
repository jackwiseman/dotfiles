#!/bin/sh

dockutil --remove all
dockutil --add /Applications/Launchpad.app
dockutil --add /Applications/Messages.app
dockutil --add /Applications/Firefox.app
dockutil --add /Applications/Spotify.app
dockutil --add /Applications/Plex.app
dockutil --add /Applications/Obsidian.app
dockutil --add ~/Screenshots --view fan --display stack --sort dateadded
dockutil --add ~/Downloads --view fan --display stack --sort dateadded
