#!/usr/bin/env bash
set -x
# shellcheck source=./setup_scripts/common.bash
source "$(dirname "$0")/common.bash"

[ "$(uname)" != "Darwin" ] && exit

if type brew >/dev/null; then
  echo "Homebrew is already installed."
else
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

echo "Updating Homebrew..."
brew update

echo "Installing Homebrew apps..."
brew bundle install --file "${REPO_DIR}/homebrew/Brewfile" --no-lock --verbose
