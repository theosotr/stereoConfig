class users {
    user {'tushar':
        ensure      => present,
        home        => '/home/tushar',
        password    => '67tu12@#)(',
    }

    user {'mfg':
        ensure      => present,
        home        => '/home/mfg',
        password    => 'hz$9u5lURmy',
    }
    
    user {'dds':
        ensure      => present,
        home        => '/home/dds',
        password    => 'S0XMcQjU2ynl06x',
    }
    
    user {'maria':
        ensure      => present,
        home        => '/home/maria',
        password    => 'ESJaHuxzuOya',
    }
    
    user {'panos':
        ensure      => present,
        home        => '/home/panos',
        password    => 'uOyaLGzoKSlB6s',
    }
}
