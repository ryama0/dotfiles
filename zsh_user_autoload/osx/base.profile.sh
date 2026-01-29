# rust
source ~/.zsh/user_autoload/common/rust.profile.sh

# homebrew
if type 'brew' > /dev/null 2>&1; then
  source ~/.zsh/user_autoload/osx/homebrew.profile.sh
fi

# mise
source ~/.zsh/user_autoload/common/mise.profile.sh
