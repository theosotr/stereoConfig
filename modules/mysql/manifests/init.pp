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

    file_line { 'tmpdir':
      path => '/etc/mysql/my.cnf',
      line => 'tmpdir = /home/tmp',
      match => '^tmpdir *=.*$',
    }

    file_line { 'bufferPool':
      path => '/etc/mysql/my.cnf',
      line => 'innodb_buffer_pool_size=1GB',
    }

    file_line { 'logerror':
      path => '/etc/mysql/my.cnf',
      line => 'log_error=/var/log/mysql/error.log',
    }
  file { '/etc/updatedb.conf':
    ensure => present,
  }->
    file_line { 'prunepaths':
      path => '/etc/updatedb.conf',
      line => '/tmp /var/spool /media /home',
  }
}