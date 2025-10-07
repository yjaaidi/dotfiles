export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="bureau"

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

plugins=(
  gcloud
  git
  macos
  ng
  nx-completion
  # bundler
  # dotenv
  # kubectl
  # rake
  # rbenv
  # ruby
)

source $ZSH/oh-my-zsh.sh

# User configuration

eval "$(pyenv init -)"

# You may need to manually set your language environment
export GPG_TTY=$(tty)
export LANG=en_US.UTF-8

export PATH="$HOME/.poetry/bin:$PATH"
export PATH="$HOME/.volta/bin:$PATH"
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.console-ninja/.bin:$PATH"

export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

# Join PDF
function join() {
  gs -dNOPAUSE -sDEVICE=pdfwrite -sOUTPUTFILE=$1 -dBATCH ${@:2}
}

# tabtab source for packages
# uninstall by removing these lines
[[ -f ~/.config/tabtab/zsh/__tabtab.zsh ]] && . ~/.config/tabtab/zsh/__tabtab.zsh || true

source "$HOME/dev/yjaaidi/scripts/aliases"

# bun completions
[ -s "/Users/y/.bun/_bun" ] && source "/Users/y/.bun/_bun"

ssh-add --apple-use-keychain ~/.ssh/id_rsa 2> /dev/null

alias clean-caches="docker system prune --all --force; npm cache clean -f; yarn cache clean -f"
alias gh-go-to-last-action='open $(gh run list --json url | jq -r ".[0].url")'
alias ghpr="git push; gh pr create -f; gh pr merge -d -s --auto"
alias lsoflisten="lsof -iTCP -sTCP:LISTEN -P -n"
alias p="pnpm"
alias rmnm="mv node_modules /tmp; rm -Rf /tmp/node_modules &"