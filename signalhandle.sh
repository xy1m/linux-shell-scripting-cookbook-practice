#!/bin/bash
#Filename: signalhandle.sh

function handler(){
	echo Hey, received signal : SIGINT
}

echo My process ID is $$

trap 'handler' SIGINT
while true
do
	sleep 1
done

