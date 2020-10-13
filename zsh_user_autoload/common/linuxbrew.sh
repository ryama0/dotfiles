linuxbrew_home=''
if [ -e "$HOME/.linuxbrew" ]; then
  linuxbrew_home="$HOME/.linuxbrew"
elif [ -e "/home/linuxbrew/.linuxbrew" ]; then
  linuxbrew_home="/home/linuxbrew/.linuxbrew"
fi

if [ -n "$linuxbrew_home" -a -e "$linuxbrew_home/bin/brew" ]; then
  eval $("$linuxbrew_home/bin/brew" shellenv)
fi

unset linuxbrew_home

