#!/usr/bin/env bash

set -euo pipefail

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

# upgrade any already-installed formulae
brew upgrade

# install basics stuff
brew install ccat
brew install fish
brew install gh
brew install git
brew install mas
brew install pyenv
brew install streamlink
brew install withgraphite/tap/graphite

# install apps
brew install --cask 1password
brew install --cask arc
brew install --cask google-chrome
brew install --cask imageoptim
brew install --cask iterm2
brew install --cask raycast
brew install --cask slack
brew install --cask spotify
brew install --cask visual-studio-code
brew install --cask zed@preview
brew install --cask zoom

# install appstore apps
if ! mas install 937984704; then
  echo "Skipping Amphetamine: mas install failed (likely not signed in to the App Store)"
fi
if ! mas install 1287239339; then
  echo "Skipping ColorSlurp: mas install failed (likely not signed in to the App Store)"
fi

# install fonts
brew install --cask font-iosevka
brew install --cask font-ibm-plex-mono
brew install --cask font-inter
brew install --cask font-geist
brew install --cask font-geist-mono

# remove outdated versions from the cellar
brew cleanup
