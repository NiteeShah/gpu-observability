#!/bin/bash

set -e

echo "Installing NVIDIA Docker Toolkit"

# Add NVIDIA's GPG key and repository
distribution=$(. /etc/os-release; echo $ID$VERSION_ID)
curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add -
curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | sudo tee /etc/apt/sources.list.d/nvidia-docker.list

# Install NVIDIA Container Toolkit
sudo apt update
sudo apt upgrade -y
sudo apt install -y nvidia-container-toolkit

# Restart Docker
sudo systemctl restart docker

echo "NVIDIA Docker Toolkit installed successfully. Run 'docker run --rm --gpus all nvidia/cuda:12.0-base nvidia-smi' to verify."
