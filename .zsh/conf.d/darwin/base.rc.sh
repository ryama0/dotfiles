typeset -xT SUDO_PATH sudo_path

alias vi=vim
# use keychain passphrase
ssh-add -K &> /dev/null

if type 'brew' > /dev/null 2>&1; then
  source ~/.zsh/conf.d/darwin/homebrew.rc.sh
fi
source ~/.zsh/conf.d/darwin/function.rc.sh

typeset -U sudo_path

# mise
source ~/.zsh/conf.d/common/mise.rc.sh
