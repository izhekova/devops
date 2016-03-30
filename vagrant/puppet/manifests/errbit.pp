class { 'ruby':
    gems_version  => 'latest'
}
package { 'vim-enhanced':
    ensure => present
}

