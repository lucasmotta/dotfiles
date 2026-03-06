#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

############################################
# Dependencies
############################################
bash "$SCRIPT_DIR/scripts/xcode.sh"
bash "$SCRIPT_DIR/scripts/brew.sh"
bash "$SCRIPT_DIR/scripts/fish.sh"

############################################
# Symlink
############################################
mkdir -p ~/.config/fish

ln -fs "$SCRIPT_DIR/.editorconfig" ~/.editorconfig
ln -fs "$SCRIPT_DIR/.gitconfig" ~/.gitconfig
ln -fs "$SCRIPT_DIR/.gitignore" ~/.gitignore
ln -fs "$SCRIPT_DIR/.hushlogin" ~/.hushlogin
ln -fs "$SCRIPT_DIR/.vimrc" ~/.vimrc
ln -fs "$SCRIPT_DIR/config.fish" ~/.config/fish/config.fish

############################################
# Other packages
############################################

# Volta
curl -fsSL https://get.volta.sh | bash

if command -v volta >/dev/null 2>&1; then
  volta install node
elif [ -x "$HOME/.volta/bin/volta" ]; then
  "$HOME/.volta/bin/volta" install node
fi
