class devtool { 
  package { "jq": ensure => "present" }
  package { "git": ensure => "present" }
  package { "vagrant": ensure => "present" }
  package { "virtualbox": ensure => "present" }
}
