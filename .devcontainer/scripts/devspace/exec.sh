#!/usr/bin/env bash
#shellcheck shell=bash
set -e
commandPath="$1"
command="$2"
"$KUBEFIRST_PROJECT_ROOT/run" -id alephz-ai/devcontainer-features devspace build
"$KUBEFIRST_PROJECT_ROOT/run" devspace up
containerid=$(docker ps -q -f name="$KUBEFIRST_PROJECT_NAME-devspace")
devcontainer exec --container-id "$containerid" zsh -l -c "\$KUBEFIRST_PROJECT_ROOT/run $commandPath $command"
