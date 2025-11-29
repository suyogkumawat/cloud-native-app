#!/bin/bash
set -e

echo "===== Installing dependencies ====="
sudo dnf install -y curl-minimal --allowerasing

echo "===== Fetching latest kubectl version ====="
KUBECTL_VERSION=$(curl -L -s https://dl.k8s.io/release/stable.txt)

echo "Latest kubectl version: $KUBECTL_VERSION"

echo "===== Downloading kubectl $KUBECTL_VERSION ====="
curl -LO "https://dl.k8s.io/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl"

echo "===== Installing kubectl ====="
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

echo "===== Cleaning up ====="
rm -f kubectl

echo "===== Verifying installation ====="
kubectl version --client

echo "===== kubectl installed successfully! ====="

