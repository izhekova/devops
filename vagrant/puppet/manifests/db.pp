class { 'mysql::server':
	root_password           => 'devops_password',
	remove_default_accounts => true,
	override_options        => $override_options
}

package { 'vim-enhanced':
  ensure => present,
}
