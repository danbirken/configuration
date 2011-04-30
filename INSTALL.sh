#!/bin/sh

TIMESTAMP=`date +%s`

# Install vim configuration files
mv ~/.vimrc /tmp/.vimrc-$TIMESTAMP
cp ./vim/.vimrc ~/.vimrc
mkdir -p ~/.vimundo

mv ~/.gvimrc /tmp/.gvimrc-$TIMESTAMP
cp ./vim/.gvimrc ~/.gvimrc

rsync -vaz vim/.vim/ ~/.vim

# Install xterm configuration file
mv ~/.Xdefaults /tmp/.Xdefaults-$TIMESTAMP
cp ./xterm/.Xdefaults ~/.Xdefaults

# Install bash_scripts
rsync -vaz bash_scripts/ ~/bash_scripts

# Install devilspie config
rsync -vaz devilspie/ ~/.devilspie

# Install bashrc
mv ~/.bashrc /tmp/.bashrc-$TIMESTAMP
cp ./bash/.bashrc ~/.bashrc
