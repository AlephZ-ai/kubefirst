#!/usr/bin/env bash
#shellcheck shell=bash
set -e
# Get current user
CURRENT_USER="$(whoami)"
# Update submodules
pushd "$KUBEFIRST_PROJECT_ROOT"
git submodule sync --recursive
git submodule update --init --recursive
git submodule foreach --recursive git pull origin main
popd
# Install apt-packages
sudo apt update
sudo apt install -y --fix-broken --fix-missing
sudo apt upgrade -y
packages=""
sudo PACKAGES="$packages" UPDATEPACKAGES="true" "$KUBEFIRST_PROJECT_ROOT/run" -id rocker-org/devcontainer-features apt-packages install
# Install Brew
sudo USERNAME="$CURRENT_USER" BREWS="bash zsh grep git git-lfs sigstore/tap/gitsign gh mkcert chezmoi postgresql@15" "$DEVCONTAINER_FEATURES_PROJECT_ROOT/run" -s homebrew install
brew --version
# Ensure docker is setup
docker --version
docker-compose --version
# Continue with devspace setup
"$KUBEFIRST_PROJECT_ROOT/run" setup devspace
# Log into GitHub
if ! gh auth status; then gh auth login; fi
gh config set -h github.com git_protocol https
gh auth status
# Setup git credential manager
git-credential-manager configure
git-credential-manager diagnose
echo "Don't forget to set your git credentials:"
echo 'git config --global user.name "Your Name"'
echo 'git config --global user.email "youremail@yourdomain.com"'
echo "WARNING: Please restart shell to get latest environment variables"
