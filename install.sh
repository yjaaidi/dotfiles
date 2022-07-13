#!/usr/bin/env zsh

set -e
set -x

for file_path in files/.*;
do
  ln -sf "$PWD/$file_path" "$HOME"
done

