#!/bin/bash


# Step 1: Updating package list
echo "Updating package list and installing Nginx..."
sudo apt update


# Step 2: Copy directories from Server 1 to Server 2
directories=("/etc/letsencrypt" "/etc/x-ui-english")
username="root"
read -p "Enter the IP address of Server 1: " server_ip
for dir in "${directories[@]}"; do
  echo "Copying $dir from $username@$server_ip to $dir on Server 2"
  sudo scp -r "$username@$server_ip:$dir/" "$dir"
done


# Step 3: Install x-ui-english on Server 2
echo "Installing x-ui-english..."
bash <(curl -Ls https://raw.githubusercontent.com/NidukaAkalanka/x-ui-english/master/install.sh)
x-ui restart



echo "All directories have been copied to their original locations on Server 2!"
