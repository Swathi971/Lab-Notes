### COPY vs ADD — Practical Scenarios with Tomcat
**1. Scenario 1: Using ADD to Download Tomcat from URL (External Source)**

I wanted to download the Tomcat tar file directly from the internet into my Docker container. For that, I used the ADD command in my Dockerfile.
```commandline
[root@Docker-server ~]# vi Dockerfile
```
##### Dockerfile
```commandline
FROM ubuntu
RUN apt-get update && apt-get install apache2 -y
COPY index.html /var/www/html
ADD https://dlcdn.apache.org/tomcat/tomcat-11/v11.0.14/bin/apache-tomcat-11.0.14.tar.gz /opt
EXPOSE 80
CMD ["apache2ctl", "-D", "FOREGROUND"]
```
##### Build Image
```commandline
docker build -t test-1:v1 .
```
##### Run Container
```commandline
docker run -it -d --name c4 -p 9010:80 test-1:v1
```
##### Verify Inside Container
```commandline
[root@Docker-server ~]# docker exec -it c4 /bin/bash
root@ee9667eaf:/# cd /opt
root@ee9667eaf:/opt# ls
```
##### Output:
```commandline
apache-tomcat-11.0.14.tar.gz
```
```ADD <URL> /opt``` downloads the file from external internet directly into the container.

**2. Scenario 2: Using COPY to Copy Local Tomcat Tar File (Local Source Only)**

In this scenario, I manually downloaded the Tomcat tar file into my EC2 instance (Docker host).

##### Download Locally
```commandline
wget https://dlcdn.apache.org/tomcat/tomcat-11/v11.0.14/bin/apache-tomcat-11.0.14.tar.gz
```
##### Dockerfile
```commandline
FROM ubuntu
RUN apt-get update && apt-get install apache2 -y
COPY index.html /var/www/html
COPY apache-tomcat-11.0.14.tar.gz /opt
EXPOSE 80
CMD ["apache2ctl", "-D", "FOREGROUND"]
```
##### Build Image
```commandline
docker build -t test-1:v2 .
```
##### Run Container
```commandline
docker run -it -d --name c5 -p 9010:80 test-1:v2
```
##### Verify inside container
```commandline
docker exec -it c5 /bin/bash
cd /opt
ls
```
##### Output
```commandline
apache-tomcat-11.0.14.tar.gz
```
❌ *COPY cannot download URLs:*

COPY only copies files from local system → URL will not work with COPY.