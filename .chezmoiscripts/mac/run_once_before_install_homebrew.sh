#! /bin/sh

# check for existence of homebrew, install if not found
# this ensures xcode-select is installed as well
if ! command -v brew > /dev/null 2&>1; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    brew analytics off
fi
