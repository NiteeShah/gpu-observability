#!/bin/bash

set -e

echo "Installing Grafana"

# Install Grafana
sudo apt-get install -y software-properties-common
sudo add-apt-repository "deb https://packages.grafana.com/oss/deb stable main"
wget -q -O - https://packages.grafana.com/gpg.key | sudo apt-key add -
sudo apt-get update
sudo apt-get install -y grafana

# Start and enable Grafana
sudo systemctl enable grafana-server
sudo systemctl start grafana-server

echo "Grafana installed and Metrics available at http://localhost:3000."
