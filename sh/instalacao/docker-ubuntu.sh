#!/bin/bash

# Update the package index
sudo apt update

# Install dependencies
sudo apt install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

# Add the official Docker GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# Configure the stable Docker repository
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Update the package index again after adding the repository
sudo apt update

# Install the latest version of Docker Engine and containerd
sudo apt install -y docker-ce docker-ce-cli containerd.io

# Add the current user to the docker group to run Docker commands without sudo
sudo usermod -aG docker $USER

# Restart the system to apply the changes
sudo systemctl restart docker

# Display completion message
echo "Docker has been successfully installed. Restart your session or the system to apply changes to the docker group."
