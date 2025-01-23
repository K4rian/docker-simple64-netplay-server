#!/bin/ash
# simple64 Netplay Server Startup Script
#
# Server Files: /home/simple64

clear

s_command="
$HOME/simple64-netplay-server \
 --name=\"${S64NS_NAME}\" \
 --baseport=${S64NS_PORT} \
 --log-path=\"${S64NS_LOGPATH}\" \
 --motd=\"${S64NS_MOTD}\" \
 --max-games=${S64NS_MAXGAMES}"

add_optional_arg() {
  while [[ "$#" -gt 0 ]]; do
    s_command="$s_command $1"
    shift
  done
}

if [ "$S64NS_DISABLEBROADCAST" != "false" ]; then
  add_optional_arg "--disable-broadcast"
fi

if [ "$S64NS_ENABLEAUTH" != "false" ]; then
  add_optional_arg "--enable-auth"
fi

echo ""
echo "░█▀▀░▀█▀░█▄█░█▀█░█░░░█▀▀░▄▀▀░█░█░░░█▀█░█▀▀░▀█▀░█▀█░█░░░█▀█░█░█░░░█▀▀░█▀▀░█▀▄░█░█░█▀▀░█▀▄"
echo "░▀▀█░░█░░█░█░█▀▀░█░░░█▀▀░█▀▄░░▀█░░░█░█░█▀▀░░█░░█▀▀░█░░░█▀█░░█░░░░▀▀█░█▀▀░█▀▄░▀▄▀░█▀▀░█▀▄"
echo "░▀▀▀░▀▀▀░▀░▀░▀░░░▀▀▀░▀▀▀░░▀░░░░▀░░░▀░▀░▀▀▀░░▀░░▀░░░▀▀▀░▀░▀░░▀░░░░▀▀▀░▀▀▀░▀░▀░░▀░░▀▀▀░▀░▀"
echo ""

eval "$s_command"