colorscheme darkblue

"縦幅
set lines=40
"横幅
set columns=120
"フォント
let OSTYPE = system('uname')
if OSTYPE == "Linux\n"
    set guifont=Ricty\ Discord\ 14
else
    set guifont=Ricty\ Discord\ Regular:h14
end

"ビープ音なし
set visualbell t_vb=
"半透明
set showtabline=2	"タブを常に表示
if has('gui_macvim')
	colorscheme darkblue
	"set noimdisableactivate
	set transparency=15
	autocmd FocusGained * set transparency=15
	autocmd FocusLost * set transparency=45
elseif has('win32')
	autocmd FocusGained * set transparency=220
	autocmd FocusLost * set transparency=128
end
