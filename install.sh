#!/usr/bin/env zsh

set -e

DIR_PATH="$(dirname $0)"


for program in \
  gping \
  jq \
  pinentry-mac \
  pyenv \
  volta \
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

if [ ! -d "$HOME/dev/yjaaidi/scripts" ]; then
  git clone https://github.com/yjaaidi/scripts.git "$HOME/dev/yjaaidi/scripts"
fi

# Oh My Zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Generate gpg key
if [ $(gpg --list-secret-keys | wc -l) -eq 0 ]; then
  gpg --full-generate-key
  keyid=$(gpg -K --keyid-format SHORT | grep sec | cut -d ' ' -f4 | cut -d '/' -f 2)
  sed -i '' "s|signingkey = .*|signingkey = $keyid|" "$HOME/.gitconfig"
fi

# Generate ssh key
key_path="$HOME/.ssh/id_rsa"
if [ ! -f "$key_path" ]; then
  ssh-keygen -t rsa -b 4096
  ssh-add --apple-use-keychain "$key_path"
fi

for file_path in $DIR_PATH/files/.*;
do
  ln -sf "$file_path" "$HOME"
done

