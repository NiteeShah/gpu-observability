#!/bin/bash

set -e

echo "Deploying NVIDIA DCGM Exporter"

# Pull DCGM Exporter Docker image
docker pull nvidia/dcgm-exporter:latest

# Create Docker volume for DCGM Exporter
docker volume create dcgm-exporter-data

# Set up DCGM Exporter as a systemd service
sudo cp configs/dcgm-exporter.service  /etc/systemd/system/
sudo systemctl daemon-reload
sudo systemctl enable dcgm-expoter
sudo systemctl start dcgm-expoter

# Run DCGM Exporter
docker run -d --gpus all --rm --name dcgm-exporter -p 9400:9400 -v /var/run/nvidia-dcgm:/var/run/nvidia-dcgm nvidia/dcgm-exporter:latest

echo "DCGM Exporter is running. Metrics available at http://localhost:9400/metrics"
