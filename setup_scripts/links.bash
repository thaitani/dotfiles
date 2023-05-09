#!/usr/bin/env bash

if [ ! -d "$HOME/.ssh" ]; then
  mkdir -p "$HOME/.ssh"
  chmod 700 "$HOME/.ssh"
fi

mkdir -p \
  "$XDG_CONFIG_HOME" \
  "$XDG_STATE_HOME" \
  "$XDG_DATA_HOME/vim"

ln -sfv "${PWD}/config/"* "$XDG_CONFIG_HOME"
ln -sfv "$XDG_CONFIG_HOME/zsh/.zshenv" "$HOME/.zshenv"
ln -sfv "$XDG_CONFIG_HOME/editorconfig/.editorconfig" "$HOME/.editorconfig"
ln -sfv "$XDG_CONFIG_HOME/vim/.vimrc" "$HOME/.vimrc"
ln -sfv "$XDG_CONFIG_HOME/commitizen/.czrc" "$HOME/.czrc"
ln -sfv "$XDG_CONFIG_HOME/asdf/.tool-versions" "$HOME/.tool-versions"
