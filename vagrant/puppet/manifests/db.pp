class { 'mysql::server':
	root_password           => 'devops_password',
	remove_default_accounts => true,
	override_options        => $override_options,
    bind_ip                 => '192.168.10.3' 
}

package { 'vim-enhanced':
  ensure => present,
}
