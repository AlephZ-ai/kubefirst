#!/usr/bin/env zsh
#shellcheck shell=bash
set -e
rm -f nohup.out
rm -f gcm-diagnose.log
"$KUBEFIRST_PROJECT_ROOT/run" setup devspace 
echo "Press Ctrl+Shift+~ to open a terminal in the current dev container"
