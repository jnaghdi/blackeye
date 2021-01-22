#!/bin/bash
printf "\n\e[93mInitializing Setup..."
/bin/sleep 2
printf "\nMaking sure everything is up-to-date!"
/bin/sleep 2
sudo /bin/apt update
printf "\e[93mInstalling the needed depencies...\n"
/bin/sleep 2
printf "\n\e[36mInstalling PHP..."
sudo /bin/apt install php7.4 > /dev/null 2>&1 ; /bin/sleep 1
printf "\e[93m✔"
printf "\n\e[36mInstalling WGET..." 
sudo /bin/apt install wget > /dev/null 2>&1 ; /bin/sleep 1
printf "\e[93m✔"
printf "\n\e[36mInstalling CURL..."
sudo /bin/apt install curl > /dev/null 2>&1 ; /bin/sleep 1
printf "\e[93m✔"
printf "\n\e[36mInstalling JQ..."
sudo /bin/apt install jq > /dev/null 2>&1 ; /bin/sleep 1
printf "\e[93m✔"
printf "\n\e[36mInstalling UNZIP..."
sudo /bin/apt install unzip > /dev/null 2>&1
printf "\e[93m✔"

if [[ -e ngrok ]]; then
echo ""
else

printf "\n\e[1;92m[\e[0m*\e[1;92m] Downloading Ngrok...\n"
arch=$(uname -a | grep -o 'arm' | head -n1)
arch2=$(uname -a | grep -o 'Android' | head -n1)
if [[ $arch == *'arm'* ]] || [[ $arch2 == *'Android'* ]] ; then
/bin/wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-arm.zip > /dev/null 2>&1

if [[ -e ngrok-stable-linux-arm.zip ]]; then
/bin/unzip ngrok-stable-linux-arm.zip > /dev/null 2>&1
/bin/chmod +x ngrok
/bin/rm -rf ngrok-stable-linux-arm.zip
else
printf "\n\e[1;93m[!] Download error... Termux, run:\e[0m\e[1;77m pkg install wget\e[0m\n"
exit 1
fi



else
/bin/wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-386.zip > /dev/null 2>&1 
if [[ -e ngrok-stable-linux-386.zip ]]; then
/bin/unzip ngrok-stable-linux-386.zip > /dev/null 2>&1
/bin/chmod +x ngrok
/bin/rm -rf ngrok-stable-linux-386.zip
else
printf "\n\e[1;93m[!] Download error... \e[0m\n"
exit 1
fi
fi
fi

printf "\n\e[36mInstalling Ngrok..."
printf "\e[93m✔"

printf "\n\n\e[32mDONE! Use bash blackeye.sh to run..."
