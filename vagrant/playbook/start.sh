#!/bin/bash
PWD="/home/vagrant/errbit" 
export MONGO_URL="mongodb://siteUserAdmin:admin@192.168.50.3:27017/admin"
cd $PWD
sudo nohup bundle exec rails server &
sleep 10
#END
