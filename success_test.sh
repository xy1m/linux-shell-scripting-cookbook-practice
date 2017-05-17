#!/bin/bash
#Filename: success_test.sh

CMD="echo hello world"
$CMD
if [ $? -eq 0 ]
then
	echo "$CMD success"
else
	echo "$CMD fail"
fi
