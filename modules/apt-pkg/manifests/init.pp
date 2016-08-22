class apt-pkg {
  package{'apt': }
  package{'apt-listchanges': }
  package{'apt-utils': }
  package{'aptdaemon': }
  package{'aptdaemon-data': }
  package{'aptitude': }
  package{'aptitude-common': }
  
  File [ '/etc/apt/sources.list']
  ->
    file_line { 'add-sources':
      path => '/etc/apt/sources.list',
      line => 'deb http://cran.uni-muenster.de/bin/linux/debian jessie-cran3/',
    }
}
