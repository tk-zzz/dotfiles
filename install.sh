#!/bin/bash

DOTPATH=~/dotfiles

for f in .??*
do
    [ "$f" = ".git" ] && continue
    [ "$f" = ".gitignore" ] && continue
    [ "$f" = ".gitmodules" ] && continue
    [ "$f" = "README.md" ] && continue
    ln -sf "$DOTPATH/$f" "$HOME"/"$f"
done
