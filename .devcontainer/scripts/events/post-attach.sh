#!/usr/bin/env bash
#shellcheck shell=bash
set -e
# Kubefirst ports
kubectl wait --namespace kubefirst --for=condition=ready pod --selector="app.kubernetes.io/name=console"
kubectl port-forward --namespace kubefirst svc/kubefirst-console 12080:8080 &

# Vault ports
kubectl wait --namespace vault --for=condition=ready pod --selector="app.kubernetes.io/name=vault"
kubectl port-forward --namespace vault svc/vault 13080:8200 &
kubectl port-forward --namespace vault svc/vault 13443:8201 &

# Argo ports
kubectl wait --namespace argo --for=condition=ready pod --selector="app.kubernetes.io/name=argo-server"
kubectl port-forward --namespace argo svc/argo-server  14080:2746 &
kubectl wait --namespace argocd --for=condition=ready pod --selector="app.kubernetes.io/name=argocd-server"
kubectl port-forward --namespace argocd svc/argocd-server 14443:443 &

# Atlantis ports
kubectl wait --namespace atlantis --for=condition=ready pod --selector="app=atlantis"
kubectl port-forward --namespace atlantis svc/atlantis 15080:80 &

# Chartmuseum ports
kubectl wait --namespace chartmuseum --for=condition=ready pod --selector="app.kubernetes.io/name=chartmuseum"
kubectl port-forward --namespace chartmuseum svc/chartmuseum 16080:8080 &

# Minio ports
kubectl wait --namespace minio --for=condition=ready pod --selector="app=minio"
kubectl port-forward --namespace minio svc/minio 17080:9000 &
kubectl port-forward --namespace minio svc/minio-console 17081:9001 &

# Metaphor ports
kubectl wait --namespace development --for=condition=ready pod --selector="app.kubernetes.io/name=metaphor"
kubectl port-forward --namespace development svc/metaphor-development 18080:8080 &
kubectl wait --namespace staging --for=condition=ready pod --selector="app.kubernetes.io/name=metaphor"
kubectl port-forward --namespace staging svc/metaphor-staging 18081:8080 &
kubectl wait --namespace production --for=condition=ready pod --selector="app.kubernetes.io/name=metaphor"
kubectl port-forward --namespace production svc/metaphor-production 18082:8080 &
echo "Press Ctrl+Shift+~ to open a terminal in the current dev container"
echo "Sleeping forever to keep ports open"
sleep infinity
