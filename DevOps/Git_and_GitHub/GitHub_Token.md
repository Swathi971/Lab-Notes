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
### Cloning a GitHub Repo via HTTPS with Token Authentication 
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
---
### Create a Local Git Repository and Connect to GitHub via Terminal 
##### 1. Create a local project folder 
```commandline
mkdir simple
cd simple/
```
##### 2. Initialize Git in the folder 
```commandline
git init
```
→ This creates a hidden .git/ folder and turns the folder into a Git repository.
##### 3. Create your files 
```commandline
 touch file2 OR
 echo "My first Git project" > README.md 
```
##### 4. Stage and commit the file 
```commandline
git add file2
git commit -m "Initial commit" 
```
##### 5. Create a GitHub repo using the GitHub UI 
→ Go to https://github.com → Click "New" → Name it (e.g., myproject) → Click "Create repository" 
→ Do NOT check “Initialize with README” (optional, but avoids conflict) OR (in my case I have already created repository called simple in GitHub UI and created new file called file1)

##### 6. Connect local to GitHub using HTTPS 
→ Copy the HTTPS URL from your new GitHub repo.  
```commandline
git remote add origin https://github.com/Swathi971/simple.git
```
##### 7. Rename the local branch to main (recommended) 
```commandline
git branch -M main
```
##### 8. Push code to GitHub 
```commandline
git push -u origin main
```
→ You’ll be asked for your GitHub username and a personal access token (instead of password). 
* When I try to push error occurred:
```
! [rejected]        main -> main (fetch first)
error: failed to push some refs to 'https://github.com/Swathi971/simple.git'
hint: Updates were rejected because the remote contains work that you do not
hint: have locally. This is usually caused by another repository pushing to
hint: the same ref. If you want to integrate the remote changes, use
hint: 'git pull' before pushing again.
hint: See the 'Note about fast-forwards' in 'git push --help' for details.
```
→ GitHub already has a commit (file1) created directly through the UI. Since your local branch doesn't have that commit, Git blocks the push to avoid overwriting remote history.
#### To safely merge GitHub changes with your local repo
##### 1. Pull remote changes with rebase:
```commandline
git pull --rebase origin main
```
##### 2. (Optional) Resolve any conflicts (you likely won’t have any in this case)
If conflicts:
```commandline
# Edit the file manually to resolve
git add <filename>
git rebase --continue
```
##### 3. Push your local commits after rebase:
```commandline
git push -u origin main
```
---
##### If a remote named origin already exists, you'll get an error.
* To fix it, use:
```commandline
git remote remove origin
git remote add origin <url>
```
---
##### Scenario
→ You cloned someone else’s repo (e.g., an open-source project).
→ You want to name their original repo as upstream.
→ You'll later add your own fork of the repo as origin.
* Use:
```
git remote rename origin upstream
```
→ It Renames the remote from origin to upstream.
##### Example
```
git remote -v
```
* Output: 
```commandline
origin  https://github.com/others/repo.git (fetch)
origin  https://github.com/others/repo.git (push)
```
* Now run:
```commandline
git remote rename origin upstream
```
* Check again:
```commandline
git remote -v
```
* Output:
```commandline
upstream  https://github.com/others/repo.git (fetch)
upstream  https://github.com/others/repo.git (push)
```
* Then add your own GitHub repo as origin:
```commandline
git remote add origin https://github.com/yourname/repo.git
```






