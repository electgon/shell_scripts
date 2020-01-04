#!/bin/bash

## awk syntax
## awk '/pattern_to_find/ {action_to_perform}' ProcessedFile

##print second column of any line has the word "Architecture"
lscpu | awk '/Architecture/ {print $2}'

##print last column of any line has the word "Architecture"
lscpu | awk '/Architecture/ {print $NF}'

##print only letters 1 to 3 of second column of any line has the word "Architecture"
lscpu | awk '/Architecture/ {print substr($2, 1, 3)}'

##remove last letter when printing first column of any line has the word "bit"
lscpu | awk '/64/ {print substr($1, 1, length($1)-1)}'

##print any line has the word CPU
lscpu | awk '/CPU/ {print }'

##Assign last column in a variable 
lscpu | awk '/Architecture/{a=$NF} END{print a}'

##Search for a pattern in a file and print its second column in a specific string
## the file we search in has "#define CONTROLLINO_OVERLOAD 74"  
awk '/CONTROLLINO_/ {print "{STR("$2"), "$2"},"}' headers/MINI.c > MINI_param.txt


## EOF ###