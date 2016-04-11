class { '::mongodb::globals':
    manage_package_repo => 'true',
} ->
class { '::mongodb::server':
    bind_ip  => '0.0.0.0',
    auth => true,
} ->

package { "mongodb-org-shell":
  ensure  => installed,
} 
mongodb_user { mongouser:
  username      => 'mongouser',
  ensure        => present,
  password_hash =>  mongodb_password('mongouser', <MongoPassword>),
  database      => 'admin',
  roles         => [ 'readWrite', 'userAdmin', 'dbOwner', 'dbAdmin','userAdminAnyDatabase'],
  tries         => 10,
  require       => Class['mongodb::server'],
}
