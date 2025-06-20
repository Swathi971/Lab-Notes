### Creating a Remote Repository on GitHub (UI Method)
#### Step-by-Step Instructions:

1. Click the ➕ "+" icon (top right corner)
Choose "New repository" from the dropdown menu.
2. Enter repository details
* Repository name: Choose a name like myproject, portfolio, etc.
* Description (optional): Write a short description of your project.
* Visibility: Choose Public (visible to everyone) or Private.
3. Initialize with options (optional)
✅ You can check "Add a README file"
🟢 Optionally add a .gitignore and license (optional for fresh push)
4. Click “Create repository”
Your new remote repository is now ready on GitHub.
5. Copy the repository URL
* For HTTPS: https://github.com/YourUsername/repo-name.git
* For SSH (advanced): git@github.com:YourUsername/repo-name.git
6. Connect your local project to this remote (from your terminal):
```commandline
git remote add origin https://github.com/YourUsername/repo-name.git
```