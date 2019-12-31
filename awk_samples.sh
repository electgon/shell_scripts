#!/bin/bash

## awk syntax
## awk '/pattern_to_find/ {action_to_perform}' ProcessedFile

##print second coloumn of any line has the word "Architecture"
lscpu | awk '/Architecture/ {print $2}'

##print last coloumn of any line has the word "Architecture"
lscpu | awk '/Architecture/ {print $NF}'

##print only letters 1 to 3 of second coloumn of any line has the word "Architecture"
lscpu | awk '/Architecture/ {print substr($2, 1, 3)}'

##remove last letter when printing first coloumn of any line has the word "bit"
lscpu | awk '/64/ {print substr($1, 1, length($1)-1)}'

##print any line has the word CPU
lscpu | awk '/CPU/ {print }'

##Assign last coloumn in a variable 
lscpu | awk '/Architecture/{a=$NF} END{print a}'

## EOF ###