#!/bin/ash
# simple64 Netplay Server Startup Script
#
# Server Files: /home/simple64

clear

echo ""
echo "░█▀▀░▀█▀░█▄█░█▀█░█░░░█▀▀░▄▀▀░█░█░░░█▀█░█▀▀░▀█▀░█▀█░█░░░█▀█░█░█░░░█▀▀░█▀▀░█▀▄░█░█░█▀▀░█▀▄"
echo "░▀▀█░░█░░█░█░█▀▀░█░░░█▀▀░█▀▄░░▀█░░░█░█░█▀▀░░█░░█▀▀░█░░░█▀█░░█░░░░▀▀█░█▀▀░█▀▄░▀▄▀░█▀▀░█▀▄"
echo "░▀▀▀░▀▀▀░▀░▀░▀░░░▀▀▀░▀▀▀░░▀░░░░▀░░░▀░▀░▀▀▀░░▀░░▀░░░▀▀▀░▀░▀░░▀░░░░▀▀▀░▀▀▀░▀░▀░░▀░░▀▀▀░▀░▀"
echo ""

$HOME/simple64-netplay-server \
 --name="${S64NS_NAME}" \
 --baseport=${S64NS_PORT} \
 --log-path="${S64NS_LOGPATH}" \
 --motd="${S64NS_MOTD}" \
 --max-games=${S64NS_MAXGAMES} \
 --disable-broadcast=${S64NS_DISABLEBROADCAST} \
 --enable-auth=${S64NS_ENABLEAUTH}