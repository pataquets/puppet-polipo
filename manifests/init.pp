class polipo(
  $proxyAddress = undef,
  $allowedClients = undef,
  $proxyname = undef,
  $chunkHighMark = 819200,
  $objectHighMark = 128,
  $diskCacheRoot = undef,
  $maxDiskCacheEntrySize = undef,
  $forbiddenURLs = undef,
  $options = ['any'],
  $p_loglevel = undef,
) {
  include polipo::params

  if $proxyAddress { validate_string($proxyAddress) }
  if $allowedClients { validate_string($allowedClients) }
  if $proxyname { validate_string($proxyname) }
  validate_re($chunkHighMark, '[0-9]')
  validate_re($objectHighMark, '[0-9]')
  if $diskCacheroot { validate_absolute_path($diskCacheRoot) }
  if $maxDiskCachEntrySize { validate_re($maxDiskCacheEntrySize, '[0-9]+') }
  if $forbiddenURLs { validate_string($forbiddenURLs) }
  validate_array($options)
  if $p_loglevel { validate_string($p_loglevel, '0x[0-9]+') }

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
