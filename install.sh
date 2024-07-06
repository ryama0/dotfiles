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

if [ ! -d ~/.config ]; then
  mkdir ~/.config
fi

# latex
create_link "$DOTFILES_PATH/.latexmkrc" ~/.latexmkrc

# git
create_link "$DOTFILES_PATH/.gitconfig" ~/.gitconfig
if [ ! -d ~/.config/git ]; then
  mkdir ~/.config/git
fi

create_link "$DOTFILES_PATH/.gitignore_global" ~/.config/git/ignore

#ssh
if [ ! -d ~/.ssh ]; then
  mkdir  ~/.ssh
fi
create_link "$DOTFILES_PATH/.ssh/config"  ~/.ssh/config

#zsh
create_link "$DOTFILES_PATH/.zshrc" ~/.zshrc
create_link "$DOTFILES_PATH/.zprofile" ~/.zprofile
if [ ! -d ~/.zsh ]; then
  mkdir ~/.zsh
fi
create_link "$DOTFILES_PATH/zsh_user_autoload" ~/.zsh/user_autoload

#vim
create_link "$DOTFILES_PATH/.vimrc" ~/.vimrc
create_link "$DOTFILES_PATH/.gvimrc" ~/.gvimrc
if [ ! -d ~/.vim ]; then
  mkdir ~/.vim
fi
create_link "$DOTFILES_PATH/vim_user_autoload" ~/.vim/user_autoload

#tmux
create_link "$DOTFILES_PATH/.tmux.conf" ~/.tmux.conf
create_link "$DOTFILES_PATH/.tmux.d" ~/.tmux.d

# alacritty
create_link "$DOTFILES_PATH/.config/alacritty" ~/.config/alacritty
