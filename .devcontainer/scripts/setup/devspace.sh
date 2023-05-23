#!/usr/bin/env bash
#shellcheck shell=bash
set -e
# Run dependency devspace setup
#"$KUBEFIRST_PROJECT_ROOT/run" -id alephz-ai/devcontainer-features setup devspace
# Fix for dotnet
export PATH="/usr/local/dotnet/current:/usr/share/dotnet:$PATH"
# Fix for dotnet tools
export PATH="$HOME/.dotnet/tools:$PATH"
# Fix for git-credential-manager
export GCM_CREDENTIAL_STORE=cache
# Fix for homebrew
export BREW_PREFIX="/home/linuxbrew/.linuxbrew"
eval "$("$BREW_PREFIX/bin/brew" shellenv)"
# Fix for nvm
export NVM_SYMLINK_CURRENT="true"
export NVM_DIR="/usr/local/share/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"
# Fix for psql
brew link postgresql@15
# Check all tools are installed
docker --version
docker-compose --version
bash --version
zsh --version
pwsh --version
git --version
git-lfs --version
# TODO: Fix on devspace
# git-credential-manager --version
gitsign --version
gitsign-credential-cache --version
gh --version
dotnet --version
nvm --version
nvm version
npm --version
npm version
node --version
brew --version
age --version
age-keygen --version
mkcert --version
chezmoi --version
psql --version
devcontainer --version
kubectl version --client --short
helm version
kustomize version
skaffold version
k9s version
argocd version --client
minikube version
kind --version
kind version
k3d --version
k3d version
vcluster --version
vcluster version
kubefirst version
terraform --version
terraform version
# Setup git credential manager
# TODO: Fix on devspace
# git-credential-manager configure
# git-credential-manager diagnose
