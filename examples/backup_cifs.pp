class { 'corp104_backup':
  server        => '10.1.10.200',
  server_target => '/backup',
  auth_user     => 'backup_user',
  auth_pass     => 'backup_pass',
  local_target  => '/backup',
}

corp104_backup::cifs { 'default':
  backup_list => [ '/tmp', '/var/tmp' ],
}
