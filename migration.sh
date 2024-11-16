#!/bin/bash

# Define color codes and clear the screen
YELLOW="\033[33m"
GREEN="\033[32m"
RESET="\033[0m"

clear
echo "Starting the process..."
sleep 1.5
echo "Process has started."

# Step 1: Updating package list
echo -e "${GREEN}Updating package list...${RESET}"
sudo apt update
echo -e "${GREEN}Update successful.${RESET}"
sleep 1.5
echo -e "\n\n\n\n\n\n\n"

# Step 2: Copy directories from Server 1 to Server 2
username="root"
read -p "Enter the IP address of the origin server: " server_ip
echo -e "${GREEN}Retrieving directories from $username@$server_ip...${RESET}"
sleep 1
sudo scp -r "root@$server_ip:/etc/x-ui-english/" "/etc/x-ui-english"
sleep 2.5
echo -e "\n\n\n\n\n\n\n"

# Step 3: Install x-ui-english on Server 2
echo -e "${GREEN}Installing x-ui-english...${RESET}"
bash <(curl -Ls https://raw.githubusercontent.com/NidukaAkalanka/x-ui-english/master/install.sh)
x-ui restart
echo -e "\n\n\n\n\n\n\n"

# Result
echo -e "${GREEN}Migration attempted and probably succeeded.${RESET}"
sleep 2
echo -e "${YELLOW}Next steps:\n\t- Fetch new v2ray configs from this very server's X-UI Panel.\n\t- Add/replace them in https://github.com/curiopasect/kiwi/edit/main/index.html.\n\t- Add/replace them in https://github.com/curiopasect/curiopasect.github.io/edit/main/index.html.${RESET}"
