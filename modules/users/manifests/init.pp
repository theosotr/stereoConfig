class users {
    user {'tushar':
        ensure      => present,
        home        => '/home/tushar',
        password    => '67tu12@#)(',
        shell       => '/bin/bash',
        managehome  => true,
    }

    user {'mfg':
        ensure      => present,
        home        => '/home/mfg',
        password    => 'hz$9u5lURmy',
        shell       => '/bin/bash',
        managehome  => true,    
    }
    
    user {'dds':
        ensure      => present,
        home        => '/home/dds',
        password    => 'S0XMcQjU2ynl06x',
        shell       => '/bin/bash',
        managehome  => true,
    }
    
    user {'maria':
        ensure      => present,
        home        => '/home/maria',
        password    => 'ESJaHuxzuOya',
        shell       => '/bin/bash',
        managehome   => true,
    }
    
    user {'panos':
        ensure      => present,
        home        => '/home/panos',
        password    => 'uOyaLGzoKSlB6s',
        shell       => '/bin/bash',
        managehome  => true,
    }
}
