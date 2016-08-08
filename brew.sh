#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade --all

# Install GNU core utilities (those that come with OS X are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
sudo ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum

# Install latest zsh.
brew install zsh -v

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names

# Install `wget` with IRI support.
brew install wget --with-iri -v

# Install Python
brew install python -v
brew install python3 -v

# Install Golang
brew install go -v

# Install ruby-build and rbenv
brew install ruby-build -v
brew install rbenv -v
LINE='eval "$(rbenv init -)"'
grep -q "$LINE" ~/.extra || echo "$LINE" >> ~/.extra

# Install more recent versions of some OS X tools.
brew install vim --override-system-vi -v
brew install homebrew/dupes/grep -v
brew install homebrew/dupes/openssh -v

# Install font tools.
brew tap bramstein/webfonttools -v
brew install sfnt2woff -v
brew install sfnt2woff-zopfli -v
brew install woff2 -v

# Install some CTF tools; see https://github.com/ctfs/write-ups.
brew install aircrack-ng -v
brew install dex2jar -v
brew install nmap -v

# Install other useful binaries.
brew install ack -v
brew install git -v
brew install git-lf -vs
brew install git-flow -v
brew install git-hubflow -v
brew install git-extras -v
brew install imagemagick --with-webp -v
brew install lua -v
brew install direnv -v

# Lxml and Libxslt
brew install libxml2 -v
brew install libxslt -v
brew link libxml2 --force
brew link libxslt --force

# Install Cask
brew install caskroom/cask/brew-cask
brew tap caskroom/versions

# Core casks
brew cask install --appdir="/Applications" alfred
brew cask install --appdir="~/Applications" iterm2
brew cask install --appdir="~/Applications" java

# Development tool casks
brew cask install --appdir="/Applications" atom
brew cask install --appdir="/Applications" visual-studio-code
brew cask install --appdir="/Applications" virtualbox
brew cask install --appdir="/Applications" vagrant
brew cask install --appdir="/Applications" macdown

# Misc casks
brew cask install --appdir="/Applications" google-chrome
brew cask install --appdir="/Applications" firefox
brew cask install --appdir="/Applications" skype
brew cask install --appdir="/Applications" slack
brew cask install --appdir="/Applications" dropbox
brew cask install --appdir="/Applications" evernote
brew cask install --appdir="/Applications" 1password

# Link cask apps to Alfred
brew cask alfred link

# Install developer friendly quick look plugins; see https://github.com/sindresorhus/quick-look-plugins
brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json qlprettypatch quicklook-csv betterzipql qlimagesize webpquicklook suspicious-package

# Remove outdated versions from the cellar.
brew cleanup
