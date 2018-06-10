class privoxy { 
  package { "privoxy":
    ensure => "present"
  }

  file { '/var/log/privoxy':
    ensure => 'directory',
    owner  => 'root',
  }

  file { '/var/log/privoxy/privoxy_access.log':
    ensure  => 'file',
    owner   => 'root',
    mode    => '666',
    require => File['/var/log/privoxy'],
  }

  file { '/etc/privoxy/config':
        ensure  => 'file',
        require => [Package['privoxy'], File['/var/log/privoxy/privoxy_access.log']],
        owner   => 'root',
        content => template('privoxy/config.erb'),
        mode    => '644',
        notify  => Service['privoxy'],
  }
   
#file { '/etc/apt/apt.conf.d/99proxy':
#        ensure  => 'file',
#        require => File['/etc/privoxy/config'],
#        mode    => '644',
#        owner   => '0',
#        source => 'puppet:///modules/socksproxy/99proxy'
#}
   
  service { 'privoxy' :
        ensure => 'running',
        enable => "true",
        require => Package['privoxy']
  }
}
