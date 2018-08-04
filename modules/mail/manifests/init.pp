class mail {

  package{'postfix': }

  file {'/etc/postfix/main.cf':
    require => Package['postfix'],
    ensure  => present,
    source  => '/etc/puppet/modules/mail/main.cf',
    owner   => root,
    group   => root,
    mode    => "644",
    notify  => Service['postfix']
  }

  file {'/etc/mailname':
    content  => "stereo.dmst.aueb.gr\n",
    owner    => root,
    group    => root,
    mode     => "644",
    notify   => Service['postfix']
  }

  file {'/etc/postfix/master.cf':
    require => Package['postfix'],
    ensure  => present,
    source  => '/etc/puppet/modules/mail/master.cf',
    owner   => root,
    group   => root,
    mode    => "644",
    notify  => Service['postfix']
  }

  service { 'postfix':
    require => [
      Package['postfix'],
      File['/etc/postfix/main.cf'],
      File['/etc/postfix/master.cf'],
      File['/etc/mailname'],
    ],
    ensure => running,
    enable => true
  }
}
