#!/bin/sh

SCRIPT=$(realpath $0)
SCRIPTDIR=$(dirname $SCRIPT)

# Install ZSH
if test -f "${HOME}/.zshrc"; then
  echo ".zshrc exists."
else
  ln -s "${SCRIPTDIR}/zsh/zshrc" "${HOME}/.zshrc"
fi
