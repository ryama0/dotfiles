if [ -e ~/.1password/agent.sock ]; then
  export SSH_AUTH_SOCK=~/.1password/agent.sock
fi
