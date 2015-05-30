syntax enable
set background=dark
set t_Co=256
colorscheme slate
set antialias
"タブ幅
"タブを表示するときの幅
set tabstop=4
"タブを挿入するときの幅
set shiftwidth=4
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
"set cursorline
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
"neobundle
set nocompatible
"マウスの入力を受け付ける
set mouse=a
"syntax on
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

filetype off
"NeoBundle
if has('vim_starting')
    if has('win32')
        set runtimepath+=$HOME/_vim/bundle/neobundle.vim
        call neobundle#begin(expand('~/_vim/bundle/'))
        NeoBundleFetch 'Shougo/neobundle.vim'
    else
        set runtimepath+=$HOME/.vim/bundle/neobundle.vim
        call neobundle#begin(expand('~/.vim/bundle/'))
        NeoBundleFetch 'Shougo/neobundle.vim'
    endif
endif

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
"unite.vim の設定
nnoremap    [unite]   <Nop>
nmap    <Leader>f [unite]
" unite.vim keymap
nnoremap [unite]u  :<C-u>Unite -no-split<Space>
nnoremap <silent> [unite]f :<C-u>Unite<Space>buffer<CR>
nnoremap <silent> [unite]F :<C-u>Unite<Space>file<CR>
nnoremap <silent> [unite]b :<C-u>Unite<Space>bookmark<CR>
nnoremap <silent> [unite]m :<C-u>Unite<Space>file_mru<CR>
nnoremap <silent> [unite]r :<C-u>UniteWithBufferDir file<CR>
nnoremap <silent> ,vr :UniteResume<CR>
" vinarise
let g:vinarise_enable_auto_detect = 1
" unite-build map
nnoremap <silent> ,vb :Unite build<CR>
nnoremap <silent> ,vcb :Unite build:!<CR>
nnoremap <silent> ,vch :UniteBuildClearHighlight<CR>
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
if s:meet_neocomplete_requirements()
    "neocomplete の設定
     " Disable AutoComplPop.
     let g:acp_enableAtStartup = 0
     " Use neocomplete.
     let g:neocomplete#enable_at_startup = 1
     " Use smartcase.
     let g:neocomplete#enable_smart_case = 1
     " Set minimum syntax keyword length.
     let g:neocomplete#sources#syntax#min_keyword_length = 3
     let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
     " Define dictionary.
     let $DOTVIM = $HOME . '/.vim'
     let g:neocomplete#sources#dictionary#dictionaries = {
         \ 'default' : '',
         \ 'vimshell' : $HOME.'/.vimshell_hist',
         \ 'scheme' : $HOME.'/.gosh_completions',
         \ 'scala' : $DOTVIM.'/dict/scala.dict'
         \ }
     " Define keyword.
     if !exists('g:neocomplete#keyword_patterns')
         let g:neocomplete#keyword_patterns = {}
     endif
     let g:neocomplete#keyword_patterns['default'] = '\h\w*'
     " Plugin key-mappings.
     inoremap <expr><C-g>     neocomplete#undo_completion()
     inoremap <expr><C-l>     neocomplete#complete_common_string()
     " Recommended key-mappings.
     " <CR>: close popup and save indent.
     inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
     function! s:my_cr_function()
          return neocomplete#close_popup() . "\<CR>"
          " For no inserting <CR> key.
          "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
     endfunction
     " <TAB>: completion.
     inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
     " <C-h>, <BS>: close popup and delete backword char.
     inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
     inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
     inoremap <expr><C-y>  neocomplete#close_popup()
     inoremap <expr><C-e>  neocomplete#cancel_popup()
     " Close popup by <Space>.
     "inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"
     " AutoComplPop like behavior.
     "let g:neocomplete#enable_auto_select = 1
     " Enable omni completion.
     autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
     autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
     "autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
     autocmd FileType javascript setlocal omnifunc=jscomplete#CompleteJS
     autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
     autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
     " Enable heavy omni completion.
     if !exists('g:neocomplete#sources#omni#input_patterns')
          let g:neocomplete#sources#omni#input_patterns = {}
     endif
     "let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
    let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
    let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
    " For perlomni.vim setting.
    "let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
    "C#
    "call neocomplete#custom#source('_', 'sorters', [])
    if !exists('g:neocomplete#sources')
      let g:neocomplete#sources = {}
    endif
    let g:neocomplete#sources#omni#input_patterns.cs = '.*[^=\);]'
    let g:neocomplete#sources.cs = ['omni']
    let g:neocomplete#enable_refresh_always = 0

    if !exists('g:neocomplete#sources#omni#functions')
          let g:neocomplete#sources#omni#functions = {}
    endif
    let g:neocomplete#sources#omni#functions.javascript = ['javascriptcomplete#CompleteJS']
else
    "neocomplcache の設定
    " Disable AutoComplPop.
    let g:acp_enableAtStartup = 0
    " Use neocomplcache.
    let g:neocomplcache_enable_at_startup = 1
    " Use smartcase.
    let g:neocomplcache_enable_smart_case = 1
    " Set minimum syntax keyword length.
    let g:neocomplcache_min_syntax_length = 3
    let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
    " Define dictionary.
    let g:neocomplcache_dictionary_filetype_lists = {
        \ 'default' : ''
        \ }
    " Plugin key-mappings.
    inoremap <expr><C-g>     neocomplcache#undo_completion()
    inoremap <expr><C-l>     neocomplcache#complete_common_string()
    " Recommended key-mappings.
    " <CR>: close popup and save indent.
    inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
    function! s:my_cr_function()
        return neocomplcache#smart_close_popup() . "\<CR>"
    endfunction
    " <TAB>: completion.
     inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
    " <C-h>, <BS>: close popup and delete backword char.
    inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
    inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
    inoremap <expr><C-y>  neocomplcache#close_popup()
    inoremap <expr><C-e>  neocomplcache#cancel_popup()
    if !exists("g:neocomplcache_force_omni_patterns")
        let g:neocomplcache_force_omni_patterns = {}
    endif
    let g:neocomplcache_force_omni_patterns.c =
      \ '[^.[:digit:] *\t]\%(\.\|->\)'
    let g:neocomplcache_force_omni_patterns.cpp =
      \ '[^.[:digit:] *\t]\%(\.\|->\)\|::'
    "OmniSharp
    let g:neocomplcache_force_omni_patterns.cs = '[^.]\.\%(\u\{2,}\)\?'
endif
"スニペット入力サポート
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
" neosnippet の設定
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable() <Bar><bar> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable() <Bar><bar> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif
"VimからGNU Screenを制御
NeoBundle 'jpalardy/vim-slime'
"構文エラーチェック
NeoBundle 'scrooloose/syntastic'
let g:syntastic_check_on_open=1
"":Errorsで詳細を表示
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=2
""C++
let g:syntastic_c_check_header=1
let g:syntastic_cpp_check_header=1
""C#
let g:syntastic_cs_checkers = ['syntax', 'semantic', 'issues']
"ステータスライン
NeoBundle 'itchyny/lightline.vim'
let g:lightline = {
        \ 'mode_map': {'c': 'NORMAL'},
        \ 'active': {
        \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
        \ },
        \ 'component_function': {
        \   'modified': 'MyModified',
        \   'readonly': 'MyReadonly',
        \   'fugitive': 'MyFugitive',
        \   'filename': 'MyFilename',
        \   'fileformat': 'MyFileformat',
        \   'filetype': 'MyFiletype',
        \   'fileencoding': 'MyFileencoding',
        \   'mode': 'MyMode'
        \ },
        \ 'component_expand': {
        \   'syntastic': 'SyntasticStatuslineFlat',
        \ },
        \ 'component_type': {
        \   'syntastic': 'error',
        \ }
        \ }
function! MyModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction
function! MyReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? '[ReadOnly]' : ''
endfunction
function! MyFilename()
  return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
        \  &ft == 'unite' ? unite#get_status_string() :
        \  &ft == 'vimshell' ? vimshell#get_status_string() :
        \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction
function! MyFugitive()
  try
    if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head')
      return fugitive#head()
    endif
  catch
  endtry
  return ''
endfunction
function! MyFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction
function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction
function! MyFileencoding()
  return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction
function! MyMode()
  return winwidth(0) > 60 ? lightline#mode() : ''
endfunction
let g:unite_force_overwrite_statusline = 0
let g:vimfiler_force_overwrite_statusline = 0
let g:vimshell_force_overwrite_statusline = 0

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
let g:user_emmet_mode = 'iv'
let g:user_emmet_leader_key = '<C-Y>'
let g:use_emmet_complete_tag = 1
let g:user_emmet_settings = {
            \ 'lang' : 'ja',
            \ 'html' : {
            \ 'filters' : 'html',
            \ },
            \ 'css' : {
            \ 'filters' : 'fc',
            \ },
            \ 'php' : {
            \ 'extends' : 'html',
            \ 'filters' : 'html',
            \ },
            \}
augroup EmmitVim
    autocmd!
    autocmd FileType * let g:user_emmet_settings.indentation = ' '[:&tabstop]
augroup END 

"タグのリスト表示
NeoBundleLazy 'majutsushi/tagbar', {
    \ "autoload" : { "commands": ["TagbarToggle"] }}
if ! empty(neobundle#get("tagbar"))
    " Width (default 40)
    let g:tagbar_width = 40
    " Map for toggle
    nn <silent> <leader>t :TagbarToggle<CR>
endif
"関数などの定義場所のソース表示
NeoBundleLazy 'wesleyche/SrcExpl', {
    \ "autoload" : { "commands": ["SrcExplToggle"]}}
if ! empty(neobundle#get("SrcExpl"))
    " Set refresh time in ms
    let g:SrcExpl_RefreshTime = 1000
    " Is Updae tags when SrcExpl is opened
    let g:SrcExpl_isUpdateTags = 0
    " Tag update command
    let g:SrcExpl_updateTagsCmd = 'ctags --sort=foldcase %'
    " Update all tags
    function! g:SrcExpl_UpdateAllTags()
        let g:SrcExpl_updateTagsCmd = 'ctags --sort=foldcase -R .'
        call g:SrcExpl_UpdateTags()
        let g:SrcExpl_updateTagsCmd = 'ctags --sort=foldcase %'
    endfunction
    " Source Explorer Window Height
    let g:SrcExpl_winHeight = 10
    nn [srce] <Nop>
    nm <Leader>E [srce]
    nn <silent> [srce]<CR> :SrcExplToggle<CR>
    nn <silent> [srce]u :call g:SrcExpl_UpdateTags()<CR>
    nn <silent> [srce]a :call g:SrcExpl_UpdateAllTags()<CR>
    nn <silent> [srce]n :call g:SrcExpl_NextDef()<CR>
    nn <silent> [srce]p :call g:SrcExpl_PrevDef()<CR>
endif
"TagBar,SrcExplをすべて表示
if ! empty(neobundle#get("SrcExpl")) &&
        \ ! empty(neobundle#get("tagbar"))
    nn <silent> <Leader>A :SrcExplToggle<CR> :TagbarToggle<CR>
endif
"QuickRun
NeoBundle 'thinca/vim-quickrun'
let g:quickrun_config = get(g:, 'quickrun_config', {})
" vimproc を使って非同期に実行し，結果を quickfix に出力する
let g:quickrun_config['_'] = {
    \ "hook/close_quickfix/enable_hook_loaded" : 1,
    \ "hook/close_quickfix/enable_success" : 1,
    \ "hook/close_buffer/enable_failure" : 1,
    \ "hook/close_buffer/enable_empty_data" : 1,
    \ "outputter" : "multi:buffer:quickfix",
    \ "outputter/buffer/split" : ":botright 8sp",
    \ 'runner' : 'vimproc',
    \ 'runner/vimproc/updatetime' : 40,
    \ }
"C or C++
"marching.vim
if executable('clang')
    NeoBundle "osyo-manga/vim-marching"
    let g:marching#clang_command = "clang"
    let g:marching#clang_command#options = {
        \ "cpp" : "-std=c++11"
        \ }
    if s:meet_neocomplete_requirements()
        let g:marching_enable_neocomplete = 1
        if !exists('g:neocomplete#force_omni_input_patterns')
            let g:neocomplete#force_omni_input_patterns = {}
        endif
        let g:neocomplete#force_omni_input_patterns.c =
            \ '[^.[:digit:] *\t]\%(\.\|->\)\w*'
        let g:neocomplete#force_omni_input_patterns.cpp =
            \ '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'
        let g:neocomplete#force_omni_input_patterns.objc =
            \ '\[\h\w*\s\h\?\|\h\w*\%(\.\|->\)'
        let g:neocomplete#force_omni_input_patterns.objcpp =
            \ '\[\h\w*\s\h\?\|\h\w*\%(\.\|->\)\|\h\w*::\w*'
    endif
endif
"C++11
NeoBundleLazy 'vim-jp/cpp-vim', {
    \ 'autoload' : {'filetypes' : 'cpp'}
    \ }
"C#
NeoBundleLazy 'nosami/Omnisharp', {
\   'autoload': {'filetypes': ['cs']},
\   'build': {
\     'mac': 'xbuild server/OmniSharp.sln',
\     'unix': 'xbuild server/OmniSharp.sln',
\   }
\ }
NeoBundle 'tpope/vim-dispatch'
augroup omnisharp_commands
    autocmd!
    "Set autocomplete function to OmniSharp (if not using YouCompleteMe completion plugin)
    autocmd FileType cs setlocal omnifunc=OmniSharp#Complete
    " Synchronous build (blocks Vim)
    "autocmd FileType cs nnoremap <F5> :wa!<cr>:OmniSharpBuild<cr>
    " Builds can also run asynchronously with vim-dispatch installed
    autocmd FileType cs nnoremap <leader>b :wa!<cr>:OmniSharpBuildAsync<cr>
    autocmd BufEnter,TextChanged,InsertLeave *.cs SyntasticCheck
    " Automatically add new cs files to the nearest project on save
    autocmd BufWritePost *.cs call OmniSharp#AddToProject()
    "show type information automatically when the cursor stops moving
    autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()
    "The following commands are contextual, based on the current cursor position.
    autocmd FileType cs nnoremap gd :OmniSharpGotoDefinition<cr>
    autocmd FileType cs nnoremap <leader>fi :OmniSharpFindImplementations<cr>
    autocmd FileType cs nnoremap <leader>ft :OmniSharpFindType<cr>
    autocmd FileType cs nnoremap <leader>fs :OmniSharpFindSymbol<cr>
    autocmd FileType cs nnoremap <leader>fu :OmniSharpFindUsages<cr>
    autocmd FileType cs nnoremap <leader>fm :OmniSharpFindMembers<cr> "finds members in the current buffer
    " cursor can be anywhere on the line containing an issue 
    autocmd FileType cs nnoremap <leader>x  :OmniSharpFixIssue<cr>  
    autocmd FileType cs nnoremap <leader>fx :OmniSharpFixUsings<cr>
    autocmd FileType cs nnoremap <leader>tt :OmniSharpTypeLookup<cr>
    autocmd FileType cs nnoremap <leader>dc :OmniSharpDocumentation<cr>
    autocmd FileType cs nnoremap <C-K> :OmniSharpNavigateUp<cr> "navigate up by method/property/field
    autocmd FileType cs nnoremap <C-J> :OmniSharpNavigateDown<cr> "navigate down by method/property/field
augroup END
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
autocmd BufRead,BufNewFile *.mkd  set filetype=markdown
autocmd BufRead,BufNewFile *.md  set filetype=markdown

nmap <Space>m <Plug>(quickhl-manual-this)
xmap <Space>m <Plug>(quickhl-manual-this)
nmap <Space>M <Plug>(quickhl-manual-reset)
xmap <Space>M <Plug>(quickhl-manual-reset)
nmap <Space>j <Plug>(quickhl-cword-toggle)
nmap <Space>] <Plug>(quickhl-tag-toggle)
map H <Plug>(operator-quickhl-manual-this-motion)
let g:quickhl_cword_enable_at_startup = 1 "初期化
"capture.vim キーバインド確認
NeoBundle 'tyru/capture.vim'
"コメントアウト
NeoBundle 'tyru/caw.vim'

"NeoBundle末尾
call neobundle#end()

" コメントアウトを切り替えるマッピング
" \c でカーソル行をコメントアウト
" 再度 \c でコメントアウトを解除
" 選択してから複数行の \c も可能
nmap \c <Plug>(caw:I:toggle)
vmap \c <Plug>(caw:I:toggle)
" \C でコメントアウトの解除
nmap \C <Plug>(caw:I:uncomment)
vmap \C <Plug>(caw:I:uncomment)
"新しい行のインデントを同じ行にする
set autoindent
filetype plugin indent on
filetype indent on
set nocindent
"ステータス行を常に表示
set laststatus=2
"入力したコマンドを表示
set showcmd
" 文字コードの自動認識
if &encoding !=# 'utf-8'
  set encoding=japan
  set fileencoding=japan
endif
if has('iconv')
  let s:enc_euc = 'euc-jp'
  let s:enc_jis = 'iso-2022-jp'
  " iconvがeucJP-msに対応しているかをチェック
  if iconv("\x87\x64\x87\x6a", 'cp932', 'eucjp-ms') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'eucjp-ms'
    let s:enc_jis = 'iso-2022-jp-3'
  " iconvがJISX0213に対応しているかをチェック
  elseif iconv("\x87\x64\x87\x6a", 'cp932', 'euc-jisx0213') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'euc-jisx0213'
    let s:enc_jis = 'iso-2022-jp-3'
  endif
  " fileencodingsを構築
  if &encoding ==# 'utf-8'
    let s:fileencodings_default = &fileencodings
    let &fileencodings = s:enc_jis .','. s:enc_euc .',cp932'
    let &fileencodings = &fileencodings .','. s:fileencodings_default
    unlet s:fileencodings_default
  else
    let &fileencodings = &fileencodings .','. s:enc_jis
    set fileencodings+=utf-8,ucs-2le,ucs-2
    if &encoding =~# '^\(euc-jp\|euc-jisx0213\|eucjp-ms\)$'
      set fileencodings+=cp932
      set fileencodings-=euc-jp
      set fileencodings-=euc-jisx0213
      set fileencodings-=eucjp-ms
      let &encoding = s:enc_euc
      let &fileencoding = s:enc_euc
    else
      let &fileencodings = &fileencodings .','. s:enc_euc
    endif
  endif
  " 定数を処分
  unlet s:enc_euc
  unlet s:enc_jis
endif
" 日本語を含まない場合は fileencoding に encoding を使うようにする
if has('autocmd')
  function! AU_ReCheck_FENC()
    if &fileencoding =~# 'iso-2022-jp' && search("[^\x01-\x7e]", 'n') == 0
      let &fileencoding=&encoding
    endif
  endfunction
  autocmd BufReadPost * call AU_ReCheck_FENC()
endif
" 改行コードの自動認識
set fileformats=unix,dos,mac
" □とか○の文字があってもカーソル位置がずれないようにする
if exists('&ambiwidth')
  set ambiwidth=double
endif
"プログラム言語毎の設定
"Ruby
compiler ruby
let ruby_space_error=1
"C++
if executable("clang++")
  let g:syntastic_cpp_compiler = 'clang++'
  let g:syntastic_cpp_compiler_options = '-std=c++11'
  let g:quickrun_config['cpp/clang++11'] = {
      \ 'command' : 'clang++',
      \ 'cmdopt': '--std=c++11 --stdlib=libc++',
      \ 'exec' : '%c %o -o %s:p:r %s'
    \ }
  let g:quickrun_config['cpp'] = {'type': 'cpp/clang++11'}
elseif executable("g++")
  let g:syntastic_cpp_compiler = 'g++'
  let g:syntastic_cpp_compiler_options = '--std=c++11'
  let g:quickrun_config['cpp11'] = {
      \ 'command' : 'g++',
      \ 'cmdopt' : '--std=c++11',
      \ 'exec' : '%c %o -o %s:p:r %s'
      \ }
  let g:quickrun_config['cpp'] = {'type' : 'cpp11'}
endif
"Tex
let g:tex_flavor='latex'
let g:quickrun_config['latex'] = {
    \ 'command' : 'latexmk',
    \ 'cmdopt' : '-pdfdvi',
    \ 'outputter' : 'error',
    \ 'outputter/error/error' : 'quickfix',
    \ 'exec' : ['%c %o %s','%c -c','open %s:r.pdf']
    \ }

"Auto Open quickfix-window
autocmd QuickFixCmdPost *grep* cwindow
"キーマッピングの変更
nnoremap s <Nop>
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L
nnoremap sH <C-w>H
nnoremap sr <C-w>r
nnoremap s= <C-w>=
nnoremap sw <C-w>w
nnoremap so <C-w>_<C-w>
nnoremap sO <C-w>=
nnoremap st :<C-u>tabnew<CR>
nnoremap sT :<C-u>Unite tab<CR>
nnoremap ss :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>
nnoremap sb :<C-u>Unite buffer_tab -buffer-name=file<CR>
nnoremap sB :<C-u>Unite buffer -buffer-name=file<CR>
nnoremap sm :<C-u>Unite file_mru buffer<CR>
nnoremap sf :<C-u>Unite file<CR>
