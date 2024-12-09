#!/bin/bash

set -e

echo "Installing Prometheus"

# Download and install Prometheus
wget https://github.com/prometheus/prometheus/releases/download/v2.48.0/prometheus-2.48.0.linux-amd64.tar.gz
tar -xvzf prometheus-2.48.0.linux-amd64.tar.gz
sudo mv prometheus-2.48.0.linux-amd64/prometheus /usr/local/bin/
sudo mv prometheus-2.48.0.linux-amd64/promtool /usr/local/bin/
sudo mkdir -p /etc/prometheus
sudo mv prometheus-2.48.0.linux-amd64/{consoles,console_libraries,prometheus.yml} /etc/prometheus/
rm -rf prometheus-2.48.0.linux-amd64*

# Configure Prometheus
sudo cp configs/prometheus.yml /etc/prometheus/

# Set up Prometheus as a systemd service
sudo cp configs/prometheus.service /etc/systemd/system/
sudo systemctl daemon-reload
sudo systemctl enable prometheus
sudo systemctl start prometheus

# Add username and path for prometheus 
sudo useradd -rs /bin/false prometheus
sudo chown -R prometheus:prometheus /etc/prometheus
sudo chown prometheus:prometheus /usr/local/bin/prometheus
sudo chown prometheus:prometheus /usr/local/bin/promtool
sudo vi /etc/prometheus/prometheus.yml
sudo vi /etc/systemd/system/prometheus.service
sudo systemctl daemon-reload
sudo systemctl start prometheus
sudo systemctl enable prometheus
systemctl status prometheus
sudo mkdir -p /var/lib/prometheus
sudo chown -R prometheus:prometheus /var/lib/prometheus
sudo chmod 755 /var/lib/prometheus
sudo systemctl restart prometheus
systemctl status prometheus

echo "Prometheus installed and running. Metrics available at http://localhost:9090/graph"
