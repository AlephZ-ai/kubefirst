#!/usr/bin/env bash
#shellcheck shell=bash
set -e
git update-index --add --chmod=+x "$KUBEFIRST_PROJECT_ROOT/run"
chmod +x "$KUBEFIRST_PROJECT_ROOT/run"
find "$KUBEFIRST_PROJECT_ROOT/.devcontainer/scripts" -type f -iname "*.sh" -exec git update-index --add --chmod=+x "{}" \;
find "$KUBEFIRST_PROJECT_ROOT/.devcontainer/scripts" -type f -iname "*.sh" -exec chmod +x "{}" \;
find "$KUBEFIRST_PROJECT_ROOT/.devcontainer/scripts" -type f -iname "*.sh" -exec dos2unix "{}" \;
