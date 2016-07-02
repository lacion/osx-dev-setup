#!/usr/bin/env bash

echo ""
echo "------------------------------"
echo "Updating OSX and installing Xcode command line tools"
echo "------------------------------"
echo ""
./osxprep.sh

echo ""
echo "------------------------------"
echo "Installing Homebrew along with some formulae and apps."
echo "This might awhile to complete, as some formulae need to be installed from source."
echo "------------------------------"
echo ""
./brew.sh

echo ""
echo "------------------------------"
echo "Setting up JavaScript web development environment."
echo "------------------------------"
echo ""
./web.sh

echo ""
echo "------------------------------"
echo "Setting up zsh config"
echo "------------------------------"
echo ""
./zsh.sh

echo ""
echo "------------------------------"
echo "Setting sensible OSX defaults."
echo "------------------------------"
echo ""
./osx.sh

echo ""
echo "------------------------------"
echo "Setting cloud tools."
echo "------------------------------"
echo ""
./cloud.sh