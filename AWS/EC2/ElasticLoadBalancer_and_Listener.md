### Configure load balancer and listener
#### Setting up an application load balancer for two target groups:
##### Launch four instances
* Key pair is not needed
<img src=".github/images/img_31.png" alt="elastic load balancer" width="60%"/>

* Choose VPC, Subnets and Security group:
<img src=".github/images/img_32.png" alt="elastic load balancer" width="50%"/>

* Write a script in user data:
<img src=".github/images/img_33.png" alt="elastic load balancer" width="50%"/>

* Four instances are created:
<img src=".github/images/img_34.png" alt="elastic load balancer" width="50%"/>

---

##### Create target groups
* Create one target group:
```
Target type- Instances
Target group name- Targetgroup1
Protocol- HTTP
IP address type- IPv4
```
* Choose the VPC:
    * Choose the vpc in which our instances are running 
    * Remaining- default
* Register targets:
  * Select 2 instances→ Include as pending below→ Create target group:
<img src=".github/images/img_35.png" alt="elastic load balancer" width="50%"/>

* Create another target group:
```
Target type- Instances
Target group name- Targetgroup2
Protocol- HTTP
IP address type- IPv4
```
* Choose the VPC:
    * Choose the vpc in which our instances are running 
    * Remaining- default
* Register targets:
  * Select 2 instances→ Include as pending below→ Create target group:
<img src=".github/images/img_36.png" alt="elastic load balancer" width="50%"/>

* Two target groups have created:
<img src=".github/images/img_37.png" alt="elastic load balancer" width="60%"/>
---
##### Setting up an Application load balancer for two target groups
* Create Application load balancer:
<img src=".github/images/img_38.png" alt="elastic load balancer" width="60%"/>
* Choose VPC, Subnets and AZs:
<img src=".github/images/img_39.png" alt="elastic load balancer" width="50%"/>
* Add listeners and rules:
  * Add one listener rule



