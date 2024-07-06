#! /bin/bash
set -eu

function remove_link() {
  local target="$1"
  if [ -L "$target" ]; then
    rm "$target"
  fi
}

# latex
remove_link ~/.latexmkrc
# git
remove_link ~/.gitconfig
remove_link ~/.config/git/ignore
# ssh
remove_link ~/.ssh/config
# zsh
remove_link ~/.zshrc
remove_link ~/.zprofile
rm -rf ~/.zsh
# vim
remove_link ~/.vimrc
remove_link ~/.gvimrc
rm -rf ~/.vim
# tmux
remove_link ~/.tmux.conf
remove_link ~/.tmux.d
# alacritty
remove_link ~/.config/alacritty
remove_link ~/.alacritty.toml
