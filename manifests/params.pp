class ldirectord::params {

  $config_dir        = undef
  $config_file_mode  = '0644'
  $config_template   = 'ntp/ntp.conf.erb'
  $keys_enable       = false
  $keys_controlkey   = ''
  $keys_requestkey   = ''
  $keys_trusted      = []
  $logfile           = undef
  $package_ensure    = 'present'
  $peers             = []
  $preferred_servers = []
  $service_enable    = true
  $service_ensure    = 'running'
  $service_manage    = true
  $stepout           = undef
  $udlc              = false
  $udlc_stratum      = '10'
  $interfaces        = []
  $disable_auth      = false
  
  # Allow a list of fudge options
  $fudge             = []

  $default_config       = '/etc/ntp.conf'
  $default_keys_file    = '/etc/ntp/keys'
  $default_driftfile    = '/var/lib/ntp/drift'
  $default_package_name = ['ntp']
  $default_service_name = 'ntpd'

  $package_manage = $::osfamily ? {
    'FreeBSD' => false,
    default   => true,
  }

  if str2bool($::is_virtual) {
    $tinker = true
    $panic  = 0
  }
  else {
    $tinker = false
    $panic  = undef
  }

  case $::osfamily {
    'Debian': {
      $config          = $default_config
      $keys_file       = $default_keys_file
      $driftfile       = $default_driftfile
      $package_name    = $default_package_name
      $restrict        = [
        '-4 default kod nomodify notrap nopeer noquery',
        '-6 default kod nomodify notrap nopeer noquery',
        '127.0.0.1',
        '::1',
      ]
      $service_name    = 'ntp'
      $iburst_enable   = true
      $servers         = [
        '0.debian.pool.ntp.org',
        '1.debian.pool.ntp.org',
        '2.debian.pool.ntp.org',
        '3.debian.pool.ntp.org',
      ]
      $maxpoll         = undef
    }
    default: {
      fail("The ${module_name} module is not supported on an ${::osfamily} based system.")
    }
  }
}
