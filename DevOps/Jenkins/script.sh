#!/bin/bash 
#This works only on Linux or redhat 
sudo wget -O /etc/yum.repos.d/jenkins.repo \
       	https://pkg.jenkins.io/redhat/jenkins.repo 
sudo rpm --import https://pkg.jenkins.io/redhat/jenkins.io-2023.key
sudo yum upgrade 
# Add required dependencies for the jenkins package 
sudo yum install fontconfig java-17 -y 
sudo yum install jenkins -y
sudo systemctl daemon-reload 
# Start Jenkins
sudo systemctl enable jenkins 
sudo systemctl start jenkins 
sudo systemctl status jenkins 
