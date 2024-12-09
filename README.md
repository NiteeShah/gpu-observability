# GPU Observability Setup

This repository contains scripts to set up observability for GPU-based virtual machines (VMs).

## Setup Steps
1. Run the scripts in sequence to install drivers, tools, and monitoring systems.
2. Refer to the individual scripts for specific commands.


# Observability Components Overview

## Node Exporter
Node Exporter collects system-level metrics such as:
- **CPU usage**
- **Memory usage**

This provides a foundational view of system health, helping identify resource bottlenecks and anomalies.

---

## NVIDIA DCGM Exporter
Designed specifically for NVIDIA GPUs, this exporter gathers critical GPU metrics, including:
- **GPU utilization**
- **Memory consumption**
- **Temperature**

These metrics are essential for monitoring GPU performance and maintaining optimal system operation.

---

## Prometheus
Prometheus is responsible for:
- Scraping metrics from Node Exporter and NVIDIA DCGM Exporter every **15 seconds**.
- Storing the collected data in a **time-series format** for easy querying.
- Supporting **historical analysis** to identify trends and patterns over time.

It ensures real-time data collection without overwhelming the system.

---

## Grafana
Grafana provides:
- User-friendly dashboards to visualize data from Prometheus.
- Easy access to **key performance indicators (KPIs)** for both technical and non-technical team members.
- Customizable panels to tailor the monitoring experience.

---

## Systemd Services
All components are managed as **systemd services**, offering:
- **Continuous operation**: Services automatically restart in case of failure.
- **Streamlined management**: Simplified service control via commands like `start`, `stop`, and `status`.

This ensures a robust and reliable monitoring setup.

## Troubleshooting
- **Verify NVIDIA Drivers**: `nvidia-smi`
- **Check Docker**: `sudo systemctl status docker`
- **Test DCGM Exporter**: Visit `http://localhost:9400/metrics`
- **Check Node Exporter**: Visit `http://localhost:9100/metrics`
- **Check Prometheus**: Visit `http://localhost:9090`
- **Grafana**: Visit `http://localhost:3000`
