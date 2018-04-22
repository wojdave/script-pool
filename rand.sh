#!/bin/bash 
# returns random 2 thru 8 char string

echo $(cat /dev/urandom | tr -dc 'A-Za-z0-9' | head -c$(($RANDOM % 7 + 2)))

#echo $(cat /dev/urandom | tr -dc 'A-Za-z' | head -c8)
