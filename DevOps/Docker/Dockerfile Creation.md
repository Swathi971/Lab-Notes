### Docker – Deploying a Static HTML Website Using Apache
**1. Scenario Overview**

I have a static HTML file (index.html) that contains a registration form.

My goal:

✔ Package this static website inside a Docker image

✔ Run it using Apache on Ubuntu

✔ Access the page via browser (public-ip:9003)

**2. Creating Project Structure**

##### Create a directory for the application
```commandline
mkdir Register_form
cd Register_form
```
##### Create index.html
```commandline
vi index.html
```
Paste your static HTML code (Register Form).

**3. Writing the Dockerfile**

The Dockerfile MUST be in the same folder as the application code.
```FROM ubuntu
RUN apt-get update && apt-get install apache2 -y
COPY index.html /var/www/html
EXPOSE 80
CMD ["apache2ctl", "-D", "FOREGROUND"]
```
* COPY copies files from the Docker host → container.
* Apache serves files from:
/var/www/html 
* CMD ["apache2ctl", "-D", "FOREGROUND"]
ensures Apache starts automatically when container starts.

**4. Building the Docker Image**

Inside the Register_form directory:
```commandline
docker build -t myimage .
```
Check images:
```commandline
docker images
```
Example:
```commandline
REPOSITORY   TAG     IMAGE ID         SIZE
myimage      latest  6dc1a89fa718     242MB
```
**5. Running the Container**

Run container on port 9003:
```commandline
docker run -it -d --name c3 -p 9003:80 <myimage id>
```
Check running containers:
```commandline
docker ps
```
You will see:
```commandline
CONTAINER ID   IMAGE      COMMAND                  CREATED       STATUS        PORTS                     NAMES
88cfba392ac9   myimage    "apache2ctl -D FORE…"   5 sec ago     Up 5 sec      0.0.0.0:9003->80/tcp      c3
```
COMMAND → "apache2ctl -D FOREGROUND"

👉 This shows Apache is running as the main process

👉 Means CMD worked correctly

👉 The server starts automatically — you do NOT need to start it manually

**6. Test in Browser**

✔ Static Register Form loads successfully.

**7. Key Explanation**
##### Why COPY index.html /var/www/html works?
* /var/www/html = default web root directory for Apache. 
* Anything placed there is served automatically on port 80.