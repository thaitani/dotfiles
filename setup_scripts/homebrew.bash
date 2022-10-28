#!/usr/bin/env bash

/opt/homebrew/bin/brew update

/opt/homebrew/bin/brew bundle install --file "$XDG_CONFIG_HOME/homebrew/Brewfile" --no-lock --verbose
