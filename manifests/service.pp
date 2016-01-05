class ldirectord_start::service (
  $service_ensure  = $::ldirectord_start::service_ensure,
  $service_enable  = $::ldirectord_start::service_enable,
  $service_name    = 'ldirectord',
) {

  service { 'ldirectord':
    ensure     => $service_ensure,
    name       => $service_name,
    enable     => $service_enable,
    hasstatus  => true,
    hasrestart => true,
  }

}
