#!/bin/bash
# Created by Irena Zhekova 2015-12-04

log_file='/home/izhekova/devops/access.log'
counter=0
good=0
bad=0
request_time=0
temp_file=/home/izhekova/devops/temp_file.txt
for hours in $(seq -w 0 59)  ; do
	for minutes in $(seq -w 0 59); do
			grep "`date +%Y`:$hours:$minutes"  $log_file >> $temp_file
			while read -r line
			do
				CODE=`echo $line | awk -F' ' '{print $9}'`
	      	                temp_time=`echo $line |awk '{print $NF}'`
				TIME=$(( $TIME + $temp_time ))
				case $CODE in
				200)
					counter=$((counter+1))
					good=$((good+1))
				;;
				500)	
					counter=$((counter+1))
					bad=$((bad+1))	
				;;
				esac	
				done < $temp_file
                        file_lines=`wc -l < $temp_file`
			echo "Succsessfull request for `date +%Y`:$hours:$minutes" are $good
			echo "BAD request for `date +%Y`:$hours:$minutes" are $bad
			echo "Mean response time per minute" is $TIME/$file_lines
                        echo -n "" > $temp_file
	done					
done									
	
