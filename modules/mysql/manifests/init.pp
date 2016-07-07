class mysql {
  package{'mysql-client-5.5': }
  package{'mysql-common': }
  package{'mysql-server': }
  package{'mysql-server-5.5': }
  package{'mysql-server-core-5.5': }

  file { '/etc/mysql/my.cnf':
    ensure => present,
  }->
    file_line { 'datadir':
      path => '/etc/mysql/my.cnf',
      line => 'datadir = /home/mysql',
      match => '^datadir *=.*$',
    }
  File [ '/etc/mysql/my.cnf']
  ->
    file_line { 'tmpdir':
      path => '/etc/mysql/my.cnf',
      line => 'tmpdir = /home/tmp',
      match => '^tmpdir *=.*$',
    }
  File [ '/etc/mysql/my.cnf']
  ->
    file_line { 'bufferPool':
      path => '/etc/mysql/my.cnf',
      line => 'innodb_buffer_pool_size=1GB',
    }
  File ['/etc/mysql/my.cnf']
  ->
    file_line { 'logerror':
      path => '/etc/mysql/my.cnf',
      line => 'log_error=/var/log/mysql/error.log',
    }
}
