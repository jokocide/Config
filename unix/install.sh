#!/bin/sh
SCRIPT_DIR="$( cd "$( dirname "$0" )" && pwd )"

ln -s "${SCRIPT_DIR}/zsh/zshrc" "${HOME}/.zshrc"
ln -s "${SCRIPT_DIR}/ssh/config" "${HOME}/.ssh/config"
ln -s "${SCRIPT_DIR}/vim/vimrc" "${HOME}/.vimrc"

source "${HOME}/.zshrc"
