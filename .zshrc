source ~/.zsh/user_autoload/common/base.sh
case ${OSTYPE} in
  darwin*)
    echo "Load settings for macos"
    source ~/.zsh/user_autoload/osx/base.sh
    ;;
  linux*)
    echo "Load settings for Linux"
    source ~/.zsh/user_autoload/linux/base.sh
    ;;
  cygwin*)
    echo "Load settings for Cygwin"
    source ~/.zsh/user_autoload/cygwin/base.sh
    ;;
  msys*)
    echo "Load settings for MSYS"
    source ~/.zsh/user_autoload/msys/base.sh
    ;;
  *)
    echo "Skip to load settings for specified OS"
esac
source ~/.zsh/user_autoload/common/comp.sh

# 重複排除
typeset -U path cdpath fpath manpath

