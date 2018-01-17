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
    file { "/home/louridas":
        ensure  => "directory",
        owner   => "louridas",
        require => User['louridas'],
        mode    => '0744',
    }
    file { "/home/sgeorgiou":
        ensure  => "directory",
        owner   => "sgeorgiou",
        require => User['sgeorgiou'],
        mode    => '0744',
    }
    file { "/home/dimitro":
        ensure  => "directory",
        owner   => "dimitro",
        require => User['dimitro'],
        mode    => '0744',
    }
    file { "/home/vitsalis":
        ensure  => "directory",
        owner   => "vitsalis",
        require => User['vitsalis'],
        mode    => '0744',
    }
    file { "/home/antonis":
        ensure  => "directory",
        owner   => "antonis",
        require => User['antonis'],
        mode    => '0744',
    }
    file { "/home/vasiliki":
        ensure  => "directory",
        owner   => "vasiliki",
        require => User['vasiliki'],
        mode    => '0744',
    }
    file { "/home/thodoras":
        ensure  => "directory",
        owner   => "thodoras",
        require => User['thodoras'],
        mode    => '0744',
    }
}
