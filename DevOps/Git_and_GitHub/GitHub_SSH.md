### SSH Authentication: Local to Remote (Key-Based)
1. **Check Existing .ssh Directory** 
```commandline
ls -a
cd .ssh
ls
```
→ You found only the authorized_keys file, which is used for incoming SSH connections, but not for outbound ones (like GitHub).

2.  **Generate SSH Key Pair**
```commandline
ssh-keygen
```
* When prompted:

→ Press Enter to save to default location: /root/.ssh/id_rsa

→ Leave passphrase empty (just press Enter twice)

* Output:

→ Private key: /root/.ssh/id_rsa

→ Public key: /root/.ssh/id_rsa.pub

3. **Copy Public Key**
```commandline
cat id_rsa.pub
```
* Output: 

→ a long ssh-rsa string

→ Copy this entire string.

4. **Add Key to GitHub**

→ Go to GitHub > Settings > SSH and GPG keys

→ Click “New SSH Key”

→ Paste the key you copied in Step 3

→ Click “Add SSH Key”

✅ Result: Now GitHub can trust your machine via SSH.

5. **Clone Repository Using SSH**
* Get your SSH URL from GitHub repository:

→ Click on Code > SSH

→ Copy the URL:
```commandline
git@github.com:Swathi971/demo.git
```
* Then clone it:
```commandline
git clone git@github.com:Swathi971/demo.git
```
* On first connection you'll see:
```commandline
The authenticity of host 'github.com' can't be established...
Are you sure you want to continue connecting? yes
```
→ Type: yes

✅ Result: Repository is cloned successfully using SSH.