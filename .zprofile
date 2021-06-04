source ~/.zsh/user_autoload/common/base.profile.sh
case ${OSTYPE} in
  darwin*)
    echo "Load profile for macOS"
    source ~/.zsh/user_autoload/osx/base.profile.sh
    ;;
  linux*)
    echo "Load profile for Linux"
    source ~/.zsh/user_autoload/linux/base.profile.sh
    ;;
  *)
    echo "Skip to load settings for specified OS"
esac
