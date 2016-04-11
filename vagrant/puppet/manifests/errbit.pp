#include epel
include git
#class { 'ruby':
#    gems_version  => 'latest'
#}
package { 'vim-enhanced':
    ensure => present
}
