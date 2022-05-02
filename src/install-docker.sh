#!/bin/bash

echo "=== Install Docker ==="
sudo apt-get update
sudo apt-get install ca-certificates curl gnupg lsb-release

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
sudo apt-get update

sudo apt-get install -y docker.io
sudo usermod -aG docker vagrant
echo "=== Docker installed ==="