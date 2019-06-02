#!/bin/bash

DOTPATH=~/dotfiles
if [ ! -e "$DOTPATH/molokai/colors/molokai.vim" ]; then
    echo "molokai is not installed, clone from git."
    rm $DOTPATH/molokai -rf
    cd $DOTPATH
    git clone https://github.com/tomasr/molokai.git
else
    echo "molokai is already installed."
fi

if [ ! -e "~/.vim/colors" ]; then
    mkdir -p ~/.vim/colors
fi

ln -sf "$DOTPATH/molokai/colors/molokai.vim" ~/.vim/colors/
#TODO remove "colorscheme molokai" "set t_Co=256" from .vimrc
#and set them from this scrpit.
