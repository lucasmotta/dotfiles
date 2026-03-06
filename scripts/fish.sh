#!/usr/bin/env bash

set -euo pipefail

############################################
echo "Fish Shell"
############################################

FISH_BIN="$(command -v fish || true)"
if [ -z "$FISH_BIN" ]; then
  echo "fish is not installed. Install fish first."
  exit 1
fi

# add fish to the list of acceptable shells (if not already present)
if ! grep -qx "$FISH_BIN" /etc/shells; then
  echo "$FISH_BIN" | sudo tee -a /etc/shells >/dev/null
fi

# change current shell to fish
if [ "${SHELL:-}" != "$FISH_BIN" ]; then
  chsh -s "$FISH_BIN"
fi

# install fisherman
fish -c '
if not functions -q fisher
  curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source
  fisher install jorgebucaran/fisher
end
fisher install pure-fish/pure
'
