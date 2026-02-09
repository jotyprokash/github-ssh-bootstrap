# Initialize and Push a Local Project

This example shows how to take an existing local folder and publish it to GitHub using SSH.

```bash
cd /path/to/your/project
git init
git remote add origin git@github.com:USERNAME/REPO.git
git branch -M main
git add .
git commit -m "Initial commit"
git push -u origin main