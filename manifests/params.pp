class ldirectord::params {

  $autoupdate        = false
  $broadcastclient   = false
  $config    = '/etc/ldirectord.cf'
  $package_ensure    = 'present'
  $default_package_name = ['ldirectord']
  $default_service_name = 'ldirectord'

  case $::osfamily {
    'Debian': {
      $package_name    = $default_package_name
    }
    default: {
      fail("The ${module_name} module is not supported on an ${::osfamily} based system.")
    }
  }
}
