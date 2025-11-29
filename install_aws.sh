#!/bin/bash
set -e

echo "===== Installing dependencies ====="
sudo dnf install -y unzip curl-minimal --allowerasing

echo "===== Downloading latest AWS CLI v2 ====="
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"

echo "===== Extracting AWS CLI ====="
unzip -o awscliv2.zip

echo "===== Installing AWS CLI ====="
sudo ./aws/install --update

echo "===== Cleaning up ====="
rm -rf aws awscliv2.zip

echo "===== Verifying AWS CLI installation ====="
aws --version

echo "===== AWS CLI v2 installed successfully! ====="

