#!/bin/sh

TIMESTAMP=`date +%s`

# Install vim configuration files
mv ~/.vimrc /tmp/.vimrc-$TIMESTAMP
cp ./vim/.vimrc ~/.vimrc
mkdir -p ~/.vimundo

mv ~/.gvimrc /tmp/.gvimrc-$TIMESTAMP
cp ./vim/.gvimrc ~/.gvimrc

mv ~/.vim /tmp/.vim-$TIMESTAMP
mkdir ~/.vim
cp -r ./vim/.vim/* ~/.vim

# Install xterm configuration file
mv ~/.Xdefaults /tmp/.Xdefaults-$TIMESTAMP
cp ./xterm/.Xdefaults ~/.Xdefaults
