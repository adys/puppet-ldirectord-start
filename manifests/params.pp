class ldirectord_start::params {

  $default_config                = '/etc/ldirectord.cf'   
  $default_package_ensure        = 'present'   
  $default_package_name          = 'ldirectord'
  $default_service_ensure        = 'running' 
  $default_service_enable        =  true 
  $default_service_name          = 'ldirectord' 

  validate_bool($default_service_enable)

  case $::osfamily {
    'Debian': {
      $config           = $default_config
      $package_ensure   = $default_package_ensure
      $package_name     = $default_package_name
      $service_ensure   = $default_service_ensure
      $service_enable   = $default_service_enable
      $service_name     = $default_service_name
    }
    default: {
      fail("The ${module_name} module is not supported on an ${::osfamily} based system.")
    }
  }
}
