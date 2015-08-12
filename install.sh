#!/bin/bash

DOTFILES_PATH="$(cd "$(dirname "${BASH_SOURCE:-${(%):-%N}}")"; pwd)"

#link
ln -s $DOTFILES_PATH/.gvimrc ~/.gvimrc
ln -s $DOTFILES_PATH/.latexmkrc ~/.latexmkrc
ln -s $DOTFILES_PATH/.tmux.conf ~/.tmux.conf
ln -s $DOTFILES_PATH/.vimperatorrc ~/.vimperatorrc
ln -s $DOTFILES_PATH/.vimrc ~/.vimrc
ln -s $DOTFILES_PATH/.zshrc ~/.zshrc
ln -s $DOTFILES_PATH/.sbtconfig ~/.sbtconfig

#neobunlde
mkdir -p ~/.vim/bundle
ln -s $DOTFILES_PATH/vim_user_autoload ~/.vim/user_autoload
git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim

#dict
ln -s $DOTFILES_PATH/dict ~/.vim/dict

