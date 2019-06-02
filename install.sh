#!/bin/bash

DOTPATH=~/dotfiles

for f in .??*
do
    [ "$f" = ".git" ] && continue
    ln -sf "$DOTPATH/$f" "$HOME"/"$f"
done
