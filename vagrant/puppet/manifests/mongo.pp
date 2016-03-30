package { 'vim-enhanced':
    ensure => present,
}

class {'::mongodb::globals':
	manage_package_repo => true,
	repo_location => 'http://downloads-distro.mongodb.org/repo/redhat/os/x86_64/',
} ->

class {'::mongodb::server': 
	auth	=> false,
	ensure	=> present,
	rest	=> true
	} ->

class {'mongodb::client':}->

mongodb::db { 'mongotestdb':
    user          => 'mongouser',
    password_hash => 'a15fbfca5e3a758be80ceaf42458bcd8',
}
