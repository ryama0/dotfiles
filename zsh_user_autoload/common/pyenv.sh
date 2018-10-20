# pyenv
if [ -d "$HOME/.pyenv" ]; then
  export PYENV_ROOT="$HOME/.pyenv"
  if [ -d "$PYENV_ROOT/bin" ]; then
    export PATH="${PYENV_ROOT}/bin:${PATH}"
  fi
  if command -v pyenv 1>/dev/null 2>&1; then
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
  fi
fi
