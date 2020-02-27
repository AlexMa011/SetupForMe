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
fi

