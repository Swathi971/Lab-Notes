###  Jenkins Installation
1. Launch an linux server in AWS and add security group rule [Custom TCP and 8080], t2.medium, storage- 20GB
2. Set up jenkins:
* Execute script.sh 
*  First we need to check whether the file has executable permissions/not, if it’s not
     * chmod 777 script.sh
* Run the file
     * ./jenkins.sh (or) sh jenkins.sh
3. Now, open the jenkins in browser  -  publicIP:8080
* JENKINS Default Path : /var/lib/jenkins   
     * Enter the password go to the particular path i.e. cd path
     * Click on install suggested plugins
4. Now, Start using jenkins