#!/bin/bash
#Filename: recursion.sh

f() {
	echo $1; 
	f hello; 
	sleep 1;
}

f hello
