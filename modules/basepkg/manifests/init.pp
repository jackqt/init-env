class basepkg { 
# curl jq vim git zsh fonts-wqy-microhei fonts-wqy-zenhei xfonts-wqy vagrant virtualbox adobe-flashplugin ibus ibus-table-wubi"
  package { "curl": ensure => "present" }
  package { "vim": ensure => "present" }
  package { "zsh": ensure => "present" }
}
