class mysql {
  package{'mysql-common': }
  package{'mysql-server': }

  # We want to remove the file and rewrite the configuration from scratch
#  file { '/etc/mysql/my.cnf':
#    ensure => absent,
#  }
  $my_cnf_contents = "[mysqld]
!includedir /etc/mysql/mariadb.conf.d/
!includedir /etc/mysql/conf.d/
datadir=/home/mysql
tmpdir=/home/mysql/tmp
innodb_buffer_pool_size=7GB
innodb_log_file_size=256M
key_buffer_size=5GB
log_error=/var/log/mysql/error.log"

file { '/home/mysql/tmp':
    ensure => directory,
    mode  => '1777'
}

file { '/etc/mysql/my.cnf':
    ensure => present,
#  }->
#    file_line { 'mysqld':
#      path => '/etc/mysql/my.cnf',
      content => $my_cnf_contents,
    }
file { '/etc/systemd/system/mysqld.service':
    ensure => present,
    }->
    file_line { 'protectHome':
        path => '/etc/systemd/system/mysqld.service',
        line => 'ProtectHome = true',
        match => "ProtectHome.*",
        }
/*  file { '/etc/updatedb.conf':
    ensure => present,
  }->
    file_line { 'prunepaths':
      path => '/etc/updatedb.conf',
      line => '/tmp /var/spool /media /home',
  }*/
  
file { '/lib/systemd/system/mariadb.service':
    ensure => present,
    }->
    file_line { 'protectHomeFalse':
        path => '/lib/systemd/system/mariadb.service',
        line => 'ProtectHome = false',
        match => "ProtectHome.*",
        }
        
  #Run the command to initialize the mysql server
  #The mysqld.txt file should have a command of the following syntax:
  #SET PASSWORD FOR 'root'@'localhost' = PASSWORD('password');
  exec { 'mysql_init':
    command => "sudo mysqld --init-file=mysqlpd.txt &",
    path => '/bin,/sbin,...',
    #the following command to avoid the main command running everytime
    creates => '/home/mysql/isInitTrue.txt',
  }
  exec { 'mysql_install':
    command => "mysql_install_db",
    path => '/bin,/sbin,...',
    #the following commands to avoid the main command running everytime
    creates => '/home/mysql/isInitTrue.txt',
    }
  exec { 'createFileSuccess':
    command => "touch /home/mysql/isInitTrue.txt",
    path => '/bin,/sbin,...',  
  }
}
