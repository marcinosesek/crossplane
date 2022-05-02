#!/bin/bash

echo "=== Install kubectl ==="
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"

sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
rm ./kubectl

kubectl version --client

echo 'source <(kubectl completion bash)' >>~/.bashrc
echo "=== Kubectl installed ==="