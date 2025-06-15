##### Create launch template
* Launch template→ Create launch template
<img src=".github/images/img_2.png" alt="scaling" width="50%"/>

* Choose AMI:
<img src=".github/images/img_3.png" alt="scaling" width="50%"/>

* Choose the instance type:
<img src=".github/images/img_4.png" alt="scaling" width="50%"/>

* Network settings:
     * As a AWS best practice, don’t specify the subnet details inside the launch template instead specify while configuring ASG.
<img src=".github/images/img_6.png" alt="scaling" width="50%"/>
<img src=".github/images/img_4.png" alt="scaling" width="50%"/>

* Create the Security group:
<img src=".github/images/img_5.png" alt="scaling" width="50%"/>

_____
##### Create Auto Scaling Group
* EC2→ Auto Scaling Group→ Create Auto Scaling Group
* Select the launch template that you have created:
<img src=".github/images/img_7.png" alt="scaling" width="60%"/>

* Choose instance launch options:
     * Choose VPC and subnets:
<img src=".github/images/img_8.png" alt="scaling" width="50%"/>
* Integrate with other services:
<img src=".github/images/img_9.png" alt="scaling" width="50%"/>