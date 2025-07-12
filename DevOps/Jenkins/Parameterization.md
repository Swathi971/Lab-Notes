## Parameterization in Jenkins Using Shell Scripts
##### Problem Statement:
Let's say I have a shell script that takes two arguments:
```
[root@jenkins-server ~]# cd /tmp/
[root@jenkins-server tmp]# ls 
script.sh
[root@jenkins-server tmp]# cat script.sh 
#!/bin/bash
name=$1
sub=$2
echo "hello $name & i like $sub" 
```
This script is saved as:
```commandline
[root@jenkins-server tmp]# realpath script.sh
/tmp/script.sh
```
I want to execute this script via Jenkins, and pass dynamic values to it — without hardcoding every time.

##### Why Parameterization is Important
* If you hardcode values in "Execute Shell" like:
```commandline
/tmp/script.sh swathi k8s
```
I will have to edit the job every time you want to change inputs. This is not good practice, especially in teams or production environments.
Solution → Use Jenkins parameters to let users input values at build time, safely and flexibly.

### Step-by-Step: Using Parameters in a Freestyle Jenkins Project
**Step 1: Create a Freestyle Project**
* Go to Jenkins Dashboard → New Item
* Choose Freestyle project
* Give it a name → Click OK

**Step 2: Add Your Shell Script**
* Go to Configure
* Scroll to Build → Add build step → Execute shell
* Add:
```commandline
/tmp/script.sh swathi k8s
```
* Click Save, then Build Now
<img src=".github/images/img_12.png" alt="parameterization" width="70%"/>

* ##### Output:
<img src=".github/images/img_13.png" alt="parameterization" width="70%"/>

##### But This Is Hardcoded! We Want Dynamic Input
**Step 3: Add Parameterization**
* Go to Configure
* Tick: This project is parameterized
1. First Parameter:
<img src=".github/images/img_14.png" alt="parameterization" width="70%"/>
2. Second Parameter:
<img src=".github/images/img_15.png" alt="parameterization" width="70%"/>

**Step 4: Modify Execute Shell**

Replace hardcoded values with parameter variables:

<img src=".github/images/img_16.png" alt="parameterization" width="70%"/>
Jenkins will now pass the entered values as arguments $1 and $2 to your script.

* Click Apply → Save

**Step 5: Build with Parameters**
* Click Build with Parameters
<img src=".github/images/img_17.png" alt="parameterization" width="60%"/>

* You’ll see input fields for name and sub
<img src=".github/images/img_18.png" alt="parameterization" width="70%"/>

* Click Build

##### Console Output Example:
<img src=".github/images/img_19.png" alt="parameterization" width="60%"/>

##### Leave defaults or change them (e.g., name = Amit, sub = Linux)
<img src=".github/images/img_20.png" alt="parameterization" width="65%"/>
<img src=".github/images/img_21.png" alt="parameterization" width="65%"/>


