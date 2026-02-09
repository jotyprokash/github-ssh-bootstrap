# GitHub SSH Bootstrap for Ubuntu

This repository sets up SSH-based access to GitHub on an Ubuntu machine.

After completing the setup, you can clone repositories, pull changes, and push code without being asked for passwords or access tokens. You authenticate once, and GitHub trusts your machine from then on.

---

## Why this repository exists

GitHub authentication can become repetitive and noisy, especially on new machines. SSH solves this by providing a secure and long-lived way to authenticate.

This repository packages that setup into a small, repeatable process.

---

## How to use this repository

On a new machine, start by cloning this repository using HTTPS. This is important because SSH is not configured yet.

Move into the cloned directory and run the setup script. The script will guide you through the process and print your public SSH key.

Add that key to your GitHub account under SSH and GPG keys. Once the key is added, return to the terminal and let the script verify the connection.

This setup only needs to be done once per machine.

---

## After the setup

Once SSH is configured, use Git normally.

Clone repositories using SSH, make your changes, commit, and push. GitHub will not ask you to authenticate again. This works from any folder and inside VS Code.

If an SSH key already exists on the machine, the script will reuse it safely.

---

## What is included here

This repository contains a setup script, short documentation explaining how SSH authentication works, and simple examples for common Git workflows.

Everything is intentionally minimal and easy to read.

---

## Who this is for

This is for developers and DevOps engineers who want a clean and predictable GitHub setup on Ubuntu, either for personal use or when onboarding new machines.

---

## Final note

Good tooling should be quiet. This repository is meant to be run once and then forgotten.