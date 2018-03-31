#!/bin/bash

#||||| Script to scan recent modified C files  |||||| 
#||||| then stores its name in array to be used||||||
#||||| for another processing step.            ||||||
#|||||-----------------------------------------||||||

#cd /path/to/Cfiles

Loopnumber=0
arraynumber=0

#Scan all modified files
#-----------------------

for f in *.c
do

Loopnumber=$((Loopnumber+1))
echo "$Loopnumber"

MY_FILENAME=$f
echo "You have $MY_FILENAME"

Mod_Date=$(date -r $MY_FILENAME +%Y-%m-%d)
echo "file modified in $Mod_Date"

Heute=$(date +%Y-%m-%d)
echo "Today is $Heute"

if [ "$Mod_Date" == "$Heute" ]; then
arraynumber=$((arraynumber+1))
FileArray[$arraynumber]=$MY_FILENAME
fi


done

#Build make file for modified files
#----------------------------------

printf 'makeCompile: ' >> Result
echo ${FileArray[@]} >> Result
printf '\tgcc ' >> Result
echo ${FileArray[@]} '-o mod_files' >> Result


#Run make file
#-------------
#make -f Result



