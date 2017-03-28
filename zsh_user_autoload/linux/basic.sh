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
        alias package-upgrade='sudo apt-get update && sudo apt-get upgrade -y && sudo apt-get dist-upgrade -y'
        ;;
esac

if [ -z "${REMOTEHOST}${SSH_CONNECTION}" ]; then
  eval `ssh-agent`
  ssh-add
fi
