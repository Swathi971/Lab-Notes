### Git
### Steps:
##### Checks if git command exists or not:
```commandline
[root@git-server ~]# git
```
##### If not install git:
```commandline
[root@git-server ~]# yum install git -y  # RHEL/CentOS
[root@git-server ~]# apt install git     # Debian/Ubuntu
```
##### Create a New Folder:
```commandline
mkdir microdegree 
cd microdegree/ 
```
#####  Initialize a Git Repository:
```commandline
git init
```
→ This creates a .git/ folder and makes it a Git repository
##### Create a File:
```commandline
touch sample.txt 
```
##### Check File Status:
```commandline
git status
```
→ You’ll see the file is untracked
##### 

