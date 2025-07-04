### Setting up an Application load balancer for target group
##### Create two instances
<img src=".github/images/img_17.png" alt="elastic load balancer" width="60%"/>

```commandline
AMI- Amazon Linux
instance type- t2.micro
key pair- Proceed without a key pair
```
##### Network settings
* Choose VPC, subnets and create security group:
<img src=".github/images/img_18.png" alt="elastic load balancer" width="50%"/>

* Allow inbound rules:
<img src=".github/images/img_19.png" alt="elastic load balancer" width="50%"/>

* Write a script in user data
<img src=".github/images/img_20.png" alt="elastic load balancer" width="50%"/>

```
#!/bin/bash

# Update all packages
yum update -y

# Install Apache HTTP Server
yum install -y httpd

# Start the Apache service
systemctl start httpd

# Enable Apache to start on boot
systemctl enable httpd

# Create a simple web page showing the server's IP address
echo "<h1>This message from: $(hostname -i)</h1>" > /var/www/html/index.html
```
##### Now launch the instances
* Two instances are created with a name Target 1 and Target 2
___
##### Create target groups
* EC2→ Target groups→ Create target group
```commandline
Target type- Instances
Target group name- TargetGroupTest
Protocol- HTTP
IP address type- IPv4
```
* Choose the VPC:
    * Choose the vpc in which our instances are running 
    * Remaining- default
<img src=".github/images/img_21.png" alt="elastic load balancer" width="50%"/>
<img src=".github/images/img_22.png" alt="elastic load balancer" width="50%"/>

* Register targets:
  * Select 2 instances→ Include as pending below→ Create target group
<img src=".github/images/img_23.png" alt="elastic load balancer" width="50%"/>
<img src=".github/images/img_24.png" alt="elastic load balancer" width="50%"/>

___

##### Create Load balancer
* EC2→ Load balancer→ Create load balancer
  * Load balancer Types→ Application Load Balancer
* Create Application Load Balancer:
<img src=".github/images/img_25.png" alt="elastic load balancer" width="50%"/>

* Choose VPC, AZ and subnets:
<img src=".github/images/img_26.png" alt="elastic load balancer" width="60%"/>

* Create Security group:
  * Outbound rules: Type→ All traffic, Destination→ 0.0.0.0/0
  * After creating security group choose ALBSecuritygroup 
<img src=".github/images/img_27.png" alt="elastic load balancer" width="60%"/>

* Add listeners and rules:
<img src=".github/images/img_29.png" alt="elastic load balancer" width="60%"/>

* Create load balancer:
<img src=".github/images/img_28.png" alt="elastic load balancer" width="60%"/>

* Copy the DNS name and paste in URL:
<img src=".github/images/img_30.png" alt="elastic load balancer" width="60%"/>
