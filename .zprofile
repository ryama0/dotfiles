source ~/.zsh/conf.d/common/base.profile.sh
case ${OSTYPE} in
  darwin*)
    source ~/.zsh/conf.d/darwin/base.profile.sh
    ;;
  linux*)
    source ~/.zsh/conf.d/linux/base.profile.sh
    ;;
  *)
    ;;
esac
for file in "~/.zsh/local/"*.profile.sh(Nn); do
  source "$file"
done
