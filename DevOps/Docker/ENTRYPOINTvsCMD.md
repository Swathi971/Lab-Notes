## Docker ENTRYPOINT vs CMD
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
```
[root@Docker-server ~]# vi script.sh 
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
[root@Docker-server ~]# sh script.sh 
[root@Docker-server ~]# ls 
Script.sh  snap
```
**Scenario 1: Running Ubuntu with command override**
```commandline
docker run ubuntu sleep 5
```
**_Meaning_**: 
* Run a container from ubuntu image 
* Execute the command sleep 5 (pause for 5 seconds) 
* Shows: CMD overrides default Ubuntu CMD.

_**What happened**_: 

Unable to find image 'ubuntu:latest' locally

→ You did not have the image downloaded. 

So Docker automatically downloads it: 

Pulling from library/ubuntu 

Once the image is downloaded, Docker runs it and exits after 5 seconds.
OS images have no background process, so container exits after command.
```
[root@Docker-server ~]# docker images 
IMAGE           ID             DISK USAGE   CONTENT SIZE   EXTRA 

ubuntu:latest   c35e29c94501        119MB         31.7MB    U 
root@Dockerserver:~# docker ps -a 
CONTAINER ID   IMAGE     COMMAND     CREATED         STATUS                     PORTS     NAMES 
7d196506a0af   ubuntu    "sleep 5"   5 minutes ago   Exited (0) 3 minutes ago             beautiful_hertz
```

**Scenario 2: Running ubuntu with and without commands**

##### With command:
```
docker run -it ubuntu sleep 10
```
You are still running sleep 10, so terminal has nothing to show. 

_**Why no logs?**_ 
* sleep 5 does not print anything. 
* So your terminal appears blank → this is normal. 
* After 5 seconds the container exits. 

```
root@Dockerserver:~# docker ps -a 
CONTAINER ID   IMAGE     COMMAND     CREATED         STATUS                     PORTS     NAMES 
7d196506a0af   ubuntu    "sleep 10"   3 minutes ago   Exited (0) 3 minutes ago             beautiful_hertz 
5585ad478b6f   ubuntu    "sleep 5"   5 minutes ago   Exited (0) 5 minutes ago             musing_banzai
``` 
* These containers ran successfully
* They completed their task (sleep 5 and sleep 10)
* They exited normally (exit code 0) 

##### Without command:
```commandline
root@Dockerserver:~# docker run -it ubuntu
root@43facd690e52:/#
```
You enter interactive shell because default CMD of ubuntu is:
```commandline
/bin/bash
```
```root@43facd690e52:/#``` This is the container’s bash shell. 

**Scenario 3: Dockerfile with only CMD**
```commandline
root@Docker-server :~# vi Dockerfile
FROM ubuntu
CMD ["sleep", "5"]
root@Docker-server :~# docker build -t test:v1 . 
root@Docker-server :~# docker images 
Image will be there
```
##### Result:
```
docker run -it test:v1
```
Runs sleep 5.

→ CMD runs by default
→ Container exits after 5 seconds.

```
root@Docker-server :~# docker ps  –a 
We can see /bin/sh -c sleep 5 
```
**Scenario 4: Dockerfile with ENTRYPOINT**
```commandline
root@Docker-server :~# vi Dockerfile-entry  
FROM ubuntu 
ENTRYPOINT [“sleep”]  
root@Docker-server :~# docker build -t entry-image:v1 -f Dockerfile-entry . 
root@Docker-server :~# docker images
```
##### Runtime:
```commandline
root@Docker-server :~# docker run -it entry-image:v1 10
```
##### Result:
```commandline
root@Docker-server :~# docker ps -a
sleep 10
```
**_OR_**
```commandline
root@Docker-server :~# vi Dockerfile-test 
FROM almalinux:8 
ENTRYPOINT [“yum”, "-y", "install"]
root@Docker-server :~# docker build -t test:v1 -f Dockerfile-test .
```
##### If you run with no args:
```commandline
root@Docker-server :~# docker run -it test:v1
```
Errors appears
 
##### If you run with args:
```
root@Docker-server :~# docker run -it test:v1 git
```
```commandline
root@Docker-server:~# docker ps -a 
CONTAINER ID   IMAGE          COMMAND                  CREATED          STATUS                          PORTS     NAMES 
24171860b906   test:v1       "yum -y install git"     2 minutes ago    Exited (0) About a minute ago             competent_bouman 
ad73250d109d   test:v1       "yum -y install"         2 minutes ago    Exited (2) 2 minutes ago                  laughing_mcclintock 
```
* ENTRYPOINT cannot be removed. 
* You cannot override sleep. 
* You can override the arguments (duration).

**Scenario 5: CMD override behaviour**
```commandline
root@Docker-server :~# vi Dockerfile-install 
FROM ubuntu 
CMD [“apt-get”, “-y”,”install”,”git”]  
root@Docker-server :~# docker -t build installation:v1 -f Dockerfile-install . 
root@Docker-server :~# docker images
```
##### When you run the container: 
```
root@Docker-server :~# docker run -it installation:v1
```
It runs only this CMD: ```apt-get -y install git ```

But Ubuntu base image does not have an updated package index, so apt-get does not know about “git”. 
##### If you run: 
```commandline
docker run -it installation:v2 tree 
```
Docker replaces CMD with your new argument: ```tree``` 

So CMD gets overridden, and your git installation command does NOT run. 

➡️ CMD = default command that will be replaced if user gives anything at ‘docker run’ 

**Scenario 6: ENTRYPOINT appending**








