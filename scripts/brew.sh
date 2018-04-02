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
brew install tree

# install apps
brew cask install 1password
brew cask install appcleaner
brew cask install atom
brew cask install firefox
brew cask install google-chrome
brew cask install harvest
brew cask install iterm2
brew cask install kap
brew cask install opera
brew cask install phoenix
brew cask install sketch
brew cask install slack
brew cask install spotify
brew cask install vlc

# quick look plugins (https://github.com/sindresorhus/quick-look-plugins)
brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json qlimagesize webpquicklook suspicious-package quicklookase qlvideo

# remove outdated versions from the cellar
brew cleanup
