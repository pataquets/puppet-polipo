class polipo::params {
  case $::osfamily {
    'debian': { 
      $package = 'polipo'
      $service = 'polipo'
      $config_file = '/etc/polipo/config'
    }
    default: {fail("OS family ${::osfamily} not supported by this class!")}
  }
}
