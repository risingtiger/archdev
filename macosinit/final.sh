#!/bin/bash 


fnm install 20

$(brew --prefix)/opt/fzf/install

sh -c "$(curl -Ls https://raw.githubusercontent.com/jarun/nnn/master/plugins/getplugs)"

npm install --global particle-cli

cp -r ~/Desktop/ssh ~/.ssh
cp -r ~/Desktop/configs/kitty ~/.config/kitty
cp -r ~/Desktop/configs/karabiner ~/.config/karabiner
cp -r ~/Desktop/configs/nvim ~/.config/nvim
cp -r ~/Desktop/configs/ignore ~/.ignore
cp -r ~/Desktop/configs/gitignore ~/.gitignore

git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
