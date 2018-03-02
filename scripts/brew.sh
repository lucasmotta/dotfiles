#!/usr/bin/env bash

############################################
title "H o m e b r e w"
############################################


# install homebrew
if ! which brew > /dev/null; then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# make sure we’re using the latest homebrew
brew update

# upgrade any already-installed formulae
brew upgrade

# install basics stuff
brew install fish
brew install git
brew install node
brew install ruby
brew install yarn

# install apps
brew install 1password
brew install appcleaner
brew install atom
brew install firefox
brew install google-chrome
brew install harvest
brew install iterm2
brew install opera
brew install phoenix
brew install sketch
brew install slack
brew install spotify
brew install vlc

# quick look plugins (https://github.com/sindresorhus/quick-look-plugins)
brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json qlimagesize webpquicklook suspicious-package quicklookase qlvideo

# remove outdated versions from the cellar
brew cleanup
