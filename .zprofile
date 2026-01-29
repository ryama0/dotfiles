source ~/.zsh/user_autoload/common/base.profile.sh
case ${OSTYPE} in
  darwin*)
    source ~/.zsh/user_autoload/osx/base.profile.sh
    ;;
  linux*)
    source ~/.zsh/user_autoload/linux/base.profile.sh
    ;;
  *)
    ;;
esac
