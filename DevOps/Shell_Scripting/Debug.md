#### How to Debug a Shell Script in Linux
* Use set -x to Trace Execution  and place at the top of your script:
```commandline
#!/bin/bash
set -x
```
It prints each command and its expanded arguments before executing and helps see what the script is actually doing.

##### Example:
```
[root@jenkins-server tmp]# vi add-user.sh 
```
```commandline
#!/bin/bash

# Ensure the script is run as root
if [ "$(id -u)" -ne 0 ]; then
  echo "This script must be run as root"
  exit 1
fi

# Check if username and email are provided
if [ -z "$1" ] || [ -z "$2" ]; then
  echo "Usage: $0 username email"
  exit 1
fi

# Assign arguments to variables
USERNAME="$1"
EMAIL="$2"

# Check if user already exists
if id "$USERNAME" &>/dev/null; then
  echo "User '$USERNAME' already exists"
  exit 1
fi

# Generate a random password
PASSWORD=$(openssl rand -base64 12)

# Create the user and set the password
useradd "$USERNAME"
echo "$USERNAME:$PASSWORD" | chpasswd

# Immediately expire the password to force a password change on first login
chage -d 0 "$USERNAME"

# Output username and password
echo "Username: $USERNAME"
echo "Generated Password: $PASSWORD"
echo "User '$USERNAME' created successfully with the generated password."

# Compose the email message
SUBJECT="New User Account Created"
MESSAGE="Hello,\n\nA new user account has been created for you on the system.\n\nUsername: $USERNAME\nPassword: $PASSWORD\n\nPlease change your password upon first login."

# Send the email with the user's details
echo -e "$MESSAGE" | mail -s "$SUBJECT" "$EMAIL"

# Check if email was sent successfully
if [ $? -eq 0 ]; then
  echo "Email sent to $EMAIL with the username and password."
else
  echo "Failed to send email."
fi
```
##### Run:
```
[root@jenkins-server tmp]# . /add-user.sh 
```
I didn't pass any arguments to the script.

##### Output:
```commandline
++ id -u
+ '[' 0 -ne 0 ']'
+ '[' -z '' ']'
+ echo 'Usage: ./add_user.sh username email'
Usage: ./add_user.sh username email 
+ exit 1
```
What This Means:
* $1 is empty (no first argument like username)
* $2 is also empty (no second argument like email)
* So, the script prints usage info and exits
 
##### Debug Output (set -x):
| Line                                           | Meaning                                                       |
| ---------------------------------------------- | ------------------------------------------------------------- |
| `++ id -u`                                     | Checks the current user’s UID (0 = root)                      |
| `+ '[' 0 -ne 0 ']'`                            | Since you're root (UID 0), the script continues               |
| `+ '[' -z '' ']'`                              | Checks if `$1` is empty (which it is)                         |
| `+ echo 'Usage: ./add_user.sh username email'` | Shows usage instructions                                      |
| `+ exit 1`                                     | Exits the script with error code 1 (because args are missing) |

##### Pass Required Arguments
Run it like this:
```commandline
./add_user.sh swathi swathi@example.com
```
Then it will:
* Create user swathi
* Generate a random password
* Email the credentials to swathi@example.com (assuming mail command is set up)

Your script exited because it requires two arguments: a username and an email. Since you didn't provide them, it printed the usage instructions and exited.

##### What does id -u do?
| Command | Meaning                                           |
| ------- | ------------------------------------------------- |
| `id`    | Shows user identity information                   |
| `-u`    | Returns the **user ID (UID)** of the current user |

id -u returns the numeric user ID. 0 means root. Your script uses it to ensure it’s being run as root.
##### -z in Shell Scripting
The -z flag is used in conditional expressions in shell scripts.
```
-z STRING
```
Returns true if the STRING is empty.



