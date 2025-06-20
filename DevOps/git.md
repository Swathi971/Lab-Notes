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
##### Add File to Staging Area:
```commandline
git add sample.txt
```
→ File is now staged for commit.
##### Commit the File:
```commandline
git commit -m "Initial commit: added sample.txt"
```
##### Configure Git:
```commandline
git config --global user.name "Your Name"
git config --global user.email "you@example.com"
```
→ This sets your identity for all your commits.
##### Check Commit History:
```commandline
git log --oneline
```
* The git log -p command is used to show the commit history along with the changes (diffs) introduced in each commit. git log shows a list of commits. -p shows the patch (diff) introduced in each commit
```commandline
git log –p 
```
* Show the commit history of your Git repository — starting from the most recent commit. Each commit will show Commit hash (a unique ID), Author name and email, Date and time, Commit message
```commandline
git log 
```

