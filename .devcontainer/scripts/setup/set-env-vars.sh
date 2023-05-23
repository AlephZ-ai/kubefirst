#!/usr/bin/env bash
#shellcheck shell=bash
#shellcheck source=/dev/null
set -e
projectRoot="$(dirname "$(dirname "$(dirname "$(cd -- "$(dirname -- "${BASH_SOURCE-$0}")" &> /dev/null && pwd)")")")"
set -o allexport
source "$projectRoot/.devcontainer/.env"
set +o allexport
export KUBEFIRST_PROJECT_ROOT="$projectRoot"
export KUBEFIRST_DEVCONTAINER_SCRIPTS_ROOT="$KUBEFIRST_PROJECT_ROOT/.devcontainer/scripts"
