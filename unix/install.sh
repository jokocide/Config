#!/bin/sh
SCRIPT_DIR="$( cd "$( dirname "$0" )" && pwd )"

zsh="${HOME}/.zshrc"
if [ ! -f $zsh ]
then
  ln -s "${SCRIPT_DIR}/zsh/zshrc" $zsh
  source $zsh
fi

ssh="${HOME}/.ssh/config"
if [ ! -f $ssh ]
then
  ln -s "${SCRIPT_DIR}/ssh/config" $ssh
fi

vim="${HOME}/.vimrc"
if [ ! -f $vim ]
then
  ln -s "${SCRIPT_DIR}/vim/vimrc" $vim
fi

bin="${HOME}/.bin"
if [ ! -d $bin ]  
then
  mkdir $bin
fi
