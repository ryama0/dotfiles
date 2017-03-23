#!/bin/bash

INSTALL_PATH="${HOME}"

#link
ln -s $INSTALL_PATH/.latexmkrc ~/.latexmkrc
ln -s $INSTALL_PATH/.vimperatorrc ~/.vimperatorrc
ln -s $INSTALL_PATH/.sbtconfig ~/.sbtconfig

#zsh
ln -s $INSTALL_PATH/.zshrc ~/.zshrc
mkdir ~/.zsh
ln -s $INSTALL_PATH/zsh_user_autoload ~/.zsh/user_autoload

#vim
ln -s $INSTALL_PATH/.vimrc ~/.vimrc
ln -s $INSTALL_PATH/.gvimrc ~/.gvimrc
mkdir -p ~/.vim/bundle
ln -s $INSTALL_PATH/vim_user_autoload ~/.vim/user_autoload
git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
ls ~/.vim/user_autoload/neobundle/available | while read line; do eval "ln -s ~/.vim/user_autoload/neobundle/available/${line} ~/.vim/user_autoload/neobundle/enable/${line}";done

##dict
ln -s $INSTALL_PATH/dict ~/.vim/dict

#tmux
ln -s $INSTALL_PATH/.tmux.conf ~/.tmux.conf
ln -s $INSTALL_PATH/.tmux.d ~/.tmux.d
