#include git
include '::gnupg'
include nginx
package { 'vim-enhanced':
    ensure => present
}
service { 'iptables':
    ensure => stopped
}
class { '::rvm': 
    install_dependencies => true
}
rvm_system_ruby {
    'ruby-2.1.9':
        ensure      => 'present',
        default_use => false;
}
class {'::mongodb::globals':
    manage_package_repo => true,
} 
class {'mongodb::client':}
