#!/bin/bash

# Define color codes
GREEN="\033[32m"
RESET="\033[0m"

clear

# Step 1: Updating package list
echo -e "${GREEN}Updating package list and installing Nginx...${RESET}"
sudo apt update

# Step 2: Copy directories from Server 1 to Server 2
directories=("/etc/letsencrypt" "/etc/x-ui-english")
username="root"
read -p "Enter the IP address of Server 1: " server_ip
for dir in "${directories[@]}"; do
  echo -e "${GREEN}Copying $dir from $username@$server_ip to $dir on Server 2${RESET}"
  sudo scp -r "$username@$server_ip:$dir/" "$dir"
done

# Step 3: Install x-ui-english on Server 2
echo -e "${GREEN}Installing x-ui-english...${RESET}"
bash <(curl -Ls https://raw.githubusercontent.com/NidukaAkalanka/x-ui-english/master/install.sh)
x-ui restart

echo -e "${GREEN}Migration successful.${RESET}"
