# rust
source ~/.zsh/user_autoload/common/rust.profile.sh

# homebrew
if type 'brew' > /dev/null 2>&1; then
  source ~/.zsh/user_autoload/osx/homebrew.profile.sh
fi

# krew
source ~/.zsh/user_autoload/common/krew.profile.sh
