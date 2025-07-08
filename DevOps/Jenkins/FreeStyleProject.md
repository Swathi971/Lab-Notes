#### Simple freestyle project
##### Create a new Job
* Now, we are creating the jobs in freestyle
* Click on create a job (or) new item→ Enter task name→ click on freestyle project
* Build→ Execute shell
```
#!/bin/bash
uptime
date 
```
* Apply→ Save→ Build now
---
##### Creating freestyle project(Build periodically)
* Go to Dashboard→ test1→ Configuration→ General
<img src=".github/images/img.png" alt="project" width="60%"/>

*  Get the Git Repo
   * Copy the github repo url and paste in under SCM. It is showing error
   * So, now in your AWS terminal → Install GIT → yum install git -y 
   * Whenever we are using private repo, then we have to create credentials. But right now, we are using 
public repo. So, none credentials
<img src=".github/images/img_1.png" alt="project" width="60%"/>
   
   *  If we want to get the data from particular branch means you can mention the branch name in branch 
section.But default it takes master
<img src=".github/images/img_2.png" alt="project" width="60%"/>
   
   * Trigger
<img src=".github/images/img_3.png" alt="project" width="60%"/>
   
   * Click on save and Build now and build success
<img src=".github/images/img_4.png" alt="project" width="60%"/>
<img src=".github/images/img_5.png" alt="project" width="50%"/>

<img src=".github/images/img_6.png" alt="project" width="50%"/>