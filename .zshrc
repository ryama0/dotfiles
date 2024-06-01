# 重複排除
typeset -U path PATH cdpath CDPATH fpath FPATH manpath MANPATH

source ~/.zsh/user_autoload/common/base.rc.sh
source ~/.zsh/user_autoload/common/prompt.sh
case ${OSTYPE} in
  darwin*)
    echo "Load settings for macOS"
    source ~/.zsh/user_autoload/osx/base.rc.sh
    ;;
  linux*)
    echo "Load settings for Linux"
    source ~/.zsh/user_autoload/linux/base.rc.sh
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
