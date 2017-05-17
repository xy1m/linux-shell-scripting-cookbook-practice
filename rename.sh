#!/bin/bash

count=1;

for log in *.log
do
	new=log-$count.${log##*.}
	mv "$log" $new 2> /dev/null
	[ $? -eq 0 ] && echo "Renaming $log to $new"
	let count++
done

