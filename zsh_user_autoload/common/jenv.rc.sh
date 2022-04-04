if `which pyenv >> /dev/null 2>&1`; then
  export path=(
    $HOME/.jenv/bin(N-/)
    $path
  )
  eval "$(jenv init -)"
fi