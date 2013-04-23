#!/bin/sh

TIMESTAMP=`date +%s`

# Install vim configuration files
mv ~/.vimrc /tmp/.vimrc-$TIMESTAMP
cp ./vim/.vimrc ~/.vimrc

mv ~/.gvimrc /tmp/.gvimrc-$TIMESTAMP
cp ./vim/.gvimrc ~/.gvimrc

rsync -vaz vim/.vim/ ~/.vim

# Install xterm configuration file
mv ~/.Xresources /tmp/.Xresources-$TIMESTAMP
cp ./xterm/.Xresources ~/.Xresources

# Install bash_scripts
rsync -vaz bash_scripts/ ~/bash_scripts

# Install devilspie config
rsync -vaz devilspie/ ~/.devilspie

# Install bashrc
mv ~/.bashrc /tmp/.bashrc-$TIMESTAMP
cp ./bash/.bashrc ~/.bashrc

# Install zshrc
mv ~/.zshrc /tmp/.zshrc-$TIMESTAMP
cp ./zsh/.zshrc ~/.zshrc

# Install global gitignore
mv ~/.gitignore /tmp/.gitignore-$TIMESTAMP
cp ./git/.gitignore ~/.gitignore
git config --global core.excludesfile ~/.gitignore

