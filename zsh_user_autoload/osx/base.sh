source ~/.zsh/user_autoload/osx/env.sh

#source ~/.zsh/user_autoload/osx/clang.sh

# sudo用のpathを設定
typeset -xT SUDO_PATH sudo_path
typeset -U sudo_path
sudo_path=({/usr/local,/usr,}/sbin(N-/))
# MONO
export MONO_GAC_PREFIX="/usr/local"

# coreutils
if [ -d /usr/local/opt/coreutils/libexec/gnubin ]; then
  export PATH=/usr/local/opt/coreutils/libexec/gnubin:${PATH}
  export MANPATH=/usr/local/opt/coreutils/libexec/gnuman:${MANPATH}
fi

# aliases
alias vi=vim
alias ls='ls --color=auto'
alias ll='ls -la'

# SSH
ssh-add -K

# zsh-completions `brew install zsh-completions`
if [ -e "$(which brew)" -a -e "$(brew --prefix)/share/zsh-completions" ] ; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
  autoload -Uz compinit
  compinit
fi

source ~/.zsh/user_autoload/osx/clipctl.sh
source ~/.zsh/user_autoload/osx/pkgctl.sh
