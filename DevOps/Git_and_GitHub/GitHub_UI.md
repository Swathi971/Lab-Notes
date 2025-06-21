### Creating a Remote Repository on GitHub (UI Method)
#### Step-by-Step Instructions:

1. Click the ➕ "+" icon (top right corner)
Choose "New repository" from the dropdown menu.
2. Enter repository details
* Repository name: Choose a name like myproject, portfolio, etc.
* Description (optional): Write a short description of your project.
* Visibility: Choose Public (visible to everyone) or Private.
3. Initialize with options (optional)
* You can check "Add a README file"
* Optionally add a .gitignore and license (optional for fresh push)
4. Click “Create repository”
Your new remote repository is now ready on GitHub.
5. Copy the repository URL
* For HTTPS: https://github.com/Swathi971/Lab-Notes.git
* For SSH (advanced): git@github.com:Swathi971/Lab-Notes.git
6. Connect your local project to this remote (from your terminal):
```commandline
git remote add origin https://github.com/Swathi971/Lab-Notes.git
```
---
### Cloning the repo through Https using token:
##### Create the GitHub repository 
* Create the repository named simple
* do not add README.md (optional)
* create the file named file1
##### Install git in terminal
```commandline
[root@ip-11-0-20-82 ~]# yum install git -y
```
##### Cloned the Github repository to terminal
```commandline
[root@ip-11-0-20-82 ~]# git clone https://github.com/Swathi971/simple.git
Cloning into 'simple'...
Username for 'https://github.com': Swathi971
Password for 'https://Swathi971@github.com':
remote: Enumerating objects: 3, done.
remote: Counting objects: 100% (3/3), done.
remote: Total 3 (delta 0), reused 0 (delta 0), pack-reused 0 (from 0)
Receiving objects: 100% (3/3), done.
[root@ip-11-0-20-82 ~]# ls
simple
[root@ip-11-0-20-82 ~]# cd simple/
[root@ip-11-0-20-82 simple]# ls
file1
```


