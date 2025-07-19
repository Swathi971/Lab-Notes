### Jenkins Pipeline: Checkout the Development Branch and Execute Code
#### How to checkout specific branch:
##### 1. Objective:
I want to checkout the development branch and execute the code from development using a Jenkins pipeline.

##### 2. Jenkins Pipeline Script:
##### Jenkinsfile
```commandline
pipeline {  
    agent any

    stages {  
        stage('Git Checkout') { 
            steps { 
                git branch: 'development', url: 'https://github.com/Swathi971/demo.git'
            } 
        }  
    }  
}
```
##### 3. Jenkins Setup:
* Go to Jenkins Dashboard → New Item Enter item name: test1-pipeline → Select: Pipeline → Click OK
* Scroll to Pipeline → Definition: Pipeline script → Paste the above script → Click Apply → Save → Click Build Now
<img src=".github/images/img_33.png" alt="pipelinescriptin" width="60%"/>

##### 4. Error: Git Clone Failed
I encountered the following error: 
```commandline
❌ Error in cloning repository
```
Click build now-> click on the failed build and select console output.

##### 5. Manual Clone (Troubleshooting Step):
To check whether it's a network or permission issue, run this on Jenkins server:
```commandline
[root@jenkins-server ~]# git clone https://github.com/Swathi971/demo.git
```
If this works, the issue is likely one of the following:
* Jenkins does not have git installed
* Jenkins does not have internet access
* Jenkins user lacks SSH key / credentials (if repo is private)

##### Trigger the Jenkins Pipeline
* Go to Jenkins Dashboard
* Select your pipeline job (e.g., test1-pipeline)
* Click Build Now
* Once the build finishes, click on the build number (e.g., #1)
* Click Console Output
You should see:
<img src=".github/images/img_51.png" alt="pipelinescripting" width="60%"/>

This means the Jenkins pipeline successfully:
* Checked out the development branch
* Executed the code (as defined in the pipeline stages)
___
### Automating Jenkins Pipeline with GitHub Branch (No Manual Branch Switch)
#### Use a Pipeline Project with Jenkinsfile from GitHub
##### Step 1: Push Jenkinsfile to swathi Branch
* Open Visual Studio Code
* Add your Jenkinsfile under a folder (e.g., jenkins/Jenkinsfile)
* Stage → Commit → Sync Changes
Now your Jenkinsfile is in the swathi branch on GitHub
<img src=".github/images/img_52.png" alt="pipelinescripting" width="60%"/>
<img src=".github/images/img_56.png" alt="pipelinescripting" width="60%"/>

##### Step 2: Configure Jenkins Pipeline Job
* Go to Jenkins → New Item → Name it (e.g., test-pipeline) → Choose Pipeline → OK

##### Step 3: Configure Git Repository and Jenkinsfile
* Scroll down to the Pipeline section
* Select: Pipeline script from SCM
* SCM: Git
* Repository URL:
```commandline
https://github.com/Swathi971/demo.git
```
<img src=".github/images/img_53.png" alt="pipelinescripting" width="60%"/>

* Branch Specifier:
```commandline
*/swathi
```
* Script path(path to Jenkinsfile inside the repo):
```commandline
jenkins/Jenkinsfile
```
Make sure this path matches the actual location in your GitHub repo.
<img src=".github/images/img_54.png" alt="pipelinescripting" width="60%"/>
* Click Apply → Save

##### Step 4: Trigger Build
* Click Build Now → Go to Console Output
* If configured correctly, Jenkins will:
    * Checkout the swathi branch to read the Jenkinsfile 
    * Inside the Jenkinsfile, it will checkout the development branch for the actual application code
<img src=".github/images/img_55.png" alt="pipelinescripting" width="60%"/>

---
#### Visualize Jenkins Pipeline stages clearly using the Pipeline Stage View plugin
When running pipelines, it's hard to understand:
* Which stage is currently running
* What each stage is doing
* Where the pipeline failed (if it did)

##### Step 1: Install Plugin
Go to Jenkins Dashboard → Click Manage Jenkins → Manage Plugins → Select the Available tab → Search for Pipeline Stage View → Check the box → Click Install → Go back to top page

<img src=".github/images/img_57.png" alt="pipelinescripting" width="60%"/>

##### Step 2: Use the Plugin in Your Pipeline Job
* Go to your pipeline job (e.g., test1-pipeline)
* Run the pipeline by clicking Build Now
* You will now see a Stage View section
<img src=".github/images/img_58.png" alt="pipelinescripting" width="60%"/>

This shows:
* Each stage as a box (e.g., Git Checkout, Compile, Build)
* Real-time status (e.g., In Progress, Passed, Failed)
* Execution time per stage

##### Step 3: View Detailed Logs for Each Stage
* Click on any stage name (like Git Checkout)
You’ll see the Console Output for that specific stage
<img src=".github/images/img_59.png" alt="pipelinescripting" width="60%"/>

---

 [Created the new repo called trail -> Creating new folder called jenkins-> creating the jenkinsfile inside the folder in VS code 
https://github.com/Swathi971/trail 

Copy the code from Jenkinsfile which is in https://github.com/ManojKRISHNAPPA/Project-movie-app/tree/main]

![img_10.png](img_10.png)
 All these are gotten it from Maven life cycle:
[Introduction to the Build Lifecycle – Maven](https://maven.apache.org/guides/introduction/introduction-to-the-lifecycle.html)

##### Jenkinsfile
```commandline
pipeline {
    agent any

    stages {
        stage('git-checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/Swathi971/trail.git'
            }
        }

        stage('compile') {
            steps {
                sh 'mvn compile'
            }
        }

        stage('build') {
            steps {
                sh 'mvn clean package'
            }
        }
    }
}
```
Now we will create a new pipeline:
Project-1-pipeline-OK-> Pipeline script from SCM-> SCM- Git-> Branch specifier- main-> Script path-> Jenkins/JenkinsFile-> Apply- save.
![img_11.png](img_11.png)
Here I got the error, so I cloned to trail branch manually in terminal.
![img_12.png](img_12.png)

Click Build now:
![img_13.png](img_13.png)
Errors: mvn file is not here
![img_14.png](img_14.png)
 Install maven:
Dashboard-> manage jenkins-> tools- maven Installation- name-maven- apply save. 
![img_15.png](img_15.png)

So, I must show that I am using maven in this pipeline; for that we have one option called tools section. Here I have mentioned that I am using maven tool in this pipeline (VS code)- commit message from vs code to Github:
![img_17.png](img_17.png)

Build now:
 i am running this entire code in java-17. But I need java-11.
![img_18.png](img_18.png)

 Install Java:

To install any Java products, maven plugin should be installed. So go to plugins- available plugins-search eclipse- eclipse tumerin installer-it provides an installer for JDK
![img_20.png](img_20.png)

Go back to tools-> add jdk- name java-11-install  automatically- adoptioum.net-look for java 11
Apply-save 
![img_16.png](img_16.png)

Now we must tell jenkins that use java –11:
![img_19.png](img_19.png)

Error because there was not pom.xml:
![img_21.png](img_21.png)

Build success:
![img_25.png](img_25.png)

![img_23.png](img_23.png)
![img_24.png](img_24.png)

pom.xml:
```commandline
<project xmlns="http://maven.apache.org/POM/4.0.0"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">

  <modelVersion>4.0.0</modelVersion>

  <groupId>com.example</groupId>
  <artifactId>simple</artifactId>
  <version>1.0-SNAPSHOT</version>

  <properties>
    <maven.compiler.source>11</maven.compiler.source>
    <maven.compiler.target>11</maven.compiler.target>
  </properties>

  <build>
    <plugins>
      <!-- Compiler Plugin to use Java 11 -->
      <plugin>
        <groupId>org.apache.maven.plugins</groupId>
        <artifactId>maven-compiler-plugin</artifactId>
        <version>3.8.1</version>
        <configuration>
          <source>11</source>
          <target>11</target>
        </configuration>
      </plugin>

      <!-- Optional: Plugin to create an executable JAR -->
      <plugin>
        <groupId>org.apache.maven.plugins</groupId>
        <artifactId>maven-jar-plugin</artifactId>
        <version>3.2.2</version>
        <configuration>
          <archive>
            <manifest>
              <mainClass>com.example.App</mainClass> <!-- Must match your class with main() -->
            </manifest>
          </archive>
        </configuration>
      </plugin>
    </plugins>
  </build>

</project>
```
 





