source ~/.zsh/user_autoload/osx/env.sh

# for OSX
NATIVE_CLANG=/usr/bin/clang

function get_c_include_path() {
  local lines=
  ${NATIVE_CLANG} -x c -v -E /dev/null |& grep Xcode.app | grep -v ignoring | grep -v clang | grep -v /dev/null | gawk '{print $1}' | while read line; do lines=${lines}:$line; done
  echo $lines | gawk '{print gensub(/:(.+)$/,"\\1","g")}'
}

function get_cpp_include_path() {
  local lines=
  ${NATIVE_CLANG} -x c++ -v -E /dev/null |& grep Xcode.app | grep -v ignoring | grep -v clang | grep -v /dev/null | gawk '{print $1}' | while read line; do lines=${lines}:$line; done
  echo $lines | gawk '{print gensub(/:(.+)$/,"\\1","g")}'
}
c_include_path=`get_c_include_path`
cpp_include_path=`get_cpp_include_path`

export C_INCLUDE_PATH=${c_include_path}
export CPLUS_INCLUDE_PATH=${cpp_include_path}
export CPATH=${CPLUS_INCLUDE_PATH}
export LD_LIBRARY_PATH=/usr/local/lib
export INCLUDE=/usr/local/include

# sudo用のpathを設定
typeset -xT SUDO_PATH sudo_path
typeset -U sudo_path
sudo_path=({/usr/local,/usr,}/sbin(N-/))
# MONO
export MONO_GAC_PREFIX="/usr/local"

# coreutils
if [ -d /usr/local/opt/coreutils/libexec/gnubin ]; then
  export PATH=/usr/local/opt/coreutils/libexec/gnubin:${PATH}
  export MANPATH=/usr/local/opt/coreutils/libexec/gnuman:${MANPATH}
fi

# aliases
alias vi=vim
alias ls='ls --color=auto'
alias ll='ls -la'

# SSH
ssh-add -K

# zsh-completions `brew install zsh-completions`
if [ -e "$(which brew)" -a -e "$(brew --prefix)/share/zsh-completions" ] ; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
  autoload -Uz compinit
  compinit
fi

source ~/.zsh/user_autoload/osx/clipctl.sh
source ~/.zsh/user_autoload/osx/pkgctl.sh
