#!/bin/bash
#Filename: password.sh

echo -n "Input a password:"
stty -echo
read password
stty echo
echo
echo "Your password: $password"

