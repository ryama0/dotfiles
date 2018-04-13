# for Linux
alias ls='ls --color=auto'

# linuxbrew
function set_linuxbrew() {
  if [ -e $HOME/.linuxbrew/ ]; then
    export PATH="$HOME/.linuxbrew/bin:$PATH"
    export MANPATH="$HOME/.linuxbrew/share/man:$MANPATH"
    export INFOPATH="$HOME/.linuxbrew/share/info:$INFOPATH"
  fi
}

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

distri_name=`get_linux_distribution`
set_linuxbrew
case ${distri_name} in
    Ubuntu)
        alias package-upgrade='sudo apt-get update && sudo apt-get upgrade -y && sudo apt-get dist-upgrade -y && sudo apt-get autoremove -y'
        ;;
esac

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

# pyenv
if [ -e $HOME/.pyenv ]; then
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="${PYENV_ROOT}/bin:${PATH}"
  if command -v pyenv 1>/dev/null 2>&1; then
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
  fi
fi
