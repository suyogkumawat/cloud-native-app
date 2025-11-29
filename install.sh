#!/bin/bash
set -e

echo "===== Updating system packages ====="
sudo dnf update -y

echo "===== Installing Git ====="
sudo dnf install git -y

echo "===== Installing Docker ====="
# Amazon Linux 2023 uses docker from the extras repo
sudo dnf install docker -y

echo "===== Enabling and Starting Docker Service ====="
sudo systemctl enable docker
sudo systemctl start docker

echo "===== Adding current user to docker group ====="
sudo usermod -aG docker $USER

echo "===== Verifying installation ====="
git --version
docker --version
docker info || echo "Docker service not accessible without re-login."

echo "===== Installation completed successfully ====="
echo "⚠️ Please log out and log back in for docker group changes to take effect."

