#!/usr/bin/env bash
#shellcheck shell=bash
set -e
"$KUBEFIRST_PROJECT_ROOT/run" -id alephz-ai/devcontainer-features devspace build
devcontainer build --workspace-folder "$KUBEFIRST_PROJECT_ROOT"
