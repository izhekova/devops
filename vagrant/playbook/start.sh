#!/bin/bash
PWD="/home/vagrant/errbit" 
cd $PWD
export MONGO_URL="mongodb://siteUserAdmin:admin@192.168.50.3:27017/admin"
export PATH="/usr/local/rvm/gems/ruby-2.1.9/bin:/usr/local/rvm/gems/ruby-2.1.9@global/bin:/usr/local/rvm/rubies/ruby-2.1.9/bin:/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/usr/local/rvm/bin:/root/bin"
export GEM_PATH="/usr/local/rvm/gems/ruby-2.1.9:/usr/local/rvm/gems/ruby-2.1.9@global"
nohup bundle exec rails server &
sleep 10
#END
