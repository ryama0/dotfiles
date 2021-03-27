source ~/.zsh/user_autoload/common/base.sh
case ${OSTYPE} in
  darwin*)
    echo "The settings for OSX have been read."
    source ~/.zsh/user_autoload/osx/base.sh
    ;;
  linux*)
    echo "The settings for Linux have been read."
    source ~/.zsh/user_autoload/linux/base.sh
    ;;
  cygwin*)
    echo "The settings for Cygwin have been read."
    source ~/.zsh/user_autoload/cygwin/base.sh
    ;;
  msys*)
    echo "The settings for MSYS have been read."
    source ~/.zsh/user_autoload/msys/base.sh
    ;;
  *)
    echo "The settings for specified OS have not been read."
esac
source ~/.zsh/user_autoload/common/comp.sh

# 重複排除
typeset -U path cdpath fpath manpath

