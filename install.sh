#!/bin/bash

DOTFILES_PATH="$(cd "$(dirname "${BASH_SOURCE:-${(%):-%N}}")"; pwd)"

ln -s $DOTFILES_PATH/.latexmkrc ~/.latexmkrc
ln -s $DOTFILES_PATH/.gitconfig ~/.gitconfig
ln -s $DOTFILES_PATH/.rtxrc ~/.rtxrc

#ssh
mkdir -p ~/.ssh
ln -s $DOTFILES_PATH/.ssh/config  ~/.ssh/config

#zsh
ln -s $DOTFILES_PATH/.zshrc ~/.zshrc
ln -s $DOTFILES_PATH/.zprofile ~/.zprofile
mkdir ~/.zsh
ln -s $DOTFILES_PATH/zsh_user_autoload ~/.zsh/user_autoload

#vim
ln -s $DOTFILES_PATH/.vimrc ~/.vimrc
ln -s $DOTFILES_PATH/.gvimrc ~/.gvimrc
mkdir ~/.vim
ln -s $DOTFILES_PATH/vim_user_autoload ~/.vim/user_autoload

#tmux
ln -s $DOTFILES_PATH/.tmux.conf ~/.tmux.conf
ln -s $DOTFILES_PATH/.tmux.d ~/.tmux.d

#git
mkdir -p ~/.config/git
ln -s $DOTFILES_PATH/.gitignore_global ~/.config/git/ignore
