#!/usr/bin/env zsh
#
# Enables this repo to be autoloaded by ZSH frameworks that support
# oh-my-zsh compatible plugins.

KUBECTX_DIR="$(dirname $0)/kubectx"
OH_MY_ZSH_DIR="$(dirname $0)/../../.."
export PATH=${PATH}:${KUBECTX_DIR}

if [[ ! -f "${KUBECTX_DIR}/completion/kubectx.zsh" ]]; then
  pushd "$KUBECTX_DIR"
  git submodule init
  git submodule update
  popd
fi

function loadCompletions()
{
  COMPLETION_DIR="${OH_MY_ZSH_DIR}/completions"
  if [ ! -d ${COMPLETION_DIR} ]; then # Check if completion directory exists
    mkdir -p ${COMPLETION_DIR}
    chmod -R 755 ${COMPLETION_DIR}
  fi
  ZSH_COMPLETION_FILE="${COMPLETION_DIR}/_kubectx.zsh"
  if [ ! -f ${ZSH_COMPLETION_FILE} ]; then # Check if zsh completion file exists
    ln -s ${KUBECTX_DIR}/completion/kubectx.zsh ${ZSH_COMPLETION_FILE}
    ln -s ${KUBECTX_DIR}/completion/kubens.zsh ${COMPLETION_DIR}/_kubens.zsh
  fi
}

# Load completions
loadCompletions
