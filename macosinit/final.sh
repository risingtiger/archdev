#!/bin/bash 


fnm install 20

$(brew --prefix)/opt/fzf/install


npm install --global particle-cli
npm install --global @swc/cli
npm install --global @swc/core

cp -r ~/Desktop/ssh ~/.ssh
cp -r ~/Desktop/configs/kitty ~/.config/kitty
cp -r ~/Desktop/configs/karabiner ~/.config/karabiner
cp -r ~/Desktop/configs/nvim ~/.config/nvim
cp -r ~/Desktop/configs/ignore ~/.ignore
cp -r ~/Desktop/configs/gitconfig ~/.gitconfig
cp -r ~/Desktop/configs/zprofile ~/.zprofile
cp -r ~/Desktop/configs/zshrc ~/.zshrc

sh -c "$(curl -Ls https://raw.githubusercontent.com/jarun/nnn/master/plugins/getplugs)"

git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim


/opt/homebrew/bin/gh auth login
/opt/homebrew/bin/gh extension install github/gh-copilot

