#!/bin/bash
#Filename: ping.sh

for ip in 192.168.0.{1..10};
do
	(ping $ip -c 2 &> /dev/null;
	if [ $? -eq 0 ];
	then
		echo $ip is alive
	else
		echo $ip is dead
	fi
	)&
done

wait
