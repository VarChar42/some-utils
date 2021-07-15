#!/bin/bash

ssh_dir="~/.ssh"

# ssh_dir="$(pwd)"

deploy_key_dir="$ssh_dir/deploy_keys/"
config_file="$ssh_dir/config"

hostname="github.com"

[ ! -d $deploy_key_dir ] && mkdir $deploy_key_dir

echo -n "Repository name: "
read repo_name

private_keyfile="$deploy_key_dir/$repo_name"

ssh-keygen -b 2048 -t rsa -N '' -f "$private_keyfile"

echo "Host $repo_name" >> "$config_file"
echo "	Hostname $hostname" >> "$config_file"
echo "	IdentityFile $private_keyfile" >> "$config_file"
echo "	IdentitiesOnly yes" >> "$config_file"

echo "DONE"
cat "$deploy_key_dir/${repo_name}.pub"