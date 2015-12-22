# == Class: ldirectord
#
# Full description of class ldirectord here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if it
#   has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should not be used in preference to class parameters  as of
#   Puppet 2.6.)
#
# === Examples
#
#  class { ldirectord:
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ]
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2011 Your name here, unless otherwise noted.
#
class ldirectord {
  $config            = $ntp::params::config,
  $config_dir        = $ntp::params::config_dir,
  $config_file_mode  = $ntp::params::config_file_mode,
  $config_template   = $ntp::params::config_template,
  $logfile           = $ntp::params::logfile,
  $keys_enable       = $ntp::params::keys_enable,
  $keys_file         = $ntp::params::keys_file,
  $keys_controlkey   = $ntp::params::keys_controlkey,
  $keys_requestkey   = $ntp::params::keys_requestkey,
  $keys_trusted      = $ntp::params::keys_trusted,
  $package_ensure    = $ntp::params::package_ensure,
  $package_manage    = $ntp::params::package_manage,
  $package_name      = $ntp::params::package_name,
  $preferred_servers = $ntp::params::preferred_servers,
  $servers           = $ntp::params::servers,
  $service_enable    = $ntp::params::service_enable,
  $service_ensure    = $ntp::params::service_ensure,
  $service_manage    = $ntp::params::service_manage,
  $service_name      = $ntp::params::service_name,
) inherits ldirectord::params {

  validate_bool($broadcastclient)
  validate_absolute_path($config)
  validate_string($config_template)
  validate_bool($disable_auth)
  validate_bool($disable_dhclient)
  validate_bool($disable_kernel)
  validate_bool($disable_monitor)
  validate_absolute_path($driftfile)
  if $logfile { validate_absolute_path($logfile) }
  if $ntpsigndsocket { validate_absolute_path($ntpsigndsocket) }
  if $leapfile { validate_absolute_path($leapfile) }
  validate_bool($iburst_enable)
  validate_bool($keys_enable)
  validate_re($keys_controlkey, ['^\d+$', ''])
  validate_re($keys_requestkey, ['^\d+$', ''])
  validate_array($keys_trusted)
  if $minpoll { validate_numeric($minpoll, 16, 3) }
  if $maxpoll { validate_numeric($maxpoll, 16, 3) }
  validate_string($package_ensure)
  validate_bool($package_manage)
  validate_array($package_name)
  if $panic { validate_numeric($panic, 65535, 0) }
  validate_array($preferred_servers)
  validate_array($restrict)
  validate_array($interfaces)
  validate_array($servers)
  validate_array($fudge)
  validate_bool($service_enable)
  validate_string($service_ensure)
  validate_bool($service_manage)
  validate_string($service_name)
  if $stepout { validate_numeric($stepout, 65535, 0) }
  validate_bool($tinker)
  validate_bool($tos)
  if $tos_minclock { validate_numeric($tos_minclock) }
  if $tos_minsane { validate_numeric($tos_minsane) }
  if $tos_floor { validate_numeric($tos_floor) }
  if $tos_ceiling { validate_numeric($tos_ceiling) }
  if $tos_cohort { validate_re($tos_cohort, '^[0|1]$', "Must be 0 or 1, got: ${tos_cohort}") }
  validate_bool($udlc)
  validate_array($peers)

  if $config_dir {
    validate_absolute_path($config_dir)
  }

  # Anchor this as per #8040 - this ensures that classes won't float off and
  # mess everything up.  You can read about this at:
  # http://docs.puppetlabs.com/puppet/2.7/reference/lang_containment.html#known-issues
  anchor { 'ntp::begin': } ->
  class { '::ntp::install': } ->
  class { '::ntp::config': } ~>
  class { '::ntp::service': } ->
  anchor { 'ntp::end': }

}


}
