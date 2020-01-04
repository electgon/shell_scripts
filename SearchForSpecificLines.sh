#! /bin/bash

# This script is used to read file lines and
# check if each line exists in other files

echo "Start Searching ...."

awk '/CONTROLLINO_/ {print "{STR("$2"), "$2"},"}' headers/MINI.c > MINI_param.txt
awk '/CONTROLLINO_/ {print "{STR("$2"), "$2"},"}' headers/MAXI.c > MAXI_param.txt
awk '/CONTROLLINO_/ {print "{STR("$2"), "$2"},"}' headers/MAXI_Auto.c > MAXI_Auto_param.txt
awk '/CONTROLLINO_/ {print "{STR("$2"), "$2"},"}' headers/MEGA.c > MEGA_param.txt



while read x; do 
    retVal=$(grep "${x}" MAXI_param.txt Auto_param.txt MEGA_param.txt)
	if [ $? -eq 1 ]; then
	    echo "${x}" >> in_MINI_only.grep
		echo >> in_MINI_only.grep
	fi
	
	if [ $(echo "${retVal}" | wc -l) -eq 1 ]; then
	    echo "${retVal}" >> in_010203.grep
	    echo >> in_010203.grep
	fi	
	if [ $(echo "${retVal}" | wc -l) -eq 2 ]; then
	    echo "${retVal}" >> in_012013023.grep
	    echo >> in_012013023.grep
	fi	
	if [ $(echo "${retVal}" | wc -l) -eq 3 ]; then
	    echo "${retVal}" >> in_ALL_00.grep
	    echo >> in_ALL_00.grep
	fi
done < MINI_param.txt

while read x; do 
    retVal=$(grep "${x}" MINI_param.txt Auto_param.txt MEGA_param.txt)
	if [ $? -eq 1 ]; then
	    echo "${x}" >> in_MAXI_only.grep
		echo >> in_MAXI_only.grep
	fi
	
	if [ $(echo "${retVal}" | wc -l) -eq 1 ]; then
	    echo "${retVal}" >> in_101213.grep
	    echo >> in_101213.grep
	fi	
	if [ $(echo "${retVal}" | wc -l) -eq 2 ]; then
	    echo "${retVal}" >> in_102103123.grep
	    echo >> in_102103123.grep
	fi	
	if [ $(echo "${retVal}" | wc -l) -eq 3 ]; then
	    echo "${retVal}" >> in_ALL_01.grep
	    echo >> in_ALL_01.grep
	fi
done < MAXI_param.txt

while read x; do 
    retVal=$(grep "${x}" MINI_param.txt MAXI_param.txt MEGA_param.txt)
	if [ $? -eq 1 ]; then
	    echo "${x}" >> in_Auto_only.grep
		echo >> in_Auto_only.grep
	fi
	
	if [ $(echo "${retVal}" | wc -l) -eq 1 ]; then
	    echo "${retVal}" >> in_202123.grep
	    echo >> in_202123.grep
	fi	
	if [ $(echo "${retVal}" | wc -l) -eq 2 ]; then
	    echo "${retVal}" >> in_201203213.grep
	    echo >> in_201203213.grep
	fi	
	if [ $(echo "${retVal}" | wc -l) -eq 3 ]; then
	    echo "${retVal}" >> in_ALL_02.grep
	    echo >> in_ALL_02.grep
	fi
done < Auto_param.txt

while read x; do 
    retVal=$(grep "${x}" MINI_param.txt MAXI_param.txt Auto_param.txt)
	if [ $? -eq 1 ]; then
	    echo "${x}" >> in_MEGA_only.grep
		echo >> in_MEGA_only.grep
	fi
	
	if [ $(echo "${retVal}" | wc -l) -eq 1 ]; then
	    echo "${retVal}" >> in_303132.grep
	    echo >> in_303132.grep
	fi	
	if [ $(echo "${retVal}" | wc -l) -eq 2 ]; then
	    echo "${retVal}" >> in_301302312.grep
	    echo >> in_301302312.grep
	fi	
	if [ $(echo "${retVal}" | wc -l) -eq 3 ]; then
	    echo "${retVal}" >> in_ALL_03.grep
	    echo >> in_ALL_03.grep
	fi
done < MEGA_param.txt