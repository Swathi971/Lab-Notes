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