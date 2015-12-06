class { 'nginx': }

file { '/var/www':
  ensure => 'directory',
}

file { '/var/www/html':
    ensure => 'directory',
    owner   => nginx,
    group   => nginx,
}

file { '/var/www/html/devops':
  ensure => 'directory',
  source => ['puppet:///modules/nginx'],
  recurse => true,
}
nginx::resource::vhost { 'devops':
  ensure               => present,
  listen_port          => 80,
  www_root             => '/var/www/html/devops',
  use_default_location => true,
  access_log           => '/var/log/nginx/devops_access.log',
  error_log            => '/var/log/nginx/devops_error.log',
}
exec {"Stop FW for testing purpose":
    command => "/sbin/service iptables stop",
 }
package { 'vim-enhanced':
  ensure => present,
}
