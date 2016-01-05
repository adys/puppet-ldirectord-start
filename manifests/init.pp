class ldirectord_start (

  ### START Package and Service Configuration ###
  $config                         = $::ldirectord_start::params::config,
  $package_ensure                 = $::ldirectord_start::params::package_ensure,
  $package_name                   = $::ldirectord_start::params::package_name,
  $service_ensure                 = $::ldirectord_start::params::service_ensure,
  $service_enable                 = $::ldirectord_start::params::service_enable,
  $service_name                   = $::ldirectord_start::params::service_name,
  ### END Package and Service Configuration ###

  ### START ldirectord Global Configuration ###
  $checktimeout                   = '5',
  $negotiatetimeout               = '30',
  $checkinterval                  = '10',
  $failurecount                   = '1',
  $autoreload                     = 'no',
  $callback                       = undef,
  $fallback                       = undef,
  $fallbackcommand                = undef,
  $logfile                        = '/var/log/ldirectord.log',
  $emailalert                     = undef,
  $emailalertfrom                 = undef,
  $emailalertfreq                 = '0',
  $emailalertstatus               = 'all',
  $smtp                           = undef,
  $fork                           = 'no',
  $quiescent                      = 'yes',
  $cleanstop                      = 'yes',
  $maintenancedir                 = undef,
  $service                        = undef,
  $checkcommand                   = undef,
  $checkport                      = undef,
  $request                        = undef,
  $receive                        = undef,
  $virtualhost                    = undef,
  $login                          = undef,
  $passwd                         = undef,
  $database                       = undef,
  $persistent                     = undef,
  $netmask                        = undef,
  $protocol                       = undef,
  ### END ldirectord Global Configuration ###

) inherits ::ldirectord_start::params {

  # http://docs.puppetlabs.com/puppet/2.7/reference/lang_containment.html#known-issues
  anchor { 'ldirectord_start::begin': } ->
  class { '::ldirectord_start::install': } ->
  class { '::ldirectord_start::config': } ~>
  class { '::ldirectord_start::service': } ->
  anchor { 'ldirectord_start::end': }

}

