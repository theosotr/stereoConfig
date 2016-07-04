# System performance monitoring tools
class perfmon {
  package{'htop': }
  package{'sysstat': }
  package{'iotop': }

  file_line { 'enable sysstat':
    path => '/etc/default/sysstat',
    line => 'ENABLED="true"',
    match => '^ENABLED *=.*$',
  }
}
