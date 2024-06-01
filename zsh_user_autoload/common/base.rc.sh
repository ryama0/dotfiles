# zshの設定
## ユーザー定義
export EDITOR=vim	#エディタをvimに設定
setopt no_beep		#ビープ音
setopt auto_pushd	#cd時にディレクトリスタックにpushdする
setopt correct		#コマンドのスペルを訂正する
setopt magic_equal_subst	#=以降も保管する
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
