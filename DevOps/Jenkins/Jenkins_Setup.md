### Jenkins Installation
1. Launch an linux server in AWS and add security group rule [Custom TCP and 8080], t2.medium, storage- 20GB
2. Set up jenkins:
* Execute script.sh 
*  First we need to check whether the file has executable permissions/not, if it’s not
     * chmod 777 script.sh
* Run the file
     * ./jenkins.sh (or) sh jenkins.sh
3. Now, open the jenkins in browser  -  publicIP:8080
* JENKINS Default Path : /var/lib/jenkins   
     * Enter the password go to the particular path i.e. cd path
     * Click on install suggested plugins
4. Now, Start using jenkins

---
### Jenkins Installation Script (for Linux/RHEL)
```
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
```
---
### Jenkins Installation Script (for Ubuntu/Debian)
```commandline
#!/bin/bash

# Add Jenkins key and repo
sudo mkdir -p /etc/apt/keyrings
sudo wget -O /etc/apt/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key

echo "deb [signed-by=/etc/apt/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/" | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null

# Update package list
sudo apt-get update

# Install Jenkins
sudo apt-get install -y jenkins

# Install Java (OpenJDK 17)
sudo apt install -y fontconfig openjdk-17-jdk

# Verify Java version
java -version

# Start Jenkins service
sudo systemctl enable jenkins
sudo systemctl start jenkins

# Check Jenkins status
sudo systemctl status jenkins
```

