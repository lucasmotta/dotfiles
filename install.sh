#!/usr/bin/env bash
source "$(pwd)/scripts/utils/title.sh"
source "$(pwd)/scripts/utils/question.sh"

question "Do you also want to reset MacOS prefs?"
read answerMacOS;

############################################
# Dependencies
############################################
source "$(pwd)/scripts/xcode.sh"
source "$(pwd)/scripts/brew.sh"
source "$(pwd)/scripts/fish.sh"

############################################
# Assets
############################################
open $(pwd)/assets/DuotoneDark.itermcolors

############################################
# Symlink
############################################
mkdir -p ~/.config/fish

ln -fs "$(pwd)/.editorconfig" ~/.editorconfig
ln -fs "$(pwd)/.gitconfig" ~/.gitconfig
ln -fs "$(pwd)/.gitignore" ~/.gitignore
ln -fs "$(pwd)/.hushlogin" ~/.hushlogin
ln -fs "$(pwd)/.phoenix.js" ~/.phoenix.js
ln -fs "$(pwd)/.finicky.js" ~/.finicky.js
ln -fs "$(pwd)/.vimrc" ~/.vimrc
ln -fs "$(pwd)/config.fish" ~/.config/fish/config.fish

############################################
# MacOS prefs
############################################
if echo "$answerMacOS" | grep -iq "^y" ;then
  title "M A C   O S   P R E F S"
  source "$(pwd)/scripts/macos.sh"
fi
