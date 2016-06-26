class grub {
  file { '/etc/default/grub':
    ensure => present,
  }->
    file_line { 'grubSetting':
      path => '/etc/default/grub',
      line => 'GRUB_CMDLINE_LINUX_DEFAULT="intel_pstate=disable quiet splash"',
      match => '^GRUB_CMDLINE_LINUX_DEFAULT=.*$',
    }
}
