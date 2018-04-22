#!/bin/bash
#hostname --fqd

#spoofmac
ifconfig wlan0 down
macchanger -a wlan0
ifconfig wlan0 up

cp -n /etc/hosts{,.old}

#newhn=$(cat /dev/urandom | tr -dc 'A-Za-z' | head -c8)
newhn=$(cat /dev/urandom | tr -dc 'A-Za-z0-9' | head -c$(($RANDOM % 7 + 2)))
echo $newhn > /etc/hostname

echo "127.0.0.1    localhost" > /etc/hosts
echo "127.0.0.1    $newhn" >> /etc/hosts
cat /etc/hosts.old >> /etc/hosts
service hostname.sh stop
sleep 1
service hostname.sh start
xhost +$newhn
exit
