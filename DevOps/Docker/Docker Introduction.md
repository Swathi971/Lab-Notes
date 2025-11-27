## Docker
##### 1. Introduction to Docker
Docker is a containerization tool that allows us to package applications with all dependencies and run them anywhere.

##### 2. Launching EC2 Instance for Docker
* Launch an EC2 instance
  * Type: t2.micro 
  * Storage: 20GB
* Change the hostname:
```commandline
[root@ip-11-0-13-39 ~]# hostname Docker-server
[root@ip-11-0-13-39 ~]# bash
[root@Docker-server ~]# 
```
##### 3. Installing Docker on EC2
When we typed docker, it showed:
```commandline
[root@Docker-server ~]# docker
bash: docker: command not found
```
So install Docker:
```commandline
[root@Docker-server ~]# yum install docker –y 
[root@Docker-server ~]# systemctl start docker
[root@Docker-server ~]# systemctl enable docker
Created symlink /etc/systemd/system/multi-user.target.wants/docker.service → /usr/lib/systemd/system/docker.service.
[root@Docker-server ~]# systemctl status docker
Active: active (running) since Thu 2025-04-10 05:50:27 UTC; 1min 31s ago
```
If Docker is active (running) → installation successful.

##### 4. Pulling a Docker Image
Example: Pull NGINX image
```commandline
[root@Docker-server ~]# docker pull nginx
```
Why NGINX image?
NGINX is a web application, so if we run this container and expose port 80, we get the NGINX home page.

Check all images:
```commandline
[root@Docker-server ~]# docker images
| REPOSITORY | TAG    | IMAGE ID     | SIZE  |
| ---------- | ------ | ------------ | ----- |
| nginx      | latest | 60adc2e137e7 | 152MB |
```
##### 5. Running a Container from an Image
To expose NGINX on port 80:
```commandline
[root@Docker-server ~]# docker run -it -d --name c1 -p 80:80 <image-id>
```
* Copy public IP of EC2 
* Paste in browser → You will see NGINX home page.

Run same image on another port:
```commandline
[root@Docker-server ~]# docker run -it -d --name c2 -p 9000:80 <image-id>
```
Access using:
```commandline
http://<public-ip>:9000
```
⚠️ Make sure port 9000 is opened in AWS Security Group.

##### 6. Inspecting Docker Images
To see complete details of an image:
```commandline
[root@Docker-server ~]# docker inspect <image-id>
```
This shows: Exposed ports, Entry point, Layers and Configurations.
Most applications expose port 80 by default.

##### 7. Pulling Another Image
Example:
```commandline
[root@Docker-server ~]# docker pull manojkrishnappa/yahoo
[root@Docker-server ~]# docker images
```
Now you will see both NGINX and Yahoo images.

##### 8. Running Container on Custom Port
```commandline
[root@Docker-server ~]# docker run -it -d --name c3 -p 9001:80 <image-id>
```
Because:
* Port 80 → used by c1 
* Port 9000 → used by c2 
* So used 9001

Check running containers:
```commandline
[root@Docker-server ~]# docker ps
```
Now c3 is binded to port 9001.

##### 9. Going Inside a Container
To enter container c3:
```commandline
[root@Docker-server ~]# docker attach c3
```
Now inside container:
```commandline
[root@uru585sjf88md /]# ls
[root@uru585sjf88md /]# httpd  # starting httpd manually
```
Reload the browser → application runs.

This is a manual way of starting the application.
 
##### 10. Understanding COMMAND in ```docker ps```
Example docker ps output shows:
* For c3 → bin/bash 
* For c1, c2 → /docker-entrypoint.…

**bin/bash**
* No application starts automatically. 
* Only opens a shell.

**docker-entrypoint**
* Automatically starts the app inside the container. 
* This is defined in Dockerfile using:
   * ```CMD``` 
   * ```ENTRYPOINT```
  
That’s why c1 & c2 start NGINX automatically.

##### 11. Exit Container Safely
Do NOT use exit (it stops container). (means- do not press CTRL c)

Use: 
```
CTRL + P + Q
```
You will see:
```commandline
read escape sequence
```
Container continues running.

##### 12. Checking All Containers
```commandline
[root@Docker-server ~]# docker ps -a
```
Here you can see:
* Running containers 
* Stopped containers

##### 13. Why attach does not work sometimes?
Example:
```commandline
[root@Docker-server ~]# docker attach c2
```
It shows logs (verbose output)

→ Because NGINX is running and logs are printed. 

Attach works only when container is running a shell like ```bin/bash```. If **no bash**, attach will show logs only.

##### 14. Enter a Container Using exec
Use this when attach doesn't work:
```commandline
[root@Docker-server ~]# docker exec -it c2 /bin/bash
```
This opens a new bash session inside container without showing logs.

Inside the container:
```commandline
[root@7yshjk3jjdjdk: /]# ls 
```
