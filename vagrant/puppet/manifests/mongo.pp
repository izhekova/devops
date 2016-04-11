package { 'vim-enhanced':
    ensure => present,
}

class {'::mongodb::globals':
	manage_package_repo => true,
	repo_location => 'http://downloads-distro.mongodb.org/repo/redhat/os/x86_64/',
} ->

#class {'::mongodb::server': 
#	ensure	=> present,
#    auth => true,
#	rest	=> true,
#    bind_ip => '192.168.10.3'
#	} ->

#class {'mongodb::client':}->

#mongodb_user { mongouser:
#  name          => 'mongouser',
#  ensure        => present,
#  password_hash => mongodb_password('mongouser', 'passwd123'),
#  database      => admin,
#  roles         => [ 'readWrite', 'userAdmin', 'dbOwner', 'dbAdmin','userAdminAnyDatabase' ],
#  tries         => 10,
#  require       => Class['mongodb::server'],
#}


class {'::mongodb::server':
    auth              => true,
    bind_ip           => ['192.168.10.3'],
    port              => 27017,
    verbose           => true
  }
  
  mongodb_user { 'siteUserAdmin':
    username      => 'siteUserAdmin',
    ensure        => present,
    password_hash => mongodb_password('siteUserAdmin', 'admin'),
    database      => 'admin',
    roles         => ['userAdminAnyDatabase'],
    tries         => 10,
    require       => Class['::mongodb::server'],
  }
  
  mongodb_database { 'mongotestdb':
    ensure        => present,
    tries         => 10,
  }
  
  mongodb_user { 'mongouser':
    username      => 'mongouser',
    ensure        => present,
    password_hash => mongodb_password('mongouser', 'passwd123'),
    database      => ['admin', 'mongotestdb'],
    roles         => ['readWrite', 'dbAdmin'],
    tries         => 10,
  }
