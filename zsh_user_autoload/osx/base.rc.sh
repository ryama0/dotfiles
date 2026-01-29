typeset -xT SUDO_PATH sudo_path

alias vi=vim
# use keychain passphrase
ssh-add -K &> /dev/null

if type 'brew' > /dev/null 2>&1; then
  source ~/.zsh/user_autoload/osx/homebrew.rc.sh
fi
source ~/.zsh/user_autoload/osx/clipctl.rc.sh
source ~/.zsh/user_autoload/osx/pkgctl.sh

typeset -U sudo_path
