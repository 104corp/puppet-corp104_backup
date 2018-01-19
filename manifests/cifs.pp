define corp104_backup::cifs (
  Array $backup_list,
  Optional[String] $server = $corp104_backup::server,
  Optional[String] $server_target = $corp104_backup::server_target,
  Optional[String] $local_target = $corp104_backup::local_target,
  Optional[String] $auth_user = $corp104_backup::auth_user,
  Optional[String] $auth_pass = $corp104_backup::auth_pass,
  Integer $save_day = $corp104_backup::save_day,
  String $log_dir = $corp104_backup::log_dir,
  String $tmp_backup_dir = $corp104_backup::tmp_backup_dir,
  String $tmp_dir = $corp104_backup::tmp_dir,
  Optional[String] $http_proxy = $corp104_backup::http_proxy,
  Optional[Hash] $slack = $corp104_backup::slack,
  $cron_hour = $corp104_backup::cron_hour,
  $cron_minute = $corp104_backup::cron_minute,
){
  file { "${corp104_backup::bin_dir}/backup-${name}.sh":
    ensure  => file,
    owner   => $corp104_backup::bin_owner,
    group   => $corp104_backup::bin_group,
    mode    => $corp104_backup::bin_mode,
    content => template("${module_name}/backup_cifs.sh.erb"),
  }

  cron { "backup-${name}":
    ensure  => present,
    command => "/bin/bash ${corp104_backup::bin_dir}/backup-${name}.sh",
    hour    => $cron_hour,
    minute  => $cron_minute,
  }

  file { '/etc/logrotate.d/corp104_backup':
    ensure  => present,
    content => template("${module_name}/corp104_backup.erb"),
  }
}
