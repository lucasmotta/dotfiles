#!/usr/bin/env bash

############################################
title "Homebrew"
############################################


# install homebrew
if ! which brew > /dev/null; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
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
brew install ruby
brew install tree
brew install watchman

# install apps
brew install --cask 1password
brew install --cask android-studio
brew install --cask appcleaner
brew install --cask brave-browser
brew install --cask finicky
brew install --cask firefox
brew install --cask flipper
brew install --cask google-chrome
brew install --cask imageoptim
brew install --cask iterm2
brew install --cask kap
brew install --cask maccy
brew install --cask opera
brew install --cask phoenix
brew install --cask reactotron
brew install --cask sketch
brew install --cask slack
brew install --cask spotify
brew install --cask transmission
brew install --cask visual-studio-code
brew install --cask vlc
brew install --cask whatsapp
brew install --cask zeplin
brew install --cask zoomus

# install appstore apps
mas 937984704       # Amphetamine
mas 1287239339      # ColorSlurp

# install fonts
brew tap homebrew/cask-fonts
brew cask install font-iosevka

# remove outdated versions from the cellar
brew cleanup
