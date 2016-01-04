class ldirectord_start::service (
  $service_ensure  = $::ldirectord_start::service_ensure,
  $service_enable  = $::ldirectord_start::service_enable,
  $service_name    = 'ldirectord',
) {

  service { 'nginx':
    ensure     => $service_ensure,
    name       => $service_name,
    enable     => $service_enable,
    flags      => $service_flags,
    hasstatus  => true,
    hasrestart => true,
  }

}
