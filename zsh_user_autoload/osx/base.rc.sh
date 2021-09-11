typeset -xT SUDO_PATH sudo_path

alias vi=vim
# use keychain passphrase
ssh-add -K &> /dev/null

source ~/.zsh/user_autoload/osx/env.sh
#source ~/.zsh/user_autoload/osx/clang.sh
#source ~/.zsh/user_autoload/osx/coreutils.sh
if type 'brew' > /dev/null 2>&1; then
  source ~/.zsh/user_autoload/osx/homebrew.sh
fi
source ~/.zsh/user_autoload/osx/clipctl.sh
source ~/.zsh/user_autoload/osx/pkgctl.sh

typeset -U sudo_path
