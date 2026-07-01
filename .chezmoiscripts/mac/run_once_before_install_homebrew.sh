#! /bin/sh

# check for existence of homebrew, install if not found
# this ensures xcode-select is installed as well
if ! command -v brew > /dev/null 2>&1; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    # the installer doesn't add brew to PATH in the current shell, so load it
    # from whichever prefix it landed in before using it
    if [ -x /opt/homebrew/bin/brew ]; then
        eval "$(/opt/homebrew/bin/brew shellenv)"
    elif [ -x /usr/local/bin/brew ]; then
        eval "$(/usr/local/bin/brew shellenv)"
    fi

    brew analytics off
fi
