#!/bin/bash

USER_NAME="vagrant"
KUBECONFIG="/home/${USER_NAME}/.kube/config"

export KUBECONFIG=${KUBECONFIG}

echo "=== Install Crossplane ==="

kubectl create namespace crossplane-system

helm repo add crossplane-stable https://charts.crossplane.io/stable
helm repo update

helm install crossplane --namespace crossplane-system crossplane-stable/crossplane

curl -sL https://raw.githubusercontent.com/crossplane/crossplane/master/install.sh | sh

sudo mv kubectl-crossplane /usr/local/bin

#echo "Install Crossplane Configuration Packages"
# kubectl crossplane install configuration registry.upbound.io/xp/getting-started-with-aws:v1.7.0
# kubectl crossplane install configuration registry.upbound.io/xp/getting-started-with-aws-with-vpc:v1.7.0
# kubectl crossplane install configuration registry.upbound.io/xp/getting-started-with-gcp:v1.7.0
# kubectl crossplane install configuration registry.upbound.io/xp/getting-started-with-azure:v1.7.0

echo "=== Crossplane installed ==="