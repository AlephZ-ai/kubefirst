#!/usr/bin/env zsh
#shellcheck shell=bash
set -e
rm -f nohup.out
rm -f gcm-diagnose.log
kubefirst k3d create --github-org AlephZ-ai
echo "Press Ctrl+Shift+~ to open a terminal in the current dev container"
