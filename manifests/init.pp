class polipo(
  $proxyAddress = undef,
  $allowedClients = undef,
  $proxyname = undef,
  $chunkHighMark = 819200,
  $objectHighMark = 128,
  $diskCacheRoot = undef,
  $forbiddenURLs = undef,
  $options = ['any'],
) {
  include polipo::params

  $package = $polipo::params::package  
  $service = $polipo::params::service  
  $config_file = $polipo::params::config_file  

  package { $package: ensure => installed, }

  file { $config_file:
    ensure => file,
    content => template("${module_name}/config.erb"),
    require => Package[$package],
  }

  file { '/etc/polipo/forbidden':
    ensure => file,
    content => template("${module_name}/forbidden.erb"),
    require => Package[$package],
  }

  file { '/etc/polipo/options':
    ensure => file,
    content => template("${module_name}/options.erb"),
    require => Package[$package],
  }

  service { $service:
    ensure => running,
    enable => true,
    hasstatus => false,
    subscribe => File[$config_file],
  }
}
