#!/bin/bash 

cd ~/Desktop




rustup-init

rust install rust-analyzer




sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting 

git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions 

curl -L https://raw.githubusercontent.com/sbugzu/gruvbox-zsh/master/gruvbox.zsh-theme > ~/.oh-my-zsh/custom/themes/gruvbox.zsh-theme 

cp -r ~/Desktop/configs/zshrc ~/.zshrc




curl -Ls https://raw.githubusercontent.com/jarun/nnn/master/plugins/getplugs | sh

export NNN_PLUG='f:finder;o:fzopen;p:mocplay;d:diffs;t:nmount;v:imgview'




curl -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-361.0.0-linux-x86_64.tar.gz 

tar -xf google-cloud-sdk-361.0.0-linux-x86_64.tar.gz 
./google-cloud-sdk/install.sh -q 




git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim

