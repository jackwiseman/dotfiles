#!/bin/sh

if command -v yay >/dev/null 2>&1; then
    echo "yay is already installed"
    exit 0
fi

sudo pacman -S --noconfirm --needed git base-devel
git clone https://aur.archlinux.org/yay.git /tmp/yay
cd /tmp/yay || exit 1
makepkg -si --noconfirm
rm -rf /tmp/yay
