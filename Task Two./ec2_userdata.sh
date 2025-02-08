#!/bin/bash
# Update and install necessary packages
sudo apt update -y
sudo apt install -y openjdk-17-jdk curl

# Install Docker
sudo apt install -y docker.io
sudo systemctl enable --now docker

# Add Jenkins repository and key
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/" | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null

# Install Jenkins
sudo apt update -y
sudo apt install -y jenkins
sudo systemctl enable --now jenkins

# Add Jenkins user to Docker group
sudo usermod -aG docker jenkins
sudo systemctl restart jenkins
sudo systemctl restart docker

