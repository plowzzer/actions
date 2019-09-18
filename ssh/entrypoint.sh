#!/bin/sh

set -e

SSH_PATH="$HOME/.ssh"

echo "Starting connection to $HOST as $USER..."

mkdir -p "$SSH_PATH"
touch "$SSH_PATH/known_hosts"

echo "$PRIVATE_KEY" > "$SSH_PATH/deploy_key"

sudo chmod 700 "$SSH_PATH"
sudo chmod 600 "$SSH_PATH/known_hosts"
sudo chmod 600 "$SSH_PATH/deploy_key"

eval $(ssh-agent)
ssh-add "$SSH_PATH/deploy_key"

ssh-keyscan -t rsa $HOST >> "$SSH_PATH/known_hosts"

ssh -o StrictHostKeyChecking=no -A -tt -p ${PORT:-22} $USER@$HOST "$*"
