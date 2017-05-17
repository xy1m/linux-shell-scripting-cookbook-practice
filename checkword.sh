#!/bin/bash
#Filename: checkword.sh

word=$1
grep "^$1$" /usr/share/dict/web2 -q
[ $? -eq 0 ] && echo "$word is a dictionary word" || echo "$word is not a dictionary word"
