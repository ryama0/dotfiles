" 内部処理コードを設定
set encoding=utf-8

" 空のファイルの文字コードを設定
set fileencoding=&encoding

" 文字コードの自動認識
set fileencodings=ucs-bom,utf-8,iso-2022-jp,cp932,euc-jp,default,latin

" 改行コードの自動認識
set fileformats=unix,dos,mac
" □とか○の文字があってもカーソル位置がずれないようにする
if exists('&ambiwidth')
  set ambiwidth=double
endif
