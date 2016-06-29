class users {
    $tushar    = hiera('tushar')
    $mfg       = hiera('mfg')
    $dds       = hiera('dds')
    $maria     = hiera('maria')
    $louridas  = hiera('louridas')
    $sgeorgiou = hiera('sgeorgiou')
    $dimitro   = hiera('dimitro')
    $vitsalis  = hiera('vitsalis')
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
    
    user {'louridas':
        ensure      => present,
        home        => '/home/louridas',
        password    => $louridas,
        shell       => '/bin/bash',
        managehome  => true,
    }

    user {'sgeorgiou':
        ensure      => present,
        home        => '/home/sgeorgiou',
        password    => $sgeorgiou,
        shell       => '/bin/bash',
        managehome  => true,
    }

    user {'dimitro':
        ensure      => present,
        home        => '/home/dimitro',
        password    => $dimitro,
        shell       => '/bin/bash',
        managehome  => true,
    }
    
    user {'vitsalis':
        ensure      => present,
        home        => '/home/vitsalis',
        password    => $vitsalis,
        shell       => '/bin/bash',
        managehome  => true,
    }
}
