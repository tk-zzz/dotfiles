#!/bin/bash

DOTPATH=~/dotfiles

git submodule update --init
git submodule foreach git fetch
git submodule foreach git pull origin master

for module in $( ls ./.git/modules ); do
    cd ${modules}
    git switch master
    cd ..
done


if [ ! -e "~/.vim/colors" ]; then
    mkdir -p ~/.vim/colors
fi

ln -sf "$DOTPATH/molokai/colors/molokai.vim" ~/.vim/colors/
#TODO remove "colorscheme molokai" "set t_Co=256" from .vimrc
#and set them from this scrpit.
