# puppet module corp104_backup
[![Build Status](https://travis-ci.org/104corp/puppet-corp104_backup.svg?branch=master)](https://travis-ci.org/104corp/puppet-corp104_backup)


#### Table of Contents

1. [Description](#description)
1. [Setup - The basics of getting started with corp104_backup](#setup)
    * [Beginning with corp104_backup](#beginning-with-corp104_backup)
1. [Usage - Configuration options and additional functionality](#usage)
1. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
1. [Limitations - OS compatibility, etc.](#limitations)
1. [Development - Guide for contributing to the module](#development)

## Description

The corp104_backup module installs, configures, and manages the corp104_backup service across a range of operating systems and distributions.

## Setup

### Beginning with corp104_backup

`include '::corp104_backup'` is enough to get you up and running.

## Usage

All parameters for the ntp module are contained within the main `::corp104_backup` class, so for any function of the module, set the options you want. See the common usages below for examples.

### Install and enable corp104_backup

```puppet
include '::corp104_backup'
```

### Generate backup script

```puppet
corp104_backup::cifs { 'default':
  backup_list = [ '/tmp', '/var/tmp' ],
}
```

### Backup to remote storage

```puppet
class { 'corp104_backup':
  server        => '10.1.10.200';
  server_target => '/backup',
  auth_user     => 'backup_user',
  auth_pass     => 'backup_pass',
  local_target  => '/backup',
}
```

### Notify to slack with proxy.

```puppet
class { 'corp104_backup':
  slack => {
    http_proxy => 'http://proxy.com:3128',
    channel    => 'slack_channel',
    webhook    => 'https://hooks.slack.com/services/xxxxx/xxxxxx'
  },
}
```

## Reference

### Classes

#### Public classes

* corp104_backup: Main class, includes all other classes.

#### Private classes

* corp104_backup Handles global config.
* corp104_backup::cifs Handles the backup config.


## Limitations

This module cannot guarantee installation of corp104_backup versions that are not available on  platform repositories.

This module is officially [supported](https://forge.puppetlabs.com/supported) for the following Java versions and platforms:

## Development

Puppet modules on the Puppet Forge are open projects, and community contributions are essential for keeping them great. Please follow our guidelines when contributing changes.

For more information, see our [module contribution guide.](https://docs.puppetlabs.com/forge/contributing.html)

### Contributors

To see who's already involved, see the [list of contributors.](https://github.com/puppetlabs/puppetlabs-ntp/graphs/contributors)
