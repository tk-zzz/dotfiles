#!/bin/bash

DOTPATH=~/dotfiles
#if [ ! -e "$DOTPATH/molokai/colors/molokai.vim" ]; then
#    echo "molokai is not installed, clone from git."
#    rm $DOTPATH/molokai -rf
#    cd $DOTPATH
#    git clone https://github.com/tomasr/molokai.git
#else
#    echo "molokai is already installed."
#fi

if [ -e "$DOTPATH/.git/modules/molokai "]; then
    echo "molokai is already added as submodule."
else
    echo "molokai is not added yet."
    git submodule add https://github.com/tomasr/molokai
fi

git submodule foreach git pull origin master

if [ ! -e "~/.vim/colors" ]; then
    mkdir -p ~/.vim/colors
fi

ln -sf "$DOTPATH/molokai/colors/molokai.vim" ~/.vim/colors/
#TODO remove "colorscheme molokai" "set t_Co=256" from .vimrc
#and set them from this scrpit.
