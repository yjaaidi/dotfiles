#!/usr/bin/env zsh

set -e

PROJECT_ROOT="$(realpath $(dirname $0))"
GITCONFIG_PATH="$PROJECT_ROOT/files/.gitconfig"

for file_path in $PROJECT_ROOT/files/.*;
do
  ln -sf "$file_path" "$HOME"
done

for program in \
  gping \
  jq \
  pinentry-mac \
  pyenv \
  volta \
  watch \
  xz
do
  which "$program" || brew install "$program"
done

which gpg || brew install gpg2 gnupg
grep pinentry-mac "$HOME/.gnupg/gpg-agent.conf" || (echo "pinentry-program $(brew --prefix)/bin/pinentry-mac" > "$HOME/.gnupg/gpg-agent.conf")
grep use-agent "$HOME/.gnupg/gpg.conf" || (echo 'use-agent' > "$HOME/.gnupg/gpg.conf")

which python3 || (pyenv install 3 && pyenv global 3)

volta install node@latest
which prism || npm i -g @stoplight/prism-cli
which newman || npm i -g newman

SCRIPTS_PATH="$HOME/dev/yjaaidi/scripts"
if [ ! -d "$SCRIPTS_PATH" ]; then
  git clone https://github.com/yjaaidi/scripts.git "$SCRIPTS_PATH"
fi

# Oh My Zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Nx completions
NX_COMPLETIONS_PATH="$HOME/.oh-my-zsh/custom/plugins/nx-completion"
if [ ! -d "$NX_COMPLETIONS_PATH" ]; then
  git clone https://github.com/jscutlery/nx-completion.git "$NX_COMPLETIONS_PATH"
fi

# Generate gpg key
if [ $(gpg --list-secret-keys | wc -l) -eq 0 ]; then
  gpg --full-generate-key
  keyid=$(gpg -K --keyid-format SHORT | grep sec | cut -d ' ' -f4 | cut -d '/' -f 2)
  sed -i '' "s|signingkey = .*|signingkey = $keyid|" "$GITCONFIG_PATH"
fi

# Generate ssh key
key_path="$HOME/.ssh/id_rsa"
if [ ! -f "$key_path" ]; then
  ssh-keygen -t rsa -b 4096
  ssh-add --apple-use-keychain "$key_path"
fi
