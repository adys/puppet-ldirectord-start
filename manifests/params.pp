class ldirectord_start::params {
  $autoupdate            = false
  $broadcastclient       = false
  $package_ensure        = 'present'

  $default_config        = '/etc/ldirectord.cf'
  $default_package_name  = ['ldirectord']
  $default_service_name  = 'ldirectord'
  $default_logfile       = '/var/log/ldirectord.log'

  case $::osfamily {
    'Debian': {
      $config           = $default_config
      $package_name     = $default_package_name
      $service_name     = $default_service_name
      $logfile          = $default_logfile
    }
    default: {
      fail("The ${module_name} module is not supported on an ${::osfamily} based system.")
    }
  }
}
