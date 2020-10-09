export NVM_DIR="$HOME/.nvm"

# Load nvm
if [ -s "$NVM_DIR/nvm.sh" ]; then
  source "$NVM_DIR/nvm.sh"
elif [ -s "/usr/local/opt/nvm/nvm.sh" ]; then
  source "/usr/local/opt/nvm/nvm.sh"
elif [ -s "/home/linuxbrew/.linuxbrew/opt/nvm/nvm.sh" ]; then
  source "/home/linuxbrew/.linuxbrew/opt/nvm/nvm.sh"
fi

# Load nvm completion
if [ -s "/home/linuxbrew/.linuxbrew/opt/nvm/etc/bash_completion.d/nvm" ]; then
  source "/home/linuxbrew/.linuxbrew/opt/nvm/etc/bash_completion.d/nvm"
fi
