#!/bin/bash
set -eu

DOTFILES_PATH="$(cd "$(dirname "${BASH_SOURCE:-${(%):-%N}}")"; pwd)"

function create_link() {
  local target="$1"
  local link="$2"
  if [ ! -L "$link" ]; then
    ln -s "$target" "$link"
  fi
}

#zsh
create_link "$DOTFILES_PATH/.zshrc" ~/.zshrc
create_link "$DOTFILES_PATH/.zprofile" ~/.zprofile
mkdir -p ~/.zsh/local
create_link "$DOTFILES_PATH/.zsh/conf.d" ~/.zsh/conf.d

# user bin
mkdir -p ~/.local/bin

# user config
if [ ! -d ~/.config ]; then
  mkdir ~/.config
fi

# git
create_link "$DOTFILES_PATH/.gitconfig" ~/.gitconfig
if [ ! -d ~/.config/git ]; then
  mkdir ~/.config/git
fi
create_link "$DOTFILES_PATH/.config/git/ignore" ~/.config/git/ignore

#ssh
if [ ! -d ~/.ssh ]; then
  mkdir  ~/.ssh
fi

#vim
create_link "$DOTFILES_PATH/.vimrc" ~/.vimrc
create_link "$DOTFILES_PATH/.gvimrc" ~/.gvimrc
if [ ! -d ~/.vim ]; then
  mkdir ~/.vim
fi
create_link "$DOTFILES_PATH/vim_user_autoload" ~/.vim/user_autoload

#tmux
create_link "$DOTFILES_PATH/.tmux.conf" ~/.tmux.conf
create_link "$DOTFILES_PATH/.tmux" ~/.tmux

# alacritty
create_link "$DOTFILES_PATH/.config/alacritty" ~/.config/alacritty

# cleanup
echo 'Re-login required'
