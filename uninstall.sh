#! /bin/bash
set -eu

function remove_link() {
  local target="$1"
  if [ -L "$target" ]; then
    rm "$target"
  fi
}

remove_link ~/.latexmkrc
remove_link ~/.gitconfig
remove_link ~/.config/git/ignore
remove_link ~/.ssh/config
remove_link ~/.zshrc
remove_link ~/.zprofile
rm -rf ~/.zsh
remove_link ~/.vimrc
remove_link ~/.gvimrc
rm -rf ~/.vim
remove_link ~/.tmux.conf
remove_link ~/.tmux.d
remove_link ~/.config/alacritty
