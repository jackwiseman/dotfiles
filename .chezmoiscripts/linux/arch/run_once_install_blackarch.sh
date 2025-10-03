#!/bin/sh

# Exit early if blackarch repo is already added
if grep -q "blackarch" /etc/pacman.conf; then
    echo "BlackArch repository is already added."
    exit 0
fi

# See https://blackarch.org/downloads#install-repo

# Run https://blackarch.org/strap.sh as root and follow the instructions.
curl -O https://blackarch.org/strap.sh

# Verify the SHA1 sum
echo bbf0a0b838aed0ec05fff2d375dd17591cbdf8aa strap.sh | sha1sum -c

# Set execute bit
chmod +x strap.sh

# Run strap.sh
sudo ./strap.sh

# Enable multilib following https://wiki.archlinux.org/index.php/Official_repositories#Enabling_multilib and run:
sudo pacman -Syu

rm strap.sh
