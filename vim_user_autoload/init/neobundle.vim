if has('vim_starting')
  if &compatible
    set nocompatible
  endif

  set runtimepath+=$HOME/.vim/bundle/neobundle.vim
  call neobundle#begin(expand('~/.vim/bundle/'))
endif

NeoBundleFetch 'Shougo/neobundle.vim'
"非同期処理のため
NeoBundle 'Shougo/vimproc',{
    \ 'build' : {
    \    'cygwin' : 'make -f make_cygwin.mak',
    \    'mac' : 'make -f make_mac.mak',
    \    'unix' : 'make -f make_unix.mak',
    \    },
    \ }

"vimからシェルを起動する
NeoBundle 'Shougo/vimshell'

"explrer
NeoBundle 'Shougo/vimfiler.vim'
let g:vimfiler_as_default_explorer = 1

"vim上で使用できる統合ユーザーインターフェース
NeoBundle 'Shougo/unite.vim'
"Unite file_mru用
NeoBundle 'Shougo/neomru.vim'
"Unite outline
NeoBundle 'Shougo/unite-outline'

"入力補完機能
function! s:meet_neocomplete_requirements()
  return has('lua') && (v:version > 703 || (v:version == 703 && has('patch885')))
endfunction
if s:meet_neocomplete_requirements()
    NeoBundle 'Shougo/neocomplete.vim'
    NeoBundleFetch 'Shougo/neocomplcache.vim'
else
    NeoBundleFetch 'Shougo/neocomplete.vim'
    NeoBundle 'Shougo/neocomplcache.vim'
endif

NeoBundle 'Shougo/neoinclude.vim'

"スニペット入力サポート
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'

"VimからGNU Screenを制御
NeoBundle 'jpalardy/vim-slime'
"構文エラーチェック
NeoBundle 'scrooloose/syntastic'
"ステータスライン
NeoBundle 'itchyny/lightline.vim'

"HTMLタグなどの囲まれているもの編集補助
NeoBundle 'surround.vim'
"Ruby
NeoBundle 'vim-ruby/vim-ruby'
"Powershell
NeoBundle 'PProvost/vim-ps1'
"arduino
NeoBundle 'sudar/vim-arduino-syntax'
"Scala
NeoBundle 'derekwyatt/vim-scala'
"JavaScript
NeoBundle 'jelera/vim-javascript-syntax'

au FileType javascript call JavaScriptFold()

NeoBundle 'mattn/jscomplete-vim'

"autocmd FileType javascript :setl omnifunc=jscomplete#CompleteJS

NeoBundle 'mattn/emmet-vim'

"タグのリスト表示
NeoBundleLazy 'majutsushi/tagbar', {
    \ "autoload" : { "commands": ["TagbarToggle"] }}
"関数などの定義場所のソース表示
NeoBundleLazy 'wesleyche/SrcExpl', {
    \ "autoload" : { "commands": ["SrcExplToggle"]}}


"QuickRun
NeoBundle 'thinca/vim-quickrun'

"C++11
NeoBundleLazy 'vim-jp/cpp-vim', {
    \ 'autoload' : {'filetypes' : 'cpp'}
    \ }

"vim-marching
if executable('clang')
  NeoBundle "osyo-manga/vim-marching"
  let g:enable_marching=1
endif

"clang_complete
if executable('clang')
  "NeoBundle 'Rip-Rip/clang_complete'
  "let g:enable_clang_complete=1
endif

"C#
if executable('mono')
  NeoBundleLazy 'nosami/Omnisharp', {
  \   'autoload': {'filetypes': ['cs']},
  \   'build': {
  \     'mac': 'xbuild server/OmniSharp.sln',
  \     'unix': 'xbuild server/OmniSharp.sln',
  \   }
  \ }
endif

NeoBundle 'tpope/vim-dispatch'

"Neobundle(Windows)
if has('win32')
    NeoBundle 'PProvost/vim-ps1'
endif

"Quickhl
NeoBundle 't9md/vim-quickhl'

"Markdown
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'kannokanno/previm'
NeoBundle 'tyru/open-browser.vim'

"capture.vim キーバインド確認
NeoBundle 'tyru/capture.vim'
"コメントアウト
NeoBundle 'tyru/caw.vim'
" git用プラグイン
NeoBundle 'rhysd/committia.vim'

" LifeLog
NeoBundle 'wakatime/vim-wakatime'

call neobundle#end()

filetype plugin indent on

NeoBundleCheck
