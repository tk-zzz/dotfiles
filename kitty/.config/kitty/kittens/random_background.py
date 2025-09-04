#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import os
import random
import subprocess
from pathlib import Path

# -----------------------------------------------------------
# ▼ ここに、あなたの画像フォルダの場所を書いてください
# -----------------------------------------------------------
# `~` を使って、ホームディレクトリからの場所を指定できます
WALLPAPER_DIR = '~/dotfiles/kitty/.config/kitty/wallpaper'
# -----------------------------------------------------------


def main(args):
    # `~` を、実際のホームディレクトリのパスに変換します
    wallpaper_path = Path(os.path.expanduser(WALLPAPER_DIR))
    
    # もし、そのフォルダが存在しなかったら、お仕事を終えます
    if not wallpaper_path.is_dir():
        print(f"Error: Directory not found at {wallpaper_path}")
        return

    # フォルダの中にある画像ファイルを探します
    # (.png, .jpg, .jpegという名前で終わるものを探しますね)
    image_files = list(wallpaper_path.glob('*.png')) + \
                  list(wallpaper_path.glob('*.webp')) + \
                  list(wallpaper_path.glob('*.jpg')) + \
                  list(wallpaper_path.glob('*.jpeg'))

    # もし画像が一枚も見つからなかったら、お仕事を終えます
    if not image_files:
        print(f"No images found in {wallpaper_path}")
        return

    # 見つけた画像の中から、ランダムに一枚を選びます
    random_image = random.choice(image_files)

    # kittyに対して、「背景をこの画像に変えてください」とお願いする命令を作ります
    command = [
        'kitty',
        '@',
        'set-background-image',
        str(random_image) # パスを文字列に変換します
    ]

    # 命令を実行します
    subprocess.run(command)


# このファイルが直接呼ばれたときに、mainを実行するためのお約束です
if __name__ == '__main__':
    main([])

