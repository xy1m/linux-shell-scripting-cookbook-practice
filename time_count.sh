#!/bin/bash
#Filename: time_count.sh

start=$(date +%s)
find ~ -name router 2>/dev/null;
end=$(date +%s)
difference=$(( end - start ))
echo "time taken $difference seconds"
