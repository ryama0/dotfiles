LINUXBREW_PREFIX=''
if [ -e "$HOME/.linuxbrew" ]; then
  LINUXBREW_PREFIX="$HOME/.linuxbrew"
elif [ -e "/home/linuxbrew/.linuxbrew" ]; then
  LINUXBREW_PREFIX="/home/linuxbrew/.linuxbrew"
fi

if [ -e "$LINUXBREW_PREFIX/bin/brew" ]; then
  eval $("$LINUXBREW_PREFIX/bin/brew" shellenv)
fi

# zsh-completions `brew install zsh-completions`
if [ -d "${LINUXBREW_PREFIX}/share/zsh/site-functions" ] ; then
  FPATH="${LINUXBREW_PREFIX}/share/zsh/site-functions:$FPATH"
fi

unset LINUXBREW_PREFIX
