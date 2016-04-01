class homedir {
    file { "/home/tushar":
        ensure  => "directory",
        owner   => "tushar",
    }
    file { "/home/mfg":
        ensure  => "directory",
        owner   => "mfg",
    }
    file { "/home/dds":
        ensure  => "directory",
        owner   => "dds",
    }
    file { "/home/maria":
        ensure  => "directory",
        owner   => "maria",
    }
    file { "/home/panos":
        ensure  => "directory",
        owner   => "panos",
    }
}
