class gui { 
  package { 'ibus': 
    ensure  => "installed" 
  }
  package { 'ibus-table-wubi': 
    ensure  => "installed", 
    require => Package['ibus'], 
  }
}
