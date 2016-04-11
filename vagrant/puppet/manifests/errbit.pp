#include epel
include git
package { 'vim-enhanced':
    ensure => present
}
include nginx
