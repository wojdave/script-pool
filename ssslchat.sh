#!/bin/sh
 
#change this if your port is busy
port=3004
 
usage () {
	echo "******************** SSSLCHAT ********************"
	echo "U S A G E"
	echo "SERVER: ssslchat.sh server [password]"
	echo "CLIENT: ssslchat.sh client [password] [ip|hostname]"
	exit 1
}
 
mode=$1
pass=$2
ip_or_host=$3
 
encode(){
 
	password=$1
 
	while [ True ]
	do
		read userinput
		encodedmessage=`echo "$userinput" | openssl enc -rc4 -k $password | openssl enc -a`
		echo "$encodedmessage"
	done
}
 
decode(){
 
	password=$1
 
	while [ True ]
	do
		read encodedinput
		decodedmessage=`echo "$encodedinput" | openssl enc -d -a | openssl enc -d -rc4 -k $password`
		echo "+$decodedmessage"
	done
}
 
case $mode in
	"server") encode $pass | nc -l -p $port | decode $pass ;;
	"client") encode $pass | nc $ip_or_host $port | decode $pass ;;
	*) usage ;;
esac
