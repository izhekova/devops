# parse_acces_log.sh

The parse_acces_log.sh script is interactive script that will go over Apache access.log file in the following format "%a %I %u %t \"%r\" %>s %b %D" and based on user choice will print:

       1) Successful results per minute (any request that returns HTTP 200)
       2) Number of error results per minute (any request that returns HTTP 404 an 500)
       3) Mean response time per minute in seconds (average response time)
       4) MB sent per minute (all GET requests)
       5) Dowload test access log file (this will allow you to download sample access.log)


How I have tested the results:

for option 1)

` cat access.log |grep "30/Mar/2015:11:11"| awk '$9 == 200'|wc -l `

for option 2)

` cat access.log |grep "30/Mar/2015:11:07"| awk '$9 == 404 || $9 == 500' |wc -l `

for option 3)

for option 4)

# Vagrant

The vagrant folder contains the necessity to start two VM configured with puppet, one running nginx and the other running MySQL. You can start them by running: 

`vagrant up`

After succesful start you should be able to open `http://127.0.0.1:8080/` and see a welcome page.
