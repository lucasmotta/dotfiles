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
mkdir -p ~/.config/zed

ln -fs "$SCRIPT_DIR/.editorconfig" ~/.editorconfig
ln -fs "$SCRIPT_DIR/.gitconfig" ~/.gitconfig
ln -fs "$SCRIPT_DIR/.gitignore" ~/.gitignore
ln -fs "$SCRIPT_DIR/.hushlogin" ~/.hushlogin
ln -fs "$SCRIPT_DIR/.vimrc" ~/.vimrc
ln -fs "$SCRIPT_DIR/config.fish" ~/.config/fish/config.fish
ln -fs "$SCRIPT_DIR/zed/keymap.json" ~/.config/zed/keymap.json
ln -fs "$SCRIPT_DIR/zed/settings.json" ~/.config/zed/settings.json

if command -v pre-commit >/dev/null 2>&1; then
  (
    cd "$SCRIPT_DIR"
    pre-commit install --install-hooks
  )
fi

############################################
# Other packages
############################################

# Volta
curl -fsSL https://get.volta.sh | bash

if command -v volta >/dev/null 2>&1; then
  volta install node@lts pnpm@latest
elif [ -x "$HOME/.volta/bin/volta" ]; then
  "$HOME/.volta/bin/volta" install node@lts pnpm@latest
fi

# Claude Code
if ! command -v claude >/dev/null 2>&1 && ! command -v claude-code >/dev/null 2>&1; then
  curl -fsSL https://claude.ai/install.sh | bash
fi

# Codex CLI
if ! command -v codex >/dev/null 2>&1; then
  if command -v npm >/dev/null 2>&1; then
    npm i -g @openai/codex
  elif [ -x "$HOME/.volta/bin/npm" ]; then
    "$HOME/.volta/bin/npm" i -g @openai/codex
  fi
fi

# Bun
if ! command -v bun >/dev/null 2>&1 && [ ! -x "$HOME/.bun/bin/bun" ]; then
  curl -fsSL https://bun.com/install | bash
fi
