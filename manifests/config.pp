class ldirectord_start::config {

  ### START Validations ###
  validate_string($virtual)
  validate_string($real)
  if (($checktimeout != undef) and (!is_integer($checktimeout))) {
    fail('$checktimeout must be an integer.')
  }
  if (($negotiatetimeout != undef) and (!is_integer($negotiatetimeout))) {
    fail('$negotiatetimeout must be an integer.')
  }
  if (($checkinterval != undef) and (!is_integer($checkinterval))) {
    fail('$checkinterval must be an integer.')
  }
  if (($checkcount != undef) and (!is_integer($checkcount))) {
    fail('$checkcount must be an integer.')
  }
  if (($failurecount != undef) and (!is_integer($failurecount))) {
    fail('$failurecount must be an integer.')
  }

  #autoreload
  #callback

  validate_string($fallback)
  validate_string($fallbackcommand)
  validate_string($emailalert)

  #emailalertfrom

  #logfile

  validate_string($emailalert)
  if (($emailalertfreq != undef) and (!is_integer($emailalertfreq))) {
    fail('$emailalertfreq must be an integer.')
  }
  validate_string($emailalertstatus)
  validate_string($smtp)

  #fork

  if ($quiescent != 'yes') and ($quiescent != 'no') {
    fail('$quiescent must have value "yes" or "no".')
  }
  if ($cleanstop != 'yes') and ($cleanstop != 'no') {
    fail('$cleanstop must have value "yes" or "no".')
  }
  if ($maintenancedir != undef) {
    fail('$maintenancedir is not valid in a virtual server section..')
  }
  validate_string($checktype)
  validate_string($service)
  validate_string($checkcommand)
  if (($checkport != undef) and (!is_integer($checkport))) {
    fail('$checkport must be an integer.')
  }
  validate_string($request)
  validate_string($receive)
  if ($httpmethod != 'GET') or ($httpmethod == 'HEAD') {
    fail('$httpmethod must have value "GET" or "HEAD".')
  }
  validate_string($virtualhost)
  validate_string($login)
  validate_string($passwd)
  validate_string($database)
  validate_string($scheduler)
  if (($persistent != undef) and (!is_integer($persistent))) {
    fail('$persistent must be an integer.')
  }
  validate_string($netmask)
  if ($protocol != 'tcp') or ($protocol == 'udp') or ($protocol == 'fwm') {
    fail('Only tcp, udp and fwm protocol are supported.')
  }
  validate_string($monitorfile)
  ### END Validations ###

  ### START Create Config ###
  concat { $::ldirectord_start::config:
    ensure => present,
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
  }

  concat::fragment { 'global_opts':
    target  => $::ldirectord_start::config,
    content => template('ldirectord_start/ldirectord_start.global.cf.erb'),
    order   => '00',
  }
  ### END Create Config ###

}
