#!/usr/bin/env bash

set -euo pipefail

BREW_SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BREWFILE="$BREW_SCRIPT_DIR/../Brewfile"

############################################
echo "Homebrew"
############################################

# install homebrew
if ! command -v brew >/dev/null 2>&1; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

if [ -x /opt/homebrew/bin/brew ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
elif [ -x /usr/local/bin/brew ]; then
  eval "$(/usr/local/bin/brew shellenv)"
fi

# make sure we’re using the latest homebrew
brew update

# install formulae and casks from Brewfile
brew bundle --file "$BREWFILE"

# install appstore apps
if ! mas install 937984704; then
  echo "Skipping Amphetamine: mas install failed (likely not signed in to the App Store)"
fi
if ! mas install 1287239339; then
  echo "Skipping ColorSlurp: mas install failed (likely not signed in to the App Store)"
fi
if ! mas install 310633997; then
  echo "Skipping WhatsApp: mas install failed (likely not signed in to the App Store)"
fi
if ! mas install 497799835; then
  echo "Skipping Xcode: mas install failed (likely not signed in to the App Store)"
fi

# remove outdated versions from the cellar
brew cleanup
