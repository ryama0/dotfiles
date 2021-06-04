# for cygwin
# aliases
alias vi=vim
alias ls='ls --color=auto'
alias open='explorer'

SSHAGENT=/usr/bin/ssh-agent
SSHAGENTARGS="-s"
if [ -z "$SSH_AUTH_SOCK" -a -x "$SSHAGENT" ]; then
  echo "Start ssh-agent"
	eval `$SSHAGENT $SSHAGENTARGS` >& /dev/null
	trap "kill $SSH_AGENT_PID" 0
fi
ssh-add
