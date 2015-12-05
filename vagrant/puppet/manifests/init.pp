package { 'vim-enhanced':
  ensure => present,
}

file { '/var/www/':
  ensure => 'directory',
}

