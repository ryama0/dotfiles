if has('vim_starting')
  if &compatible
    set nocompatible
  endif

  set runtimepath+=$HOME/.vim/bundle/neobundle.vim
  call neobundle#begin(expand('~/.vim/bundle/'))
endif

NeoBundleFetch 'Shougo/neobundle.vim'

let s:neobundle_path="user_autoload/neobundle"

runtime! user_autoload/neobundle/on-*.vim

call neobundle#end()

filetype plugin indent on

NeoBundleCheck
