#!/usr/bin/env zsh
#
# Enables this repo to be autoloaded by ZSH frameworks that support
# oh-my-zsh compatible plugins.

KUBECTX_DIR="$(dirname $0)/kubectx"
COMPLETION_DIR="${KUBECTX_DIR}/completion"
export PATH=${PATH}:${KUBECTX_DIR}

if [[ ! -f "${COMPLETION_DIR}/_kubectx.zsh" ]]; then
  pushd "$KUBECTX_DIR"
  git submodule init
  git submodule update
  popd
fi

# Load completions
fpath=($COMPLETION_DIR $fpath)
