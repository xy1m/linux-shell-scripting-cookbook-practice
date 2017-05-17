#!/bin/bash
#Filename: loop.sh

echo "Fist loop"
list="1 2 3 4 5"

for var in $list
do
	echo $var
done

echo "Second loop"
list="a,b,c"

oldIFS=$IFS
IFS=,

for var in $list
do
	echo $var
done

IFS=$oldIFS

echo "Third loop"
for((i=0;i<3;i++)) {
	echo $i
}

echo "While loop"
count=0;
while [ $count -lt 3 ]
do
	echo $count
	let count++
done
