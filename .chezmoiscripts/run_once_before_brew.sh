#! /bin/sh

# check for existence of homebrew, install if not found
# this ensures xcode-select is installed as well
if ! command -v brew &> /dev/null
then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
