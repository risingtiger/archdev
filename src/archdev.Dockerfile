# TO DO 
#
# NNN & Broot
#     - understand Broot better
#     - text and file preview
#
# nvim
#     - Robost code collapsing/expanding
#     - Treesitter going
#     - Navigate tree sitter driven tags of symobls (functions primarily) 
#
#     - install vim-matchup to get same name vars etc to light up
#     - Get icons going
#     - Get GitSigns working so it doesn't hide the line numbers
#     - LuaSnips working
#     - incorporate Hop or lightspeed to navigate based on two letters etc
#     - Get Lsp Signatures working right or something like it
#     - Better padding/colors and icons for lsp-cmp
#     - Mod lualine to make sense for me and take out file name appearing below it
#     - Check out Saga cool lsp functions plugin
#
# VERSION               0.0.4

FROM	 archlinux:latest
MAINTAINER 	Davis Hammon <davis_at_risingtiger.com>
RUN mkdir /tmphldr 
ADD config /tmphldr/
ADD cppforlsp /tmphldr/
ADD nnn-4.3-1-x86_64.pkg.tar.zst /tmphldr/
ADD entrypoint-docker.sh /tmphldr/
ADD id_ed25519 /tmphldr/

RUN mkdir -p /root/.local/bin \
&& mkdir -p /root/.ssh \
&& mkdir -p /root/.config/nvim \

&& chmod u=rwx,g=,o= /root/.ssh \
&& mv /tmphldr/id_ed25519 /root/.ssh/. \
&& chmod u=rw,g=,o= /root/.ssh/id_ed25519 \

&& mv /tmphldr/config/.zshrc /root/. \
&& mv /tmphldr/config/nvim /root/.config/. \


# Install Broot! Holy Shit its awesome. 
# install pacman -S base-devel  first since its required to install broot
# but, ought to find a way to just install precompiled broot cause base-devel and cargo install takes a LOOONG time
# cargo install broot 


RUN pacman -Syy --noconfirm \
&& pacman -Syu --noconfirm \
&& RUN pacman -S --noconfirm ccls \
&& RUN pacman -S --noconfirm fd \
&& RUN pacman -S --noconfirm fzf \
&& RUN pacman -S --noconfirm git \
&& RUN pacman -S --noconfirm htop \
&& RUN pacman -S --noconfirm neovim \
&& RUN	pacman -S --noconfirm nodejs \
&& RUN	pacman -S --noconfirm npm \
&& RUN	pacman -S --noconfirm openssh \
&& RUN	pacman -S --noconfirm ripgrep \
&& RUN	pacman -S --noconfirm rsync \
&& RUN	pacman -S --noconfirm sd \
&& RUN	pacman -S --noconfirm time \
&& RUN	pacman -S --noconfirm tree \
&& RUN pacman -S --noconfirm unzip \
&& RUN pacman -S --noconfirm wget \
&& RUN	pacman -S --noconfirm zsh

RUN /usr/bin/ssh-keygen -A \
&& echo 'root:roottoor' | chpasswd \
&& sed -i -e 's/^UsePAM yes/UsePAM no/g' /etc/ssh/sshd_config 
EXPOSE 22

RUN npm install --global particle-cli rollup zx typescript typescript-language-server

RUN cd /tmphldr \
&& curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y \
&& curl -L https://github.com/rust-analyzer/rust-analyzer/releases/latest/download/rust-analyzer-x86_64-unknown-linux-gnu.gz | gunzip -c - > ~/.local/bin/rust-analyzer

RUN cd /tmphldr \
&& echo "Y" | sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" \
&& git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting \
&& git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions \
&& curl -L https://raw.githubusercontent.com/sbugzu/gruvbox-zsh/master/gruvbox.zsh-theme > ~/.oh-my-zsh/custom/themes/gruvbox.zsh-theme 

RUN cd /tmphldr \
&& mv /tmphldr/nnn-4.3-1-x86_64.pkg.tar.zst /root/. \
&& tar -I zstd -xvf nnn-4.3-1-x86_64.pkg.tar.zst \
&& mv /tmphldr/usr/local/bin/nnn /usr/local/bin/. \
&& curl -Ls https://raw.githubusercontent.com/jarun/nnn/master/plugins/getplugs | sh \
&& export NNN_PLUG='f:finder;o:fzopen;p:mocplay;d:diffs;t:nmount;v:imgview'

RUN cd /tmphldr \
&& curl -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-361.0.0-linux-x86_64.tar.gz \
&& tar -xf google-cloud-sdk-361.0.0-linux-x86_64.tar.gz \
&& ./google-cloud-sdk/install.sh -q \

RUN cd /tmphldr \
&& git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim

RUN git config --global user.email "davis@risingtiger.com" \
&&  git config --global user.name "Davis Hammon"


RUN rm -r /tmphldr


RUN export PATH="/root/.local/share:$PATH" \
&& export PATH="/root/.local/bin:$PATH" \
&& export PATH="$HOME/.cargo/bin:$PATH"  \
&& export PATH="/google-cloud-sdk/bin:$PATH"

# Run openssh daemon
CMD	 ["/usr/sbin/sshd", "-D"]



