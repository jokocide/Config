#!/bin/sh

SCRIPT_PATH=${BASH_SOURCE[0]}
SCRIPT_NAME=${PROG_PATH##*/}
SCRIPT_DIR="$(cd "$(dirname "${SCRIPT_PATH:-$PWD}")" 2>/dev/null 1>&2 && pwd)"

ZSH_CONTROL=0
SSH_CONTROL=0
VIM_CONTROL=0

#
# Zsh
#
if test -f "${HOME}/.zshrc"; then
  echo "${HOME}/.zshrc already exists, skipped."
else
  ln -s "${SCRIPT_DIR}/zsh/zshrc" "${HOME}/.zshrc"
fi

#
# SSH
#
mkdir ${HOME}/.ssh &> /dev/null
if test -f "${HOME}/.ssh/config"; then
  echo "${HOME}/.ssh/config already exists, skipped."
else
  ln -s "${SCRIPT_DIR}/ssh/config" "${HOME}/.ssh/config"
fi

#
# Vim 
#
if test -f "${HOME}/.vimrc"; then
  echo "${HOME}.vimrc already exists, skipped."
else
  ln -s "${SCRIPT_DIR}/vim/vimrc" "${HOME}/.vimrc"
fi

source "${HOME}/.zshrc"
