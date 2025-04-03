#!/bin/sh

mkdir -p /usr/share/wordlists

git clone --depth 1 https://github.com/danielmiessler/SecLists.git
sudo mv SecLists /usr/share/wordlists/
