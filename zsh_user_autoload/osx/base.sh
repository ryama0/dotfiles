typeset -xT SUDO_PATH sudo_path

alias vi=vim
# use keychain passphrase
alias ssh-add='ssh-add -K'
function ssh() {
  ssh-add -l > /dev/null || ssh-add &> /dev/null
  command ssh "$@"
}

source ~/.zsh/user_autoload/osx/env.sh
#source ~/.zsh/user_autoload/osx/clang.sh
#source ~/.zsh/user_autoload/osx/coreutils.sh
if [ -e "$(which brew)" ]; then
  source ~/.zsh/user_autoload/osx/homebrew.sh
fi
source ~/.zsh/user_autoload/osx/clipctl.sh
source ~/.zsh/user_autoload/osx/pkgctl.sh

typeset -U sudo_path
