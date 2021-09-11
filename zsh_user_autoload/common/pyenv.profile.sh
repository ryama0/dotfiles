if [ -d "$HOME/.pyenv" ]; then
  export PYENV_ROOT="$HOME/.pyenv"
  export path=(
    $PYENV_ROOT/bin(N-/)
    $path
  )
fi

if `which pyenv >> /dev/null 2>&1`; then
  eval "$(pyenv init --path)"
fi
