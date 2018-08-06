class swap(
    $swapfile       = '/mnt/swap.1', # Where to create the swapfile.
    $swapfilesize   = $::20000 # Size in MB. Defaults to memory size.
) {
        exec { 'Create swap file':
            command     => "/bin/dd if=/dev/zero of=${swapfile} bs=1M count=${swapfilesize}",
            creates     => $swapfile,
        }

        exec { 'Attach swap file':
            command => "/sbin/mkswap ${swapfile} && /sbin/swapon ${swapfile}",
            require => Exec['Create swap file'],
            unless  => "/sbin/swapon -s | grep ${swapfile}",
        }
}