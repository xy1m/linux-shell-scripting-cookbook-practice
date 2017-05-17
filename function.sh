#!/bin/bash
#Filename: function.sh

fun() {
	echo $1, $2;
	echo $@;
	echo $*;
	return 0;
}

