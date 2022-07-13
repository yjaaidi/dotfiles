#!/usr/bin/env sh

set -e
set -x

FILES=".angular-config.json \
  .bash_profile \
  .git \
  .gitconfig \
  .yarnrc \
  .zshrc
"

for FILE in $FILES;
do
  ln -sf "$PWD/$FILE" "$HOME"
done

