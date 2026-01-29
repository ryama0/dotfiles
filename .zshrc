# 重複排除
typeset -U path PATH cdpath CDPATH fpath FPATH manpath MANPATH

source ~/.zsh/user_autoload/common/base.rc.sh
source ~/.zsh/user_autoload/common/prompt.rc.sh
case ${OSTYPE} in
  darwin*)
    source ~/.zsh/user_autoload/osx/base.rc.sh
    ;;
  linux*)
    source ~/.zsh/user_autoload/linux/base.rc.sh
    ;;
  cygwin*)
    source ~/.zsh/user_autoload/cygwin/base.sh
    ;;
  msys*)
    source ~/.zsh/user_autoload/msys/base.sh
    ;;
  *)
    echo "Skip to load settings for specified OS"
esac
source ~/.zsh/user_autoload/common/comp.rc.sh
