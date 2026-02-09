# GitHub SSH Bootstrap for Ubuntu


This repository provides a strict, copy-pasteable process to configure SSH-based GitHub access on an Ubuntu machine or server.


Follow the steps below exactly and in order.


## Step 1: Install Git


```bash
sudo apt update
sudo apt install -y git

##  Step 2: Clone this repository using HTTPS

SSH is not configured yet, so HTTPS must be used for the initial clone.

git clone https://github.com/jotyprokash/github-ssh-bootstrap.git
cd github-ssh-bootstrap
## Step 3: Make the setup script executable
chmod +x scripts/setup-github-ssh.sh
Step 4: Run the SSH setup script

Use the same email address associated with your GitHub account.

./scripts/setup-github-ssh.sh your-email@example.com

The script will generate an SSH key if one does not exist, start the SSH agent, add the key, and print the public key.

Step 5: Add the SSH key to GitHub

Copy the printed public key and add it in GitHub:

Settings → SSH and GPG keys → New SSH key

After adding the key, return to the terminal and press Enter.

Step 6: Confirm GitHub host authenticity

On first connection, you may see this prompt:

Are you sure you want to continue connecting (yes/no)?

Type yes and press Enter. This happens once per machine.

Step 7: Verify SSH authentication
ssh -T git@github.com

Expected output:

Hi <your-username>! You've successfully authenticated, but GitHub does not provide shell access.
Step 8: Configure Git identity (required on servers)

Git cannot create commits until a user identity is configured. Run these commands once per machine.

git config --global user.name "Your Name"
git config --global user.email "your-email@example.com"

Verify:

git config --global --list