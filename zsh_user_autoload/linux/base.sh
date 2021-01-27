source ~/.zsh/user_autoload/linux/env.sh

# for Linux
alias ls='ls --color=auto'

# Linuxディストリ判定
function get_linux_distribution() {
  local distri_name=""
  if [ -e /etc/debian_version ] || [ -e /etc/debian_release ]; then
    if [ -e /etc/lsb-release ]; then
      distri_name="Ubuntu"
    else
      distri_name="Debian"
    fi
  elif [ -e /etc/fedora-release ]; then
    distri_name="Fedora"
  elif [ -e /etc/centos-release ]; then
    distri_name="CentOS"
  elif [ -e /etc/redhat-release ]; then
    distri_name="RedHat"
  else
    distri_name="Unknown"
  fi
  echo ${distri_name}
}

mkdir -p ${HOME}/.ssh/
SSH_ENV="${HOME}/.ssh/.agent-environment"
function start_ssh_agent() {
  ssh-agent | grep -v echo > "${SSH_ENV}"
  chmod 0600 "${SSH_ENV}"
  . "${SSH_ENV}"
  ssh-add
}

if [ -z "${REMOTEHOST}${SSH_CONNECTION}" ]; then
# ssh非接続時
  if [ -f "${SSH_ENV}" ]; then
    . "${SSH_ENV}"
    ps aux | grep ${SSH_AGENT_PID} | grep ssh-agent > /dev/null || start_ssh_agent
  else
    start_ssh_agent
  fi
fi

source ~/.zsh/user_autoload/linux/clipctl.sh
source ~/.zsh/user_autoload/linux/pkgctl.sh
