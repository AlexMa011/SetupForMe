#!/bin/bash

# oh-my-zsh install
if [ ! -e ~/.oh-my-zsh ]
then
	sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
	#sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
fi
echo 'oh my zsh installed!'

env_path=$(realpath env.sh)
written=$(cat ~/.zshrc | grep ${env_path} | wc -l)
if [ ${written} -eq 0 ]
then
  echo "source ${env_path}" >> ~/.zshrc
fi

# powerlevel10k install
if [ ! -e ~/.oh-my-zsh/custom/themes/powerlevel10k ]
then
	git clone https://github.com/romkatv/powerlevel10k.git /home/alex/.oh-my-zsh/custom/themes/powerlevel10k
fi
echo 'powerlevel10k installed!'

# neovim install 
if [ ! -e nvim.appimage ]
then
	curl -LO https://github.com/neovim/neovim/releases/download/stable/nvim.appimage
	chmod u+x nvim.appimage
	vim_path=$(realpath nvim.appimage)
fi
echo 'nvim installed!'

if [ ! -e ~/.SpaceVim ]
then
  curl -sLf https://spacevim.org/install.sh | bash
  vim
  vim
fi
echo 'SpaceVim installed!'

echo 'Updateing SpaceVim'
git -C ~/.SpaceVim pull

cp init.toml ~/.SpaceVim.d
