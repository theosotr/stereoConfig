class services {
  service { "ssh":
    ensure  => running,
  }
  service { "rsync":
    ensure  => running,
  }
  service { "mysql":
    ensure  => running,
  }
}
