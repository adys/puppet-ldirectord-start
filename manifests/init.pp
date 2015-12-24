class ldirectord_start (
  $autoupdate        = $ldirectord_start::params::autoupdate,
  $broadcastclient   = $ldirectord_start::params::broadcastclient,
  $config            = $ldirectord_start::params::config,
) inherits ldirectord_start::params {

  # Anchor this as per #8040 - this ensures that classes won't float off and
  # mess everything up.  You can read about this at:
  # http://docs.puppetlabs.com/puppet/2.7/reference/lang_containment.html#known-issues
  anchor { 'ldirectord_start::begin': } ->
  class { '::ldirectord_start::install': } ->
  class { '::ldirectord_start::config': } ->
  #class { '::ldirectord_start::config': } ~>
  #class { '::ldirectord_start::service': } ->
  anchor { 'ldirectord_start::end': }
}

