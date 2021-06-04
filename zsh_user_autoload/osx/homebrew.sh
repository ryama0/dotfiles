HOMEBREW_PREFIX=`brew --prefix`

# sudo用のpathを設定
sudo_path=({"$HOMEBREW_PREFIX",/usr,}/sbin(N-/))

# MONO
export MONO_GAC_PREFIX="$HOMEBREW_PREFIX"

# brew install coreutils
if [ -d "${HOMEBREW_PREFIX}/opt/coreutils/libexec/gnubin" ]; then
  alias ls="${HOMEBREW_PREFIX}/bin/gls --color=auto"
fi

# zsh-completions `brew install zsh-completions`
if [ -d "${HOMEBREW_PREFIX}/share/zsh-completions" ] ; then
  FPATH="${HOMEBREW_PREFIX}/share/zsh-completions:$FPATH"
fi

unset HOMEBREW_PREFIX
