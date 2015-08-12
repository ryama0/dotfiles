syntax enable
set background=dark
set t_Co=256
colorscheme slate
set antialias
"タブ幅
"タブを表示するときの幅
set tabstop=2
"タブを挿入するときの幅
set shiftwidth=2
"タブをスペースとして扱う(スペースに展開)
set expandtab
set softtabstop=0
"勝手に改行しない
set tw=0
"行番号
set number
"バックスペースを使えるように
set backspace=start,eol,indent
"カーソル行の背景色を変更
set cursorline
"カーソル位置のカラムの背景色を変更
"set cursorcolumn
"不可視文字を表示
set list
"不可視文字の表示記号指定
if has('win32')
  set listchars=tab:>\ ,eol:~
else
  set listchars=tab:▸\ ,eol:↲,extends:❯,precedes:❮
endif
"ビープ音
set visualbell t_vb=
set noerrorbells
"上下8行の視界を確保
set scrolloff=8
"マウスの入力を受け付ける
set mouse=a
filetype on
filetype plugin on
"バックアップファイルの生成関係
if has('win32')
  "Windowsでもパスの区切り文字を/にする
  set shellslash
endif
"*.un~を作らない
set noundofile
"*~を作らない
set nobackup

"新しい行のインデントを同じ行にする
set autoindent
filetype plugin indent on
filetype indent on
set nocindent
"ステータス行を常に表示
set laststatus=2
"入力したコマンドを表示
set showcmd
"プログラム言語毎の設定
"Ruby
compiler ruby
let ruby_space_error=1

"Auto Open quickfix-window
autocmd QuickFixCmdPost *grep* cwindow

let g:tex_flavor='latex'
