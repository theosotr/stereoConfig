class grub {
  package{'grub-common': }
  package{'grub-pc': }
  package{'grub-pc-bin': }
  package{'grub-xen-bin': }
  package{'grub-xen-host': }
  package{'grub2-common': }

  file { '/etc/default/grub':
    ensure => present,
  }->
    file_line { 'grubSetting':
      path => '/etc/default/grub',
      line => 'GRUB_CMDLINE_LINUX_DEFAULT="intel_pstate=disable quiet splash"',
      match => '^GRUB_CMDLINE_LINUX_DEFAULT=.*$',
    }
}
