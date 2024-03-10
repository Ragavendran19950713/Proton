Install Jenkins for ubuntu ec2 Instance with userdata:

#!/bin/bash

# Update package lists
sudo apt update

# Install necessary packages
sudo apt install -y fontconfig openjdk-17-jre

# Check Java version
java -version

# Download Jenkins keyring
sudo wget -O /usr/share/keyrings/jenkins-keyring.asc https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key

# Add Jenkins repository to package sources
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/" | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null

# Update package lists again
sudo apt update

# Install Jenkins
sudo apt install -y jenkins

Jenkins Password Location:

Path: /var/lib/jenkins/secrets/initialAdminPassword


