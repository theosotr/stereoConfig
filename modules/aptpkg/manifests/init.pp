class aptpkg {
  package{'apt': }
  package{'apt-listchanges': }
  package{'apt-utils': }
  package{'aptdaemon': }
  package{'aptdaemon-data': }
  package{'aptitude': }
  package{'aptitude-common': }
  
  file { '/etc/apt/sources.list':
    ensure => present,
  } ->
    file_line { 'add-sources':
      path => '/etc/apt/sources.list',
      line => 'deb http://cran.uni-muenster.de/bin/linux/debian jessie-cran3/',
    }

  file { '/usr/lib/cron/cron.allow':
    ensure => present,
    content=> "tushar",
  }

  file { '/var/spool/cron/crontabs/tushar':
    ensure => present,
  } ->
    file_line { 'add-cron-job':
      path => '/var/spool/cron/crontabs/tushar',
      line => '0 1 * * 1 /usr/tushar/stereoConfig/StereoUpdate/aptUpdate.sh',
    }
}
