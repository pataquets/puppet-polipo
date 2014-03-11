# puppet-polipo

Install and configure polipo caching web proxy.

Currently only supports ::osfamily Debian.

## Usage 

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
      $socksParentProxy = undef,
      $socksProxyType = undef,
    ) {

where:

    proxyAddress => '::0',
    allowedClients => '127.0.0.1, 172.16.0.0/24', 

## Bug reports
Please file bug reports to Issues on GitHub.

## Contact
Nathan R Valentine <nathan@puppetlabs.com> | <nrvale0@gmail.com>
