#### Merge conflict
##### Scenario 1:
```commandline
[root@ip-11-0-23-165 microdegree]# git push -u origin main
Username for 'https://github.com': Swathi971
Password for 'https://Swathi971@github.com':
To https://github.com/Swathi971/Lab-Notes.git
 ! [rejected]        main -> main (non-fast-forward)
error: failed to push some refs to 'https://github.com/Swathi971/Lab-Notes.git'
hint: Updates were rejected because the tip of your current branch is behind
hint: its remote counterpart. If you want to integrate the remote changes,
hint: use 'git pull' before pushing again.
hint: See the 'Note about fast-forwards' in 'git push --help' for details.
[root@ip-11-0-23-165 microdegree]# git pull
There is no tracking information for the current branch.
Please specify which branch you want to merge with.
See git-pull(1) for details.

    git pull <remote> <branch>

If you wish to set tracking information for this branch you can do so with:

    git branch --set-upstream-to=origin/<branch> main
```
You're getting the error because your local branch (main) is behind the remote branch on GitHub — meaning there are commits on GitHub that you don't have locally.

**Step 1: Set the upstream branch and pull changes**

* Run this to set tracking and pull the latest changes from GitHub:
```commandline
git pull --rebase origin main
```
--rebase ensures your local changes are replayed on top of the latest remote changes to avoid unnecessary merge commits.

**Step 2: Push your changes**

* Once the pull/rebase is successful, push again:
```commandline
git push origin main
```
##### Scenario 2:
```commandline
[root@ip-11-0-23-165 microdegree]# git pull
There is no tracking information for the current branch.
Please specify which branch you want to merge with.
See git-pull(1) for details.

    git pull <remote> <branch>

If you wish to set tracking information for this branch you can do so with:

    git branch --set-upstream-to=origin/<branch> main
```
This message means you're on a local branch (main) that doesn't know which remote branch to pull from. To fix this, you need to either:

**Set up tracking branch:**
If you want Git to remember the upstream branch so you can just do git pull or git push in the future:
```commandline
git branch --set-upstream-to=origin/main main
```
Then next time you can simply run:
```commandline
git pull
```