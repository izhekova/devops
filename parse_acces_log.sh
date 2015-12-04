#!/bin/bash
# Created by Irena Zhekova 2015-12-04

log_file='/home/izhekova/devops/access.log'
counter=0
good=0
bad=0
request_time=0
TIME=0
SENTMB=0
temp_file=/home/izhekova/devops/temp_file.txt
for hours in $(seq -w 0 23)  ; do
	for minutes in $(seq -w 0 59); do
			grep "$hours:$minutes"  $log_file >> $temp_file
			while read -r line
			do
				CODE=`echo $line | awk -F' ' '{print $9}'`  
	      	                temp_time=`echo $line |awk -F' ' '{print $NF}'`
				temp_sent=`echo $line |awk '{NF--; print $NF}'`
				temp_request=`echo $line |awk -F ' ' '{print $6}'`
				TIME=$(( $TIME + $temp_time ))
				
				case $CODE in
				200)
					good=$((good+1))
				;;
				500)	
					bad=$((bad+1))	
				;;
				esac
				
				if [ "$temp_request" == '"GET' ]; then
                                        counter=$((counter+1))
                                        SENTMB=$(( $SENTMB + $temp_sent ))
                                else
                                        continue
                                fi	
				done < $temp_file
	
			file_lines=`wc -l < $temp_file`
			echo "Successful requests for $hours:$minutes:" $good
			echo "BAD requests for `date +%Y`:$hours:$minutes" are $bad
			if [ "$file_lines" != "0" ]; then 
				echo "Mean response time per minute: " $(( $TIME / $file_lines ))
				echo "MB sent per minute: " $(( $(( $SENTMB / $counter )) / 1024 ))
			else
				continue
			fi	
				echo
                        echo -n "" > $temp_file
	done					
done									
	
