#!/bin/bash
#Filename: match_palindrome.sh

if [ $# -ne 2 ];
then
	echo "Usage: $0 filename $1"
	echo "Whole parameters: $*"
	echo "Whole parameters2: $@"
	exit -1
fi

filename=$1;
basepattern='/^\(.\)'
count=$(( $2 / 2 ))

for((i=1;i<$count;i++))
do
	basepattern=$basepattern'\(.\)';
done

if [ $(( $2 % 2)) -ne 0 ];
then
	basepattern=$basepattern'.';
fi

for((count;count>0;count--))
do
	basepattern=$basepattern'\'"$count" ;
done

basepattern=$basepattern'$/p'
sed -n "$basepattern" $filename


