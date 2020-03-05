#!/bin/bash

RESOURCEPATH=$(pwd)/resources

cd $RESOURCEPATH
for f in .??*
do
    if [ -f "$HOME/$f" -a ! -L "$HOME/$f" ]; then
        echo "back up $f in /$(date "+%Y%m%d")bk"
        mkdir ../$(date "+%Y%m%d")bk
        cp "$HOME/$f" "../$(date "+%Y%m%d")bk/"
    fi
    ln -sf "$RESOURCEPATH"/"$f" "$HOME"/"$f"
done
cd ..
