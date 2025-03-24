H100 needs FM for gpu-burn to run above normal steps
sudo apt install nvidia-fabricmanager-570
systemctl enable nvidia-fabricmanager.service
systemctl start nvidia-fabricmanager.service
systemctl status nvidia-fabricmanager.service
