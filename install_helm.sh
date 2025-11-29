#!/bin/bash
set -e

echo "===== Installing dependencies ====="
sudo dnf install -y curl-minimal tar gzip --allowerasing

echo "===== Fetching latest Helm version ====="
HELM_VERSION=$(curl -s https://api.github.com/repos/helm/helm/releases/latest \
               | grep tag_name | cut -d '"' -f 4)

echo "Latest Helm version: $HELM_VERSION"

echo "===== Downloading Helm $HELM_VERSION ====="
curl -LO "https://get.helm.sh/helm-${HELM_VERSION}-linux-amd64.tar.gz"

echo "===== Extracting Helm ====="
tar -xzf helm-${HELM_VERSION}-linux-amd64.tar.gz

echo "===== Installing Helm ====="
sudo mv linux-amd64/helm /usr/local/bin/helm
sudo chmod +x /usr/local/bin/helm

echo "===== Cleaning up ====="
rm -rf linux-amd64 helm-${HELM_VERSION}-linux-amd64.tar.gz

echo "===== Verifying Helm installation ====="

