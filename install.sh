#!/bin/bash

DOTFILES_PATH="$(cd "$(dirname "${BASH_SOURCE:-${(%):-%N}}")"; pwd)"

#link
ln -s $DOTFILES_PATH/.latexmkrc ~/.latexmkrc
ln -s $DOTFILES_PATH/.vimperatorrc ~/.vimperatorrc
ln -s $DOTFILES_PATH/.sbtconfig ~/.sbtconfig

#zsh
ln -s $DOTFILES_PATH/.zshrc ~/.zshrc
mkdir ~/.zsh
ln -s $DOTFILES_PATH/zsh_user_autoload ~/.zsh/user_autoload

#vim
ln -s $DOTFILES_PATH/.vimrc ~/.vimrc
ln -s $DOTFILES_PATH/.gvimrc ~/.gvimrc
mkdir -p ~/.vim/bundle
ln -s $DOTFILES_PATH/vim_user_autoload ~/.vim/user_autoload
git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
ls ~/.vim/user_autoload/neobundle/available | while read line; do eval "ln -s ~/.vim/user_autoload/neobundle/available/${line} ~/.vim/user_autoload/neobundle/enable/${line}";done

##dict
ln -s $DOTFILES_PATH/dict ~/.vim/dict

#tmux
ln -s $DOTFILES_PATH/.tmux.conf ~/.tmux.conf
ln -s $DOTFILES_PATH/.tmux.d ~/.tmux.d

