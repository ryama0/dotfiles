# 重複排除
typeset -U path PATH cdpath CDPATH fpath FPATH manpath MANPATH

source ~/.zsh/conf.d/common/base.rc.sh
source ~/.zsh/conf.d/common/prompt.rc.sh
case ${OSTYPE} in
  darwin*)
    source ~/.zsh/conf.d/darwin/base.rc.sh
    ;;
  linux*)
    source ~/.zsh/conf.d/linux/base.rc.sh
    ;;
  cygwin*)
    source ~/.zsh/conf.d/cygwin/base.sh
    ;;
  msys*)
    source ~/.zsh/conf.d/msys/base.sh
    ;;
  *)
    ;;
esac
source ~/.zsh/conf.d/common/comp.rc.sh
for file in "~/.zsh/local/"*.rc.sh(Nn); do
  source "$file"
done
