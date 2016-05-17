# for cygwin
# aliases
alias vi=vim
alias ls='ls --color=auto'
alias ll='ls -la'
alias open='explorer'

echo -n "ssh-agent: "
source ~/.ssh-agent-info

ssh-add -l >& /dev/null
if [ $? == 2 ] ; then
  echo -n > ~/.ssh-agent-info
  source ~/.ssh-agent-info
fi

if ssh-add -l >& /dev/null ; then
  echo "ssh-agent: Identity is already stored."
else
  ssh-add
fi

