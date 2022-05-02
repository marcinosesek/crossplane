#!/bin/bash
HELM_VERSION="v3.8.2"
HELM_FILE="helm-${HELM_VERSION}-linux-amd64.tar.gz"

echo "=== Install Helm ${HELM_VERSION} ==="
curl -LO "https://get.helm.sh/${HELM_FILE}"
tar -xvf ${HELM_FILE}
sudo mv linux-amd64/helm /usr/local/bin/helm
rm -rf ./helm* ./linux*

echo "=== Helm installed ==="