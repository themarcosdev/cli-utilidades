#!/bin/bash

# Path to the swap file
SWAP_FILE="/swapfile"

# Desired size for the swap area (2 GB)
SWAP_SIZE="2G"

# Check if swap already exists
if grep -q "$SWAP_FILE" /etc/fstab; then
    echo "Swap entry already exists in /etc/fstab. Aborting."
    exit 1
fi

# Create the swap file
sudo fallocate -l $SWAP_SIZE $SWAP_FILE
sudo chmod 600 $SWAP_FILE
sudo mkswap $SWAP_FILE

# Add entry to /etc/fstab for activation during boot
echo "$SWAP_FILE none swap sw 0 0" | sudo tee -a /etc/fstab

# Activate the swap area
sudo swapon $SWAP_FILE

# Configure swappiness to 10
echo "vm.swappiness=10" | sudo tee -a /etc/sysctl.conf
sudo sysctl -p

# Display information about the created swap
free -h
swapon --show
