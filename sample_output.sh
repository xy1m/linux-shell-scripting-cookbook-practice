#!/bin/bash
#Filename: sample_output.sh

echo "Hello World!"

printf "%-5s %-10s %-4.2f\n" Apple Banana 123.45678
printf "%5s %5s %2.2f\n" A Apple Banana 123456789.0001

echo -n "Hello"; echo "World"
echo -e "1\t2\t3"

# 0=reset 30=black 31=red 32=green 33=yellow 34=blue 35=foreign red 36=light blue 37=white
# 0=reset 40=black 41=red 42=green 43=yellow 44=blue 45=foreign red 46=light blue 47=white
echo -e "\e[1;31m This is red text \e[0m"
echo -e "\e[1;42m This is green background \e[0m"

if [ $UID -ne 0 ]; then
echo "Non root user"
else
echo "Root user"
fi

