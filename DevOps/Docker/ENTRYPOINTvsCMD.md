### Docker ENTRYPOINT vs CMD
#### 1. Basic Definitions
##### CMD
* CMD provides default arguments/commands to run when the container starts. 
* CMD can be overridden at runtime using ```docker run <image> <command>```. 
* A Dockerfile can have only one CMD, and the last one wins.

##### ENTRYPOINT
* ENTRYPOINT specifies the main executable for the container. 
* ENTRYPOINT cannot be overridden, but arguments can be appended. 
* ENTRYPOINT is used when the container should behave like a fixed executable.

#### 2. How Docker Executes Them Together
##### If ONLY CMD exists
```docker run``` will run CMD.

##### If ONLY ENTRYPOINT exists
Docker runs ENTRYPOINT, arguments must be passed manually.

##### If ENTRYPOINT + CMD exist
* ENTRYPOINT = main command 
* CMD = default arguments 
* Your ```docker run <image> <args>``` replaces CMD args.

#### 3. CMD vs ENTRYPOINT

| Feature                 | CMD                 | ENTRYPOINT                                    |
| ----------------------- | ------------------- | --------------------------------------------- |
| Acts as default command | ✅ Yes               | ❌ No                                          |
| Acts as main executable | ❌ No                | ✅ Yes                                         |
| Overridable at runtime  | **YES** (replaced)  | ❌ No (arguments appended)                     |
| Best for                | Default arguments   | Fixed executable (like nginx, python scripts) |
| Accepts parameters?     | Yes                 | Yes                                           |
| Format                  | exec/json preferred | exec/json preferred                           |

#### 4. SCENARIO-WISE
##### Scenario 1: Running Ubuntu with command override
```
[root@Docker-server ~]# vi script.sh 
```
```
#!/bin/bash
echo << EOF
"=========================================================="
"||     Set up Docker's Apt repository ...............   ||"
"=========================================================="
EOF
#Set up Docker's Apt repository
# Add Docker's official GPG key:
sudo apt-get update -y
sudo apt-get install ca-certificates curl gnupg -y
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

# Add the repository to Apt sources:
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update -y

echo << EOF
"=========================================================="
"||   Docker's Apt repository is completed...........    ||"
"=========================================================="
EOF



echo << EOF
"=========================================================="
"||   Install the Docker packages....................    ||"
"=========================================================="
EOF

sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y

echo << EOF
"=========================================================="
"||   Install is completed ....................    ||"
"=========================================================="
EOF

dockerStatus=$(systemctl status docker | awk '/Active/ {print $3}' | tr -d "[()]")
dockerVersion=$(docker -v | awk '/version/ {print $3}' | tr -d ",")

echo "The Docker status is $dockerStatus"
echo "The Docker version is $dockerVersion"
```



