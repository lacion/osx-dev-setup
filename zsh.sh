#!/usr/bin/env bash

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

cp dotfiles/themes/cobalt2.zsh-theme ~/.oh-my-zsh/themes/cobalt2.zsh-theme
cp dotfiles/.zshrc ~/.zshrc

