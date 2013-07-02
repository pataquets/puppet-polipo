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
      $forbiddenURLs = undef,
      $options = ['any'],
    ) {

## Bug reports
Please file bug reports to Issues on GitHub.

## Contact
Nathan R Valentine <nathan@puppetlabs.com> | <nrvale0@gmail.com>
