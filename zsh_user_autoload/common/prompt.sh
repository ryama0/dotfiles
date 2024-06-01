## 色の設定
export LSCOLORS=Exfxcxdxbxegedabagacad
### プロンプトに色
autoload -U colors; colors
#プロンプト定義内で変数置換やコマンド置換を扱う
setopt prompt_subst

function setup_prompt() {
    # ユーザー名 "${user}@${host}"
    local tmp_prompt_user="%{${fg[white]}%}[%n@${HOST%%.*}]%{${reset_color}%}"
    # カレントディレクトリ "[${pwd}]"
    local tmp_prompt_pwd="%{${fg[green]}%}[%~]%{${reset_color}%}"
    # 入力行
    local tmp_prompt_input="%{${fg[cyan]}%}%# %{${reset_color}%}"
    # 前回コマンドの終了コード
    local tmp_prompt_return="%(?.%{$fg[cyan]%}.${fg[red]}%})[return:%?]%{${reset_color}%}"
    # 2行以上のコマンド用 "> "
    local tmp_prompt2="%{${fg[cyan]}%}%_> %{${reset_color}%}"
    # スペル訂正用プロンプト
    local tmp_sprompt="%{${fg[yellow]}%}%r is correct? [Yes, No, Abort, Edit]:%{${reset_color}%}"

    ### Gitの情報を表示
    autoload -Uz vcs_info
    zstyle ':vcs_info:git:*' check-for-changes true
    zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
    zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
    zstyle ':vcs_info:*' formats "%F{cyan}%c%u[%b]%f"
    zstyle ':vcs_info:*' actionformats '[%b|%a]'
    precmd () { vcs_info }
    local tmp_prompt_git='${vcs_info_msg_0_}'

    # 通常のプロンプト
    PROMPT="${tmp_prompt_user}${tmp_prompt_return}${tmp_prompt_pwd}${tmp_prompt_git}"$'\n'"${tmp_prompt_input}"
    # セカンダリのプロンプト(コマンドが2行以上の時に表示される)
    PROMPT2=$tmp_prompt2
    # スペル訂正用プロンプト
    SPROMPT=$tmp_sprompt
}

setup_prompt
unset setup_prompt
