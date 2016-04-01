class homedir {
    file { "/home/tushar":
        ensure  => "directory",
        owner   => "tushar",
        require => User['tushar'],
        mode    => '0744',
    }
    file { "/home/mfg":
        ensure  => "directory",
        owner   => "mfg",
        require => User['mfg'],
        mode    => '0744',
    }
    file { "/home/dds":
        ensure  => "directory",
        owner   => "dds",
        require => User['dds'],
        mode    => '0744',
    }
    file { "/home/maria":
        ensure  => "directory",
        owner   => "maria",
        require => User['maria'],
        mode    => '0744',
    }
    file { "/home/panos":
        ensure  => "directory",
        owner   => "panos",
        require => User['panos'],
        mode    => '0744',
    }
}
