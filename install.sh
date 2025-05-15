#!/usr/bin/env bash


############################################
# Dependencies
############################################
source "$(pwd)/scripts/xcode.sh"
source "$(pwd)/scripts/brew.sh"
source "$(pwd)/scripts/fish.sh"

############################################
# Symlink
############################################
mkdir -p ~/.config/fish

ln -fs "$(pwd)/.editorconfig" ~/.editorconfig
ln -fs "$(pwd)/.gitconfig" ~/.gitconfig
ln -fs "$(pwd)/.gitignore" ~/.gitignore
ln -fs "$(pwd)/.hushlogin" ~/.hushlogin
ln -fs "$(pwd)/.vimrc" ~/.vimrc
ln -fs "$(pwd)/config.fish" ~/.config/fish/config.fish

############################################
# Other packages
############################################

# Volta
curl https://get.volta.sh | bash
volta install node
