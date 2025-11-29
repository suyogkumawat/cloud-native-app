#!/bin/bash
set -e

echo "===== Installing dependencies ====="
sudo dnf install -y unzip curl-minimal --allowerasing

echo "===== Fetching the latest Terraform version ====="
LATEST=$(curl -s https://checkpoint-api.hashicorp.com/v1/check/terraform \
         | grep -oP '"current_version":\s*"\K[0-9\.]+')

echo "Latest Terraform version: $LATEST"

echo "===== Downloading Terraform $LATEST ====="
curl -LO https://releases.hashicorp.com/terraform/${LATEST}/terraform_${LATEST}_linux_amd64.zip

echo "===== Extracting Terraform ====="
unzip -o terraform_${LATEST}_linux_amd64.zip

echo "===== Installing Terraform ====="
sudo mv terraform /usr/local/bin/
sudo chmod +x /usr/local/bin/terraform

echo "===== Cleaning up ====="
rm -f terraform_${LATEST}_linux_amd64.zip

echo "===== Verifying Installation ====="
terraform -version

echo "===== Terraform installed successfully! ====="

