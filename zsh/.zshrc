#!/bin/zsh

PROMPT='🐰:%~$ '

alias ll='ls -la'
stty stop undef

autoload -U compinit
compinit


# --- ローカル設定の読み込み ---
[ -f ~/.zshrc.local ] && source ~/.zshrc.local
