#!/bin/bash
#Filename: silent_grep.sh

[ $# -ne 2 ] && echo "$0 match_text filename"

match_text=$1
filename=$2

grep -q $match_text $filename

[ $? -eq 0 ] && echo "exist" || echo "not exist"
