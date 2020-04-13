#!/bin/bash

# zsh install
if [ -v $ZSH_VERSION ];then
	echo "Zsh already installed!"
else
	wget -O zsh.tar.xz https://sourceforge.net/projects/zsh/files/latest/download
	mkdir zsh && unxz zsh.tar.xz && tar -xvf zsh.tar -C zsh --strip-components 1
	cd zsh
	./configure --prefix=$HOME
	make
	make install
	echo "[ -f $HOME/bin/zsh ] && exec $HOME/bin/zsh -l" >> ~/.profile
  cd ..
fi

# oh-my-zsh install
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
#sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

rm env.sh
touch env.sh
env_path=$(realpath env.sh)

# powerlevel10k install
git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
echo "ZSH_THEME=powerlevel10k/powerlevel10k" >> env.sh

# neovim install 
curl -LO https://github.com/neovim/neovim/releases/download/stable/nvim.appimage
chmod u+x nvim.appimage
vim_path=$(realpath nvim.appimage)
echo "alias vim=${vim_path}" >> env.sh
