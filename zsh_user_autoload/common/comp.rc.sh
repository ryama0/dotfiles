autoload -Uz compinit; compinit	#補完機能を有効
setopt auto_list		#補完候補一覧で表示(d)
setopt auto_menu		#補完キー連打で補完候補を順に表示(d)
setopt list_packed		#補完候補をできるだけ詰めて表示
setopt list_types		#補完候補にファイルん種類も表示
setopt combining_chars	#保管時に濁点・半濁点を<3099><309a>のように表示させない
bindkey "^[[Z" reverse-menu-complete	#Shift-Tabで補完候補を逆順("\e[Z"でも動作する)
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'	#補完時に大文字小文字を区別しない

setopt extended_glob
unsetopt caseglob	#ファイルグロブで大文字小文字を区別しない

### 補完時の色の設定
export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
### ZLS_COLORSとは？
export ZLS_COLORS=$LS_COLORS
export CLICOLORS=true
### 補完候補に色を付ける
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
### 補完候補をハイライト
zstyle ':completion*default' menu select=2
### オプションの補完にセパレータ
zstyle ':completion:*' list-separator '-->'
zstyle ':completion:*:manuals' separate-sections true
