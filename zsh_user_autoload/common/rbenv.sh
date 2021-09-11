if [ -d "$HOME/.rbenv" ]; then
  export path=(
    $HOME/.rbenv/bin(N-/)
    $path
  )
  eval "$(rbenv init -)"
fi
