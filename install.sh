#!/bin/bash

if [ ! -v DOTFILES_PATH ]; then
  DOTFILES_PATH="$(cd "$(dirname "${BASH_SOURCE:-${(%):-%N}}")"; pwd)"
fi
if [ ! -v INSTALL_PATH ]; then
  INSTALL_PATH=${HOME}
fi


#link
ln -s $DOTFILES_PATH/.latexmkrc ${INSTALL_PATH}/.latexmkrc
ln -s $DOTFILES_PATH/.vimperatorrc ${INSTALL_PATH}/.vimperatorrc
ln -s $DOTFILES_PATH/.sbtconfig ${INSTALL_PATH}/.sbtconfig

#zsh
ln -s $DOTFILES_PATH/.zshrc ${INSTALL_PATH}/.zshrc
mkdir ${INSTALL_PATH}/.zsh
ln -s $DOTFILES_PATH/zsh_user_autoload ${INSTALL_PATH}/.zsh/user_autoload

#vim
ln -s $DOTFILES_PATH/.vimrc ${INSTALL_PATH}/.vimrc
ln -s $DOTFILES_PATH/.gvimrc ${INSTALL_PATH}/.gvimrc
mkdir -p ${INSTALL_PATH}/.vim/bundle
ln -s $DOTFILES_PATH/vim_user_autoload ${INSTALL_PATH}/.vim/user_autoload
git clone git://github.com/Shougo/neobundle.vim ${INSTALL_PATH}/.vim/bundle/neobundle.vim
ls ${INSTALL_PATH}/.vim/user_autoload/neobundle/available | while read line; do eval "ln -s ${INSTALL_PATH}/.vim/user_autoload/neobundle/available/${line} ${INSTALL_PATH}/.vim/user_autoload/neobundle/enable/${line}";done

##dict
ln -s $DOTFILES_PATH/dict ${INSTALL_PATH}/.vim/dict

#tmux
ln -s $DOTFILES_PATH/.tmux.conf ${INSTALL_PATH}/.tmux.conf
ln -s $DOTFILES_PATH/.tmux.d ${INSTALL_PATH}/.tmux.d
