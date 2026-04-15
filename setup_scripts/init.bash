#!/usr/bin/env bash

[ "$(uname)" != "Darwin" ] && exit 1

# CLT
xcode-select --install

# brew
if type brew >/dev/null; then
  echo "Homebrew is already installed."
else
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi
