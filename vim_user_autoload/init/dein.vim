if &compatible
  set nocompatible
endif

" インストールディレクトリ
let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" dein.vim がなければ clone
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " toml をロード 
  let g:dein_plugins_dir    = expand('~/.vim/user_autoload/dein')
  let s:toml      = g:dein_plugins_dir . '/plugins.toml'
  let s:lazy_toml = g:dein_plugins_dir . '/plugins_lazy.toml'

  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

" install 
if dein#check_install()
  call dein#install()
endif

" update :call dein#update()

filetype plugin indent on
syntax enable

