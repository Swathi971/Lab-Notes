### Creating Git Automation with Alias and .bashrc
**Step 1: Shell Script to Automate Git Add, Commit, Push**

````
[root@jenkins-server ~]# vi test.sh 
#!bin/bash 
read -p "Enter your commit messages:" message
git add . 
git commit -m "$message" 
git push  
````
This script automates the Git commit and push process using a user-provided commit message 
```
[root@ip-11-0-29-173 ~]# realpath test.sh
/root/test.sh
```
Saved this script as: /root/test.sh

bashrc and bashprofile 2 files are there; whatever we make changes in these 2 files, it only take immediate effect we do source or else we reboot the system, it will take immediate effect. 

[root@ip-11-0-29-173 ~]# /root/test.sh
-bash: /root/test.sh: cannot execute: required file not found

[root@ip-11-0-29-173 ~]# add
-bash: add: command not found

[root@ip-11-0-29-173 ~]# ls -a
.  ..  .bash_logout  .bash_profile  .bashrc  .cshrc  .ssh  .tcshrc  .viminfo  simple  test.sh

**Step 2: Make the Script Executable**
Run this:
```commandline
chmod +x /root/test.sh
```
**Step 3: Add Alias in .bashrc**
Add this line at the bottom of .bashrc:
```commandline
alias add='/root/test.sh'
```
```
[root@ip-11-0-29-173 ~]# vi .bashrc
# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias add='/root/test.sh'
```
This creates a custom command add that runs our script.

**Step 4: Apply .bashrc Changes**
To apply alias changes without rebooting:
Run this to apply the changes:
```
source ~/.bashrc
```
Now the command add will work in any terminal session.

**Step 5: Use the Alias to Commit Code**
Clone a Git repo and edit code.html(or any file):
```commandline
[root@ip-11-0-13-201 demo]# vi code.html
```
Run:
```
[root@ip-11-0-13-201 demo]# add 
``` 
Enter commit message:
```
Enter your commit messages: updated the code 
```
##### Output:
```
/root/test.sh: line 3: read: `-': not a valid identifier 

On branch swathi 

Your branch is up to date with 'origin/swathi'. 

 nothing to commit, working tree clean 

Everything up-to-date 
```
___
#### Importance of .bashrc and .bash_profile for Alias Commands
**What is .bashrc?**
* .bashrc is a script that runs every time you open a new terminal session (interactive shell).
* It is used to set: Environment variables, Shell options, Alias commands, Functions
* Best place to define alias commands that you want available every time you open the terminal.

**What is .bash_profile?**
* .bash_profile runs only once when you log into the system (login shell).
* It's often used to:
  * Set environment variables
  * Load .bashrc like this:
```commandline
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi
```
* Its role is to set up the environment and then load .bashrc to ensure alias and functions work in login shells too.

**So Why Are They Important for Aliases?**
| File            | Purpose for Alias                                              |
| --------------- | -------------------------------------------------------------- |
| `.bashrc`       | Define aliases for every terminal session                      |
| `.bash_profile` | Ensures `.bashrc` runs on login (so aliases work on login too) |

If you define aliases in .bashrc, they are available in all interactive terminals.
##### What is an Alias in Shell?
An alias is a shortcut command used to replace a long or complex command with a short name.
**Alias syntax**
```commandline
alias shortname='actual_command'
```
**Example:**
```alias ll='ls -alF'
alias gs='git status'
alias add='/root/test.sh'
```
**How Aliases Help in Shell Scripting**
Aliases are not typically used inside scripts, but they are extremely helpful in day-to-day shell usage:
| Use Case                        | Benefit                                  |
| ------------------------------- | ---------------------------------------- |
| Repeating long commands         | Save time (e.g., `docker ps -a` → `dps`) |
| Making dangerous commands safer | `alias rm='rm -i'` to ask before delete  |
| Running your own scripts easily | `alias deploy='/root/deploy.sh'`         |
| Reduce typing                   | `alias gco='git checkout'`               |

**Important Note:**
* Aliases do not work inside scripts by default (they only work in interactive shells).
* For scripts, use functions or define full commands.

| Feature          | `.bashrc`                     | `.bash_profile`           |
| ---------------- | ----------------------------- | ------------------------- |
| Runs on          | Every terminal                | First login only          |
| Use for aliases? | ✅ Yes                         | ⚠️ Only to call `.bashrc` |
| Best for         | Aliases, functions, variables | Login setup               |




