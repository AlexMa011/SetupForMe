#/bin/bash

echo '# zsh setting' > env.sh
echo 'export ZSH_THEME=powerlevel10k/powerlevel10k' >> env.sh
echo >> env.sh

echo '# vim setting' >> env.sh
echo "alias vim=$(realpath nvim.appimage)" >> env.sh
echo >> env.sh

echo '# tmux setting' >> env.sh
echo 'export TERM=xterm-256color' >> env.sh
echo >> env.sh

echo '# path setting' >> env.sh
local_path=$(realpath ~/.local/bin)
echo 'export PATH="'"${local_path}"':$PATH" ' >> env.sh
echo >> env.sh

echo '# zsh condig editor' >> env.sh
zshconfig="vim $(realpath ~/.zshrc)"
echo "alias zshconfig=\"${zshconfig}\" " >> env.sh
envconfig="vim $(realpath env.sh)"
echo "alias envconfig=\"${envconfig}\" " >> env.sh


