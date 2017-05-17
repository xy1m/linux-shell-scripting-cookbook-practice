#!/bin/bash
#Filename: word_freq.sh

[ $# -ne 1 ] && echo "Usage: $0 filename" && exit -1

filename=$1

egrep -o "\b[[:alpha:]]+\b" $filename | \
	awk '{ count[$0]++ }
END{ printf("%-14s%d\n","Word","Count") ;
for(ind in count)
	{ printf("%-14s%d\n",ind,count[ind]); }
}'
