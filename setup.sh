#!/bin/bash

set -e
# oh-my-zsh install
if [ ! -e ~/.oh-my-zsh ]
then
	sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
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
	git clone https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k
  cat ~/.zshrc | sed 's#ZSH_THEME=.*#ZSH_THEME="powerlevel10k/powerlevel10k"#g' > zsh_config
  mv zsh_config ~/.zshrc
  source ~/.zshrc
fi
echo 'powerlevel10k installed!'

# neovim install 
curl -LO https://github.com/neovim/neovim/releases/download/stable/nvim.appimage
chmod u+x nvim.appimage
vim_path=$(realpath nvim.appimage)
echo 'nvim installed!'

curl -sLf https://spacevim.org/install.sh | bash
pip3 install --user pynvim
pip3 install --user flake8
pip3 install --user autoflake
pip3 install --user yapf
pip3 install --user isort
vim
vim
echo 'SpaceVim installed!'

echo 'Updateing SpaceVim'
git -C ~/.SpaceVim pull

cp init.toml ~/.SpaceVim.d
