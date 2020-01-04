#!/bin/bash


## Define working space
Working_DIR="$HOME/path/to/Monitoring"

##_____________________________________________

read -p "Which Parameter do you want to Monitor (Temperature/Memory/CPU):" TestParameter
read -p "for How many minutes do you want to Monitor:" Duration_total

##_______________________________________________

if [ $Duration_total -gt 60 ]; then
Duration_min=60
Duration_hour=$(($Duration_total/60))
else
Duration_min=$Duration_total
Duration_hour=0
fi


##_______________________________________________

##Initialization & Cleaning
cd $Working_DIR
Output_FileName="$TestParameter-values.txt"
>$Output_FileName
rm -f *.png
line_counter=1
Duration=1
start_time=$(date +%H:%M:%S)
start_hour=$(date +%H)
start_minute=$(date +%M)
end_minute=$(($start_minute + $Duration_min))
start_second=$(date +%S)
end_time="$start_hour:$end_minute:$start_second"


##_______________________________________________

## Record the variable
while [ $line_counter -le $((60*$Duration)) ]
do

if [ $Duration_min -gt 0 ]; then
   if [ $line_counter -eq 59 ]; then
      ((Duration_min--))
       line_counter=1
   fi 
elif [ $Duration_min -eq 0 ]; then
   if [ $Duration_hour -gt 0 ]; then
      ((Duration_hour--))
      Duration_min=59
   fi   
fi



if [ "$TestParameter" == "Temperature" ]; then
    Param_Command=$(date +%S)
elif [ "$TestParameter" == "Memory" ]; then
    Param_Command=$(free -m | awk 'FNR == 3 {print $3}')
 #Param_Command=$(sshpass -p "yourpassword" ssh -o StrictHostKeyChecking=no pi@192.168.147.36 free -m | awk 'FNR == 3 {print $3}')
elif [ "$TestParameter" == "CPU" ]; then
    Param_Command=$( mpstat -P ALL | awk 'FNR == 4 {print $3}' | sed 's/,/\./')
else
    echo "please enter valid option"
    exit
fi

printf '%s\t%s\n' $(date +%H:%M:%S) $Param_Command >> $Output_FileName
sleep 1
((line_counter++))

if [ $line_counter -eq $((20*$Duration)) ] || [ $line_counter -eq $((40*$Duration)) ]
then
Output_ShotName="$TestParameter-$Duration_hour-$Duration_min-$line_counter.png"

## Plot recorded values
gnuplot <<- EndGNUPLOT

set nokey
set xlabel "Time"
set ylabel "$TestParameter"
set title "$TestParameter Record" textcolor lt 3
set grid xtics ytics

set xdata time
set timefmt "%H:%M:%S"
set xrange ["$start_time":"$end_time"]
set format x "%M:%S"

set term png
set output "$Output_ShotName"
plot "$Output_FileName" using 1:2 with lines
set term x11

EndGNUPLOT
fi

done
##______________________________________________



# Plot recorded values
gnuplot -persist <<- EndGNUPLOT


set nokey
set xlabel "Time"
set ylabel "$TestParameter"
set title "$TestParameter Record" textcolor lt 3
set grid xtics ytics

set xdata time
set timefmt "%H:%M:%S"
set xrange ["$start_time":"$end_time"]
set format x "%M:%S"
plot "$Output_FileName" using 1:2 with lines

set term png
set output "$TestParameter-All.png"
replot
set term x11

EndGNUPLOT
