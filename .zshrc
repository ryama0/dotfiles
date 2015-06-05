#PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
PATH=/usr/local/sbin:$PATH

# ICPC
if [ -e /opt/intel/bin/compilervars.sh ]; then
    source /opt/intel/bin/compilervars.sh intel64
fi
# zshの設定
## ユーザー定義
export EDITOR=vim	#エディタをvimに設定
setopt no_beep		#ビープ音
setopt auto_pushd	#cd時にディレクトリスタックにpushdする
setopt correct		#コマンドのスペルを訂正する
setopt magic_equal_subst	#=以降も保管する
setopt prompt_subst	#プロンプト定義内で変数置換やコマンド置換を扱う
setopt notify	#バックグラウンドジョブの状態変化を即時報告
setopt equals	#=commandを`which command`と同じ処理
bindkey -e #emacs

## Complement
autoload -U compinit; compinit	#補完機能を有効
setopt auto_list		#補完候補一覧で表示(d)
setopt auto_menu		#補完キー連打で補完候補を順に表示(d)
setopt list_packed		#補完候補をできるだけ詰めて表示
setopt list_types		#補完候補にファイルん種類も表示
setopt combining_chars	#保管時に濁点・半濁点を<3099><309a>のように表示させない
bindkey "^[[Z" reverse-menu-complete	#Shift-Tabで補完候補を逆順("\e[Z"でも動作する)
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'	#補完時に大文字小文字を区別しない

setopt extended_glob
unsetopt caseglob	#ファイルグロブで大文字小文字を区別しない

## History
HISTFILE=~/.zsh_history		#ヒストリを保存するファイル
HISTSIZE=10000			#メモリに保存されるヒストリの件数
SAVEHIST=10000			#保存されるヒストリの件数
setopt bang_hist		#!を使ったヒストリ展開を行う(d)
setopt extended_history		#ヒストリに実行時間も保存する
setopt hist_ignore_dups		#直前と同じコマンドはヒストリに追加しない
setopt share_history		#ほかのシェルのヒストリをリアルタイムで共有する
setopt hist_reduce_blanks	#余分なスペースを削除してヒストリに保存する

### マッチしたコマンドのヒストリを表示
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

### すべてのヒストリを表示
function history-all { history -E 1}

## 色の設定
export LSCOLORS=Exfxcxdxbxegedabagacad
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

### プロンプトに色
autoload -U colors; colors
### 一般ユーザ時
tmp_prompt="%{${fg[cyan]}%}%n%# %{${reset_color}%}"
tmp_prompt2="%{${fg[cyan]}%}%_> %{${reset_color}%}"
tmp_rprompt="%{${fg[green]}%}[%~]%{${reset_color}%}"
tmp_sprompt="%{${fg[yellow]}%}%r is correct? [Yes, No, Abort, Edit]:%{${reset_color}%}"

### rootユーザ時(太字にしアンダーバー
if [ ${UID} -eq 0 ]; then
  tmp_prompt="%B%U${tmp_prompt}%u%b"
  tmp_prompt2="%B%U${tmp_prompt2}%u%b"
  tmp_rprompt="%B%U${tmp_rprompt}%u%b"
  tmp_sprompt="%B%U${tmp_sprompt}%u%b"
fi

PROMPT=$tmp_prompt    # 通常のプロンプト
PROMPT2=$tmp_prompt2  # セカンダリのプロンプト(コマンドが2行以上の時に表示される)
RPROMPT=$tmp_rprompt  # 右側のプロンプト
SPROMPT=$tmp_sprompt  # スペル訂正用プロンプト

### SSHログイン時のプロンプト
[ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
  PROMPT="%{${fg[white]}%}${HOST%%.*} ${PROMPT}"
;

### Title (user@hostname)
case "${TERM}" in
kterm*|xterm*)
  precmd() {
    echo -ne "\033]0;${USER}@${HOST%%.*}\007"
  }
  ;;
esac

# OS別設定
## Mac
### 重複パスを登録しない
typeset -U path cdpath fpath manpath
### sudo用のpathを設定
typeset -xT SUDO_PATH sudo_path
typeset -U sudo_path
sudo_path=({/usr/local,/usr,}/sbin(N-/))
### pathを設定
path=(~/bin(N-/) /usr/local/bin(N-/) ${path})
### MONO
export MONO_GAC_PREFIX="/usr/local"

# Aliases
alias vi=vim
alias ll='ls -la'

## OS依存を解決
### 'ls'の問題
case ${OSTYPE} in
    darwin*)
        alias ls='gls --color=auto'
        ;;
    linux*)
        alias ls='ls --color=auto'
        ;;
esac

### Linuxディストリ判定
function get_linux_distribution() {
    local distri_name=""
    if [ -e /etc/debian_version ] || [ -e /etc/debian_release ]; then
        if [ -e /etc/lsb-release ]; then
            distri_name="Ubuntu"
        else
            distri_name="Debian"
        fi
    elif [ -e /etc/fedora-release ]; then
        distri_name="Fedora"
    elif [ -e /etc/centos-release ]; then
        distri_name="CentOS"
    elif [ -e /etc/redhat-release ]; then
        distri_name="RedHat"
    else
        distri_name="Unknown"
    fi
    echo ${distri_name}
}

### system-upgrade を定義
case ${OSTYPE} in
    darwin*)
        alias system-upgrade='brew update && brew upgrade --all && brew cask update && brew cleanup && brew cask cleanup && brew doctor'
        ;;
    linux*)
        distri_name=`get_linux_distribution`
        case ${distri_name} in
            Ubuntu)
                alias system-upgrade='sudo apt-get update && sudo apt-get upgrade -y && sudo apt-get dist-upgrade -y'
                ;;
        esac
        ;;
esac
