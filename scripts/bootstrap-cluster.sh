#!/bin/bash
set -e

kubectl create ns argocd || true
kubectl create ns ingress-nginx || true
kubectl create ns cert-manager || true

helm repo add argo https://argoproj.github.io/argo-helm
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm repo add jetstack https://charts.jetstack.io

helm repo update

helm install argocd argo/argo-cd -n argocd
helm install ingress ingress-nginx/ingress-nginx -n ingress-nginx
helm install cert-manager jetstack/cert-manager -n cert-manager --set installCRDs=true