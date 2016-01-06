source ~/.zsh/user_autoload/common/basic.sh
case ${OSTYPE} in
  darwin*)
    source ~/.zsh/user_autoload/osx/basic.sh
    ;;
  linux*)
    source ~/.zsh/user_autoload/linux/basic.sh
    ;;
esac
