#!/bin/bash

DOTFILES_PATH="$(cd "$(dirname "${BASH_SOURCE:-${(%):-%N}}")"; pwd)"

#link
ln -s $DOTFILES_PATH/.gvimrc ~/.gvimrc
ln -s $DOTFILES_PATH/.latexmkrc ~/.latexmkrc
ln -s $DOTFILES_PATH/.tmux.conf ~/.tmux.conf
ln -s $DOTFILES_PATH/.vimperatorrc ~/.vimperatorrc
ln -s $DOTFILES_PATH/.vimrc ~/.vimrc
ln -s $DOTFILES_PATH/.zshrc ~/.zshrc

#neobunlde
mkdir -p ~/.vim/bundle
git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim

#dict
mkdir -p ~/.vim/dict
cp ./dict/* ~/.vim/dict/
