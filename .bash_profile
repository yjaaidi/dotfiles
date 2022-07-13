export NVM_DIR="/Users/r/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

export LANG=en_US.utf-8

export PATH="/usr/local/sbin:${PATH}:/usr/local/opt/android-sdk/bin"

export ANDROID_HOME=/usr/local/opt/android-sdk

export GOPATH=$HOME/golang
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin

. /usr/local/etc/bash_completion
. /Users/r/.git-completion.bash

if [ -f "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh" ]; then
  __GIT_PROMPT_DIR=$(brew --prefix)/opt/bash-git-prompt/share
  source "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh"
fi

eval "$(pyenv init -)"
# For pipenv.
export PIPENV_VENV_IN_PROJECT=true

# Too slow.
# eval "$(pyenv virtualenv-init -)"
alias py=python
alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"


