#!/bin/bash

set -e

echo "Installing NVIDIA Drivers and CUDA Toolkit"

# Update and install prerequisites
sudo apt-get update
sudo apt-get install -y wget

# Download and install the CUDA keyring
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/cuda-keyring_1.1-1_all.deb
sudo dpkg -i cuda-keyring_1.1-1_all.deb

# Install CUDA Toolkit and Drivers
sudo apt-get update
sudo apt-get install -y cuda-toolkit-12-6 cuda-drivers

# Install NVIDIA DCGM
sudo apt-get install -y nvidia-dcgm

echo "NVIDIA drivers and CUDA Toolkit installed successfully. Run 'nvidia-smi' to verify."
