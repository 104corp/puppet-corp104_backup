# Class: corp104_backup
# ===========================
#
# Full description of class corp104_backup here.
#
# Parameters
# ----------
#
# Document parameters here.
#
# * `sample parameter`
# Explanation of what this parameter affects and what it defaults to.
# e.g. "Specify one or more upstream ntp servers as an array."
#
# Variables
# ----------
#
# Here you should define a list of variables that this module would require.
#
# * `sample variable`
#  Explanation of how this variable affects the function of this class and if
#  it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#  External Node Classifier as a comma separated list of hostnames." (Note,
#  global variables should be avoided in favor of class parameters as
#  of Puppet 2.6.)
#
# Examples
# --------
#
# @example
#    class { 'corp104_backup':
#      servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#    }
#
# Authors
# -------
#
# Author Name <author@domain.com>
#
# Copyright
# ---------
#
# Copyright 2017 Your name here, unless otherwise noted.
#
class corp104_backup (
  Optional[String] $server,
  Optional[String] $server_target,
  Optional[String] $local_target,
  Optional[String] $auth_user,
  Optional[String] $auth_pass,
  Optional[String] $http_proxy,
  Optional[Hash] $slack,
  Boolean $backup_verify,
  String $bin_dir,
  String $bin_owner,
  String $bin_group,
  String $bin_mode,
  String $log_dir,
  String $tmp_backup_dir,
  String $tmp_dir,
  Integer $save_day,
  $cron_hour,
  $cron_minute,
){}
