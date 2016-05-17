if has('vim_starting')
  if &compatible
    set nocompatible
  endif

  set runtimepath+=$HOME/.vim/bundle/neobundle.vim
  call neobundle#begin(expand('~/.vim/bundle/'))
endif

NeoBundleFetch 'Shougo/neobundle.vim'

runtime! user_autoload/neobundle/enable/*.vim

call neobundle#end()

filetype plugin indent on

NeoBundleCheck
