#!/bin/bash
# Created by Irena Zhekova 2015-12-04

log_file='./access.log'

read -p "Please choose which result you want to see? 
       1) Successful results per minute
       2) Number of error results per minute
       3) Mean response time per minute
       4) MB sent per minute
       5) Dowload test acess log file
Your choise here:" result
    case $result in
        1) awk '$9 == 200' $log_file | cut -d[ -f2 | cut -d] -f1 | awk -F: '{print "Successful request at " $2":"$3}' | sort -nk1 -nk2 | uniq -c ;;
        2) awk '$9 == 500 || $9 == 404' $log_file | cut -d[ -f2 | cut -d] -f1 | awk -F: '{print "Bad request at " $2":"$3}' | sort -nk1 -nk2 | uniq -c ;;
        3) awk '$6 == "\"GET"' $log_file | awk -F'[ ]' '{ print $4 $NF}' | awk -F '[:]' '{ print $2":"$3 " " $NF}' |awk '{a[$1]+=$NF}END{for(i in a) print "Average " i,a[i]/1024/1024 " MB"}' | sort ;;
        4) awk '$6 == "\"GET"' $log_file | awk -F'[ ]' '{ print $4 $NF-1}' | awk -F '[:]' '{ print $2":"$3 " " $NF}' |awk '{count[$1]++;a[$1]+=$NF}END{for(i in a) print i " Average " a[i]/1024/1024/count[i] " MB" " Total " a[i]/1024/1024 " MB"}' | sort ;;
        5) wget https://s3-eu-west-1.amazonaws.com/skyscanner-recruitement-resources/devops/access-log-example/c930ecf4b0a4426e619bddd8752c475ea772427db13eb92ee6a1a79b248ec0dc/access.log ;;
        *) echo "Please choose valid option" ;;
    esac
