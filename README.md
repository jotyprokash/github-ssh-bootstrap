# GitHub SSH Bootstrap for Ubuntu


A simple and reproducible way to configure SSH-based GitHub access on an Ubuntu machine or server.


This setup allows you to clone repositories, commit changes, and push code to GitHub without passwords or access tokens. Authentication is handled entirely through SSH.


---


## Installation


Since SSH is not configured yet, the initial clone must use HTTPS.


```bash
sudo apt update
sudo apt install -y git


git clone https://github.com/jotyprokash/github-ssh-bootstrap.git
cd github-ssh-bootstrap

Make the setup script executable.

chmod +x scripts/setup-github-ssh.sh

Run the SSH setup script using the email address associated with your GitHub account.

./scripts/setup-github-ssh.sh your-email@example.com

The script will generate an SSH key if one does not exist, start the SSH agent, add the key, and print the public SSH key.

Usage

Copy the printed public key and add it to GitHub:

Settings → SSH and GPG keys → New SSH key

After adding the key, return to the terminal and press Enter.

On first connection, GitHub may ask to confirm host authenticity:

Are you sure you want to continue connecting (yes/no)?

Type yes and press Enter. This happens once per machine.

Verify SSH authentication:

ssh -T git@github.com

Expected output:

Hi <your-username>! You've successfully authenticated, but GitHub does not provide shell access.
Git Configuration (Required on Servers)

On fresh servers, Git cannot create commits until a user identity is configured.

Run the following commands once per machine:

git config --global user.name "Your Name"
git config --global user.email "your-email@example.com"

Verify the configuration:

git config --global --list
Working with Repositories

After setup, use Git normally with SSH.

Clone a repository:

git clone git@github.com:OWNER/REPO.git

Make changes and push them to GitHub:

git status
git add .
git commit -m "Your commit message"
git push

No passwords or access tokens will be required.

Notes

This setup is required once per machine

Existing SSH keys are reused safely

Git identity configuration is mandatory for committing changes

Suitable for laptops, servers, and long-running environment