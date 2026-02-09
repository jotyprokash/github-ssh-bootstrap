# GitHub SSH Bootstrap for Ubuntu

A reproducible way to set up SSH-based GitHub access on an Ubuntu machine or server.

After completing this setup, you will be able to clone repositories, commit changes, and push code to GitHub without passwords or access tokens.



## What this setup does

- Installs Git (if missing)
- Generates an SSH key (if one does not exist)
- Adds the key to the SSH agent
- Verifies GitHub SSH authentication
- Configures Git identity (required for commits on servers)

This setup is required once per machine.


## Step 1: Install Git

```bash
sudo apt update
sudo apt install -y git
```


## Step 2: Clone this repository (HTTPS required)

SSH is not configured yet, so the first clone must use HTTPS.

```bash
git clone https://github.com/jotyprokash/github-ssh-bootstrap.git
cd github-ssh-bootstrap
```

## Step 3: Make the setup script executable

```bash
chmod +x scripts/setup-github-ssh.sh
```


## Step 4: Run the SSH setup script

Use the same email address that is linked to your GitHub account.

```bash
./scripts/setup-github-ssh.sh your-email@example.com
```

This script will create an SSH key if one does not exist, start the SSH agent, add the key, and print the public SSH key.


## Step 5: Add the SSH key to GitHub

1. Copy the printed public key  
2. Go to GitHub → Settings → SSH and GPG keys  
3. Click **New SSH key** and paste the key  

Return to the terminal and press Enter to continue.

## Step 6: Confirm GitHub host authenticity

On first connection, you may see:

```text
Are you sure you want to continue connecting (yes/no)?
```

Type `yes` and press Enter. This happens only once per machine.


## Step 7: Verify SSH authentication

```bash
ssh -T git@github.com
```

Expected output:

```text
Hi <your-username>! You've successfully authenticated, but GitHub does not provide shell access.
```

---

## Step 8: Configure Git identity (mandatory on servers)

Git cannot create commits until a user identity is configured.

Run these commands once per machine:

```bash
git config --global user.name "Your Name"
git config --global user.email "your-email@example.com"
```

Verify:

```bash
git config --global --list
```


## Step 9: Use Git normally with SSH

Clone repositories using SSH:

```bash
git clone git@github.com:OWNER/REPO.git
```

Make changes and push:

```bash
git status
git add .
git commit -m "Your commit message"
git push
```


## Notes

- Safe to run on laptops and servers
- Existing SSH keys are reused
- Designed for reproducibility and onboarding


