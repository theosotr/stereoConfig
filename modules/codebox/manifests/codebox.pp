class codebox::cb {

  package { 'codebox':
    ensure => present,
    provider => 'npm',
    require => [
      Class['nodejs'],
      Package['node-gyp'],
    ]
  }

  package { 'node-gyp':
    ensure => 'present',
    provider => 'npm',
  }

  user { 'codebox':
    ensure => present,
    password => '*',
    home => '/home/codebox',
    shell => '/bin/bash',
    managehome => true,
    comment => 'Codebox IDE',
  }

  file { '/home/codebox':
    ensure => directory,
    mode => '0744',
    owner => 'codebox',
    require => User['codebox'],
  }

  file { '/home/codebox/Workspace':
    ensure => directory,
    owner => 'codebox',
    mode => '0744',
    require => [
      User['codebox'],
      File['/home/codebox'],
   ]
  }

  file { '/home/codebox/Workspace/swsys':
    ensure => directory,
    owner => 'codebox',
    mode => '0744',
    require => [
      User['codebox'],
      File['/home/codebox/Workspace'],
   ]
  }

  exec { 'git_init':
    command => 'git init Workspace/swsys',
    cwd => '/home/codebox',
    creates => '/home/codebox/Workspace/swsys/.git',
    user => 'codebox',
    path => '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin',
    require => [
      User['codebox'],
      File['/home/codebox'],
      Package['git'],
   ]
  }

  exec { 'make_pty.js':
    environment => 'HOME=/root',
    command => 'make clean && make',
    cwd => '/usr/lib/node_modules/codebox/node_modules/shux/node_modules/pty.js',
    path => '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin',
    user => 'root',
    require => [
      Package['codebox'],
      Package['node-gyp'],
    ]
  }

  exec { 'codebox_run':
    environment => 'HOME=/home/codebox',
    command => 'codebox run Workspace/swsys &',
    cwd => '/home/codebox',
    path => '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin',
    user => 'codebox',
    require => [
      Package['codebox'],
      Package['node-gyp'],
    ]
  }

}
