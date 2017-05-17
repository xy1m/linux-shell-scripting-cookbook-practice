#!/bin/bash

sort -nc $1 

[ $? -eq 0 ] && echo 'sorted' || echo 'unsorted'
