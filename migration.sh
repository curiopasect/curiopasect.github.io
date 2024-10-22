#!/bin/bash

# Define color codes
YELLOW="\033[33m"
GREEN="\033[32m"
RESET="\033[0m"

clear

# Step 1: Updating package list
echo -e "${GREEN}Updating package list...${RESET}"
sudo apt update

# Step 2: Copy directories from Server 1 to Server 2
username="root"
read -p "Enter the IP address of the origin server: " server_ip
echo -e "${GREEN}Retrieving directories from $username@$server_ip...${RESET}"
sudo scp -r "root@$server_ip:/etc/letsencrypt/" "/etc/letsencrypt" && scp -r "root@$server_ip:/etc/x-ui-english/" "/etc/x-ui-english"

# Step 3: Install x-ui-english on Server 2
echo -e "${GREEN}Installing x-ui-english...${RESET}"
bash <(curl -Ls https://raw.githubusercontent.com/NidukaAkalanka/x-ui-english/master/install.sh)
x-ui restart

clear

echo -e "${GREEN}Migration successful.${RESET}"
echo -e "${YELLOW}Next steps:\n\t- Fetch new v2ray configs from X-UI Panel.\n\t- Add/replace them in https://github.com/curiopasect/kiwi/edit/main/index.html.${RESET}"
