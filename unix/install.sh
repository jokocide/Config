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
  echo "~/.zshrc already exists."
else
  ln -s "${SCRIPT_DIR}/zsh/zshrc" "${HOME}/.zshrc"
fi

#
# SSH
#
if test -f "${HOME}/.ssh/config"; then
  echo "~/.ssh/config already exists."
else
  ln -s "${SCRIPT_DIR}/ssh/config" "${HOME}/.ssh/config"
fi

#
# Vim 
#
if test -f "${HOME}/.vimrc"; then
  echo "~/.vimrc already exists."
else
  ln -s "${SCRIPT_DIR}/vim/vimrc" "${HOME}/.vimrc"
fi

source "${HOME}/.zshrc"