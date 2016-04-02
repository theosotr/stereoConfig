class users {
    $tushar = hiera('tushar')
    $mfg    = hiera('mfg')
    $dds    = hiera('dds')
    $maria  = hiera('maria')
    $panos  = hiera('panos')
    user {'tushar':
        ensure      => present,
        home        => '/home/tushar',
        password    => $tushar,
        shell       => '/bin/bash',
        managehome  => true,
    }

    user {'mfg':
        ensure      => present,
        home        => '/home/mfg',
        password    => $mfg,
        shell       => '/bin/bash',
        managehome  => true,    
    }
    
    user {'dds':
        ensure      => present,
        home        => '/home/dds',
        password    => $dds,
        shell       => '/bin/bash',
        managehome  => true,
    }
    
    user {'maria':
        ensure      => present,
        home        => '/home/maria',
        password    => $maria,
        shell       => '/bin/bash',
        managehome   => true,
    }
    
    user {'panos':
        ensure      => present,
        home        => '/home/panos',
        password    => $panos,
        shell       => '/bin/bash',
        managehome  => true,
    }
}
