class ldirectord_start (

  ### START Package and Service Configuration ###
  $config                         = $::ldirectord_start::params::config,
  $package_ensure                 = $::ldirectord_start::params::package_ensure,
  $package_name                   = $::ldirectord_start::params::package_name,
  $service_ensure                 = $::ldirectord_start::params::service_ensure,
  $service_name                   = $::ldirectord_start::params::service_name,
  $service_restart                = $::ldirectord_start::params::service_restart,
  ### END Package and Service Configuration ###

  ### START ldirectord Global Configuration ###
  $checktimeout                   = undef,
  $negotiatetimeout               = undef,
  $checkinterval                  = undef,
  $checkcount                     = undef,
  $failurecount                   = undef,
  $autoreload                     = undef,
  $callback                       = undef,
  $fallback                       = undef,
  $fallbackcommand                = undef,
  $logfile                        = undef,
  $emailalert                     = undef,
  $emailalertfrom                 = undef,
  $emailalertfreq                 = undef,
  $emailalertstatus               = undef,
  $smtp                           = undef,
  $fork                           = undef,
  $quiescent                      = 'yes',
  $cleanstop                      = undef,
  $maintenancedir                 = undef,
  $checktype                      = undef,
  $service                        = undef,
  $checkcommand                   = undef,
  $checkport                      = undef,
  $request                        = undef,
  $receive                        = undef,
  $httpmethod                     = undef,
  $virtualhost                    = undef,
  $login                          = undef,
  $passwd                         = undef,
  $database                       = undef,
  $scheduler                      = undef,
  $persistent                     = undef,
  $netmask                        = undef,
  $protocol                       = undef,
  $monitorfile                    = undef,
  ### END ldirectord Global Configuration ###

) inherits ::ldirectord_start::params {

  # http://docs.puppetlabs.com/puppet/2.7/reference/lang_containment.html#known-issues
  anchor { 'ldirectord_start::begin': } ->
  class { '::ldirectord_start::install': } ->
  class { '::ldirectord_start::config': } ->
  #class { '::ldirectord_start::config': } ~>
  #class { '::ldirectord_start::service': } ->
  anchor { 'ldirectord_start::end': }

}

