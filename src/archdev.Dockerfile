# TO DO 
#
# Vim Plug doesnt seem to be working. figure out how to install properly and to isntigate installing on plugins
# Remove entrypoint yada file from root directory
#
# VERSION               0.0.1

FROM	 archlinux:latest
MAINTAINER 	Davis Hammon <davis_at_risingtiger.com>
ADD .zshrc /
ADD init.vim /
ADD nnn-4.3-1-x86_64.pkg.tar.zst /
ADD entrypoint-docker.sh /


RUN	pacman -Sy --noconfirm nodejs
RUN	pacman -Sy --noconfirm npm
RUN pacman -Sy --noconfirm neovim

RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y \
&& export PATH="$HOME/.cargo/bin:$PATH"

RUN rm -r /usr/bin/tree-sitter \ 
&& yes | bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh) 





# Update the repositories
RUN	 pacman -Syy --noconfirm
RUN pacman -Syu --noconfirm

# Install openssh
# NOT needed yet RUN pacman -Sy --noconfirm base-devel
RUN pacman -Sy --noconfirm ccls
RUN pacman -Sy --noconfirm fd
RUN pacman -Sy --noconfirm fzf
RUN pacman -Sy --noconfirm git
RUN pacman -Sy --noconfirm htop
RUN pacman -Sy --noconfirm llvm
RUN pacman -Sy --noconfirm neovim
RUN	pacman -Sy --noconfirm nodejs
RUN	pacman -Sy --noconfirm npm
RUN	pacman -Sy --noconfirm openssh
# was different packages to choose from on Arch RUN pacman -Sy --noconfirm rename
RUN	pacman -Sy --noconfirm ripgrep
RUN	pacman -Sy --noconfirm rsync
RUN	pacman -Sy --noconfirm sd
RUN	pacman -Sy --noconfirm time
RUN	pacman -Sy --noconfirm tree
RUN pacman -Sy --noconfirm unzip
RUN pacman -Sy --noconfirm wget
RUN	pacman -Sy --noconfirm zsh

# Generate host keys
RUN  /usr/bin/ssh-keygen -A

# Add password to root user
RUN	 echo 'root:roottoor' | chpasswd

# Fix sshd
RUN  sed -i -e 's/^UsePAM yes/UsePAM no/g' /etc/ssh/sshd_config

# Expose tcp port
EXPOSE	 22

RUN npm install --global particle-cli rollup zx

RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y \
&& export PATH="$HOME/.cargo/bin:$PATH"

RUN rm -r /usr/bin/tree-sitter \ 
&& yes | bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh) 

RUN echo "Y" | sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" \
&& git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting \
&& git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions \
&& curl -L https://raw.githubusercontent.com/sbugzu/gruvbox-zsh/master/gruvbox.zsh-theme > ~/.oh-my-zsh/custom/themes/gruvbox.zsh-theme \
&& git clone https://github.com/agkozak/zsh-z $ZSH_CUSTOM/plugins/zsh-z

RUN cd /root \
&& mv /nnn-4.3-1-x86_64.pkg.tar.zst /root/. \
&& tar -I zstd -xvf nnn-4.3-1-x86_64.pkg.tar.zst \
&& mv /root/usr/local/bin/nnn /usr/local/bin/.

RUN mv /.zshrc ~/. \
&& export PATH="$HOME/.local/bin:$PATH" 

# Run openssh daemon
CMD	 ["/usr/sbin/sshd", "-D"]
