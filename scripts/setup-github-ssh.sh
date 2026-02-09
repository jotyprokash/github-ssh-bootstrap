#!/usr/bin/env bash
set -e

EMAIL="${1:-your-email@example.com}"
KEY_PATH="$HOME/.ssh/id_ed25519"

echo "Starting GitHub SSH setup"

# Ensure SSH directory exists
mkdir -p "$HOME/.ssh"
chmod 700 "$HOME/.ssh"

# Generate SSH key if it does not exist
if [ ! -f "$KEY_PATH" ]; then
  echo "Generating SSH key"
  ssh-keygen -t ed25519 -C "$EMAIL" -f "$KEY_PATH" -N ""
else
  echo "SSH key already exists, reusing it"
fi

# Start ssh-agent if not running
if ! pgrep -u "$USER" ssh-agent >/dev/null 2>&1; then
  eval "$(ssh-agent -s)"
fi

# Add key to agent
ssh-add "$KEY_PATH"

echo
echo "Copy the public key below and add it to your GitHub account:"
echo
cat "${KEY_PATH}.pub"
echo

echo "GitHub → Settings → SSH and GPG keys → New SSH key"
read -r -p "Press Enter after the key has been added..."

# Verify connection
ssh -T git@github.com || true

echo
echo "GitHub SSH setup complete"