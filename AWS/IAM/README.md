## IAM- Identity and Access Management
### Enabling MFA:
##### Login to AWS Console as a root user:
* Home → Security Credentials

<img src="img.png" alt="Home" width="500"/>

##### Assign MFA device:
<img src="img_1.png" alt="Home" width="500"/>

##### Selecting MFA device:
* Device name → OPPO → MFA device options → Authenticator app → next
<img src="img_2.png" alt="Home" width="400"/>
If you want to remove MFA device: Home → Security Credentials → Assign MFA device → Passkeys and security keys → Remove.

##### Click See a list of compatible applications: Virtual authenticator apps (Do not click it)- it is just an information:
<img src="img_4.png" alt="Home" width="400"/>
<img src="img_3.png" alt="Home" width="500"/>

##### Set up device:
* Google Authenticator app: Download the app in mobile. Open the app-> Click show QR code in laptop → scan the QR code using app. There is a 6-digit code after scanning in app. Enter the code in MFA Code 1 (Laptop). After 30 seconds you will see another code. Enter it in MFA Code 2 → Add MFA.
<img src="img_6.png" alt="Home" width="400"/>

##### Sign in to the root user:
* Now sign-out from your account → Sign in to the root user → Enter email address → MFA Code → submit. There is no problem if password or email address is leaked because MFA code is needed to sign in.
<img src="img_5.png" alt="Home" width="200"/>

___

#### Creating IAM user account: 
* Creating IAM user account and granting administrative permissions to the user and login to the IAM user for day-to-day activities. You should be in root user.
##### Creating IAM User:
* IAM- users- create user.
<img src="img_7.png" alt="Home" width="600"/>

##### Specify User details:
* username- (testuser)
* Choose Provide user access to aws console
* Choose Custom password
* Disable the users must create a new password.
<img src="img_8.png" alt="Home" width="500"/>

##### Set Permissions:
* Select Attach policy directly
* Permissions policies  → AdministratorAccess
<img src="img_9.png" alt="Home" width="500"/>

##### Logging in as IAM User:
* Now I have created IAM user and I want to practice lab by logging in as IAM user:
<img src="img_10.png" alt="Home" width="500"/>

##### Sign in using an URL:
* You will see this page after creating IAM user Retrieve password
* Copy the sign in URL → Sign out → Paste it in the new tab → Enter
<img src="img_11.png" alt="Home" width="500"/>
<img src="img_12.png" alt="Home" width="200"/>

* IAM user sign in → Account ID → user name → (testuser) and password
* Now I have log in as IAM user and region should be North Virginia.
___

### IAM service
##### Specify user details:
* username → (Devuser)
* Select provide user access to aws console
* Choose I want to create an IAM user
* Choose Autogenerated password
* Enable the users must create a new password at next sign in.

<img src="img_14.png" alt="Home" width="500"/>

##### Set permissions:
* Choose Attach policy directly, Permissions policies → Ec2FullAccess
<img src="img_13.png" alt="Home" width="500"/>

##### Review and create:
<img src="img_15.png" alt="Home" width="500"/>

##### Retrieve Password:
* Copy the password → Copy the url → paste it in URL

<img src="img_20.png" alt="Home" width="500"/>

##### Login as Devuser:
<img src="img_17.png" alt="Home" width="200"/>

##### Set a newpassword:
<img src="img_18.png" alt="Home" width="200"/>

##### Logged in as Devuser:
<img src="img_19.png" alt="Home" width="600"/>

___
#### IAM Group
##### Creating user group:
* User groups → Create group
<img src="img_21.png" alt="Home" width="600"/>

* UserGroup name → Developersgroup, policy name → AmazonRDSFullAccess
<img src="img_22.png" alt="Home" width="500"/>

##### Add users to the group:
* User groups → Developersgroup → Add users
<img src="img_23.png" alt="Home" width="500"/>
<img src="img_24.png" alt="Home" width="500"/>

##### Adding or removing permissions to a particular user:
* User groups → Developersgroup → Users → Devuser/testuser
<img src="img_25.png" alt="Home" width="500"/>

* There are 3 policies are attached to the Devuser:
<img src="img_26.png" alt="Home" width="500"/>

* There are 2 policies are attached to the testuser:
<img src="img_27.png" alt="Home" width="500"/>

___
### IAM Role
#### Creating IAM role:
* IAM → Roles → create role
* Trusted entity type → AWS account
<img src="img_28.png" alt="Home" width="500"/>

* Add permissions → AmazonS3FullAccess
<img src="img_29.png" alt="Home" width="500"/>

* Role name → Test-role
<img src="img_30.png" alt="Home" width="500"/>

* By default, trust policy is added
<img src="img_31.png" alt="Home" width="500"/>

#### Assume Role:
##### Granting permissions to the user:
* Users - Devuser
* Add permissions → Create inline policy
<img src="img_32.png" alt="Home" width="500"/>

* Copy the ARN details of Test-role1:
<img src="img_33.png" alt="Home" width="500"/>

##### Specify permissions: 
* Action: "sts:AssumeRole",
* Resource: ARN details of particular resource
<img src="img_34.png" alt="Home" width="500"/>

##### Create Policy:
* Policy name → TestinlinePolicy
<img src="img_35.png" alt="Home" width="500"/>
<img src="img_36.png" alt="Home" width="500"/>

##### IAM user assuming the IAM Role:
* Sign-out
* Sign-in as Devuser
<img src="img_37.png" alt="Home" width="200"/>
<img src="img_38.png" alt="Home" width="500"/>

* Devuser assuming the Test-role1
* Switch role:
<img src="img_39.png" alt="Home" width="500"/>

* Successfully assumed the role:
<img src="img_40.png" alt="Home" width="500"/>







