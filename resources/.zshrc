#!/bin/zsh

PROMPT='%n@%m:%~$ '

export ANDROID_HOME=~/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/platform-tools
export JAVA_HOME=/Applications/Android\ Studio.app/Contents/jre/jdk/Contents/Home
export PATH=$PATH:$JAVA_HOME/bin

alias ll='ls -la'
stty stop undef

autoload -U compinit
compinit
