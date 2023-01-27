#!/bin/bash 


rustup-init

# nodejs16
fnm install 16

$(brew --prefix)/opt/fzf/install

curl -Ls https://raw.githubusercontent.com/jarun/nnn/master/plugins/getplugs | sh

#git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim

#npm install --global particle-cli rollup typescript typescript-language-server vscode-langservers-extracted serialport

npm install --global particle-cli rollup typescript typescript-language-server serialport



