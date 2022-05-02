#!/bin/bash
KIND_VERSION=v0.12.0

echo "=== Install Kind ${KIND_VERSION} ==="
curl -Lo ./kind https://kind.sigs.k8s.io/dl/${KIND_VERSION}/kind-linux-amd64
chmod +x ./kind
sudo mv ./kind /usr/local/bin/kind

echo 'source <(kind completion bash)' >> ~/.bashrc
echo 'source <(kind completion bash)' >> /home/vagrant/.bashrc

echo "=== Kind installed ==="