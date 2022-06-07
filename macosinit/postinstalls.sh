#!/bin/bash 

rustup-init
source $HOME/.cargo/env








curl -L https://raw.githubusercontent.com/sbugzu/gruvbox-zsh/master/gruvbox.zsh-theme > ~/.oh-my-zsh/custom/themes/gruvbox.zsh-theme

cp -r ~/Desktop/configs/zshrc ~/.zshrc








curl -Ls https://raw.githubusercontent.com/jarun/nnn/master/plugins/getplugs | sh








git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim









