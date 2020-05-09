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
brew install ccat
brew install fish
brew install git
brew install ruby
brew install yarn
brew install tree
brew install watchman

# install apps
brew cask install 1password
brew cask install android-studio
brew cask install appcleaner
brew cask install brave-browser
brew cask install finicky
brew cask install firefox
brew cask install flipper
brew cask install google-chrome
brew cask install imageoptim
brew cask install iterm2
brew cask install kap
brew cask install maccy
brew cask install opera
brew cask install phoenix
brew cask install reactotron
brew cask install sketch
brew cask install slack
brew cask install spotify
brew cask install transmission
brew cask install visual-studio-code
brew cask install vlc
brew cask install whatsapp
brew cask install zeplin
brew cask install zoomus

# quick look plugins (https://github.com/sindresorhus/quick-look-plugins)
# brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json qlimagesize webpquicklook suspicious-package quicklookase qlvideo

# remove outdated versions from the cellar
brew cleanup
