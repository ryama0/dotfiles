source ~/.zsh/user_autoload/common/basic.sh
case ${OSTYPE} in
  darwin*)
    echo "The settings for OSX have been read."
    source ~/.zsh/user_autoload/osx/basic.sh
    ;;
  linux*)
    echo "The settings for Linux have been read."
    source ~/.zsh/user_autoload/linux/basic.sh
    ;;
  cygwin*)
    echo "The settings for Cygwin have been read."
    source ~/.zsh/user_autoload/cygwin/basic.sh
    ;;
  msys*)
    echo "The settings for MSYS have been read."
    source ~/.zsh/user_autoload/msys/basic.sh
    ;;
  *)
    echo "The settings for specified OS have not been read."
esac
