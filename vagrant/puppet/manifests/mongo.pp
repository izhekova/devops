package { 'vim-enhanced':
    ensure => present,
}
class {'::mongodb::server':
    auth => true,
}
mongodb::db { 'mongotestdb':
    user          => 'mongouser',
    password_hash => 'a15fbfca5e3a758be80ceaf42458bcd8',
}
