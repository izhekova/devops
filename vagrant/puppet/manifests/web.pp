class { 'nginx': }

nginx::resource::vhost { 'devops':
  ensure               => present,
  listen_port          => 80,
  www_root             => '/usr/share/nginx/html/',
  use_default_location => true,
  access_log           => '/var/log/nginx/devops_access.log',
  error_log            => '/var/log/nginx/devops_error.log',
} ->
file { '/usr/share/nginx/html/index.html':
  ensure => present,
  source => ['puppet:///modules/nginx/index.html'],
}

exec {"Stop FW for testing purpose":
    command => "/sbin/service iptables stop",
 }
package { 'vim-enhanced':
  ensure => present,
}
