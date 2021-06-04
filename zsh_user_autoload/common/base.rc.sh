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

### Gitの情報を表示
autoload -Uz vcs_info
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
zstyle ':vcs_info:*' formats "%F{cyan}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () { vcs_info }
RPROMPT=$RPROMPT'${vcs_info_msg_0_}'

### SSHログイン時のプロンプト
[ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
  PROMPT="%{${fg[white]}%}${HOST%%.*} ${PROMPT}"
;

### Title (user@hostname)
case "${TERM}" in
kterm*|xterm*)
  precmd() {
    echo -ne "\033]0;${USER}@${HOST%%.*}\007"
    vcs_info
  }
  ;;
esac

alias ll="ls -la"