#! /bin/bash

echo "Hellooo"

awk -F',' '/Liverpool/           {print " *** Nationality: "$11}' england_league_players.csv > Liverpool.txt
awk -F',' '/Arsenal/             {print " *** Nationality: "$11}' england_league_players.csv > Arsenal.txt
awk -F',' '/Chelsea/             {print " *** Nationality: "$11}' england_league_players.csv > Chelsea.txt
awk -F',' '/Manchester United/   {print " *** Nationality: "$11}' england_league_players.csv > ManUnited.txt


while read x; do 
    retVal=$(grep "${x}" Arsenal.txt Chelsea.txt ManUnited.txt)
	if [ $? -eq 1 ]; then
	    echo "${x}" >> in_Liverpool_only.grep
	fi
	
	if [ $(echo "${retVal}" | wc -l) -ge 1 ]; then
	    echo "${retVal}" >> in_others.grep
	fi	
	# if [ $(echo "${retVal}" | wc -l) -eq 2 ]; then
	    # echo "${retVal}" >> in_012013023.grep
	    # echo >> in_012013023.grep
	# fi	
	# if [ $(echo "${retVal}" | wc -l) -eq 3 ]; then
	    # echo "${retVal}" >> in_ALL_00.grep
	    # echo >> in_ALL_00.grep
	# fi
done < Liverpool.txt
