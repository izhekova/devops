package { 'vim-enhanced':
    ensure => present,
}
service { 'iptables':
    ensure => stopped
}
class {'::mongodb::globals':
	manage_package_repo => true,
	repo_location => 'http://downloads-distro.mongodb.org/repo/redhat/os/x86_64/',
} ->

class {'::mongodb::server': 
	ensure	=> present,
    auth => false,
	rest	=> true,
    port    => 27017,
    bind_ip => ['127.0.0.1', '192.168.10.3']
	} ->

class {'mongodb::client':}->

  mongodb_user { 'siteUserAdmin':
    username      => 'siteUserAdmin',
    ensure        => present,
    password_hash => mongodb_password('siteUserAdmin', 'admin'),
    database      => 'admin',
    roles         => ['userAdminAnyDatabase', 'userAdmin'],
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
    database      => ['mongotestdb'],
    roles         => ['readWrite', 'userAdmin', 'dbOwner', 'dbAdmin','userAdminAnyDatabase', 'root'],
    tries         => 10,
    require       => Class['mongodb::server'],
  }
