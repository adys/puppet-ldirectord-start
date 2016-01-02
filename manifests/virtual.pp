define ldirectord_start::virtual(
 
  ### START Required Arguments
  $virtual,
  $real,
  ### END Required Arguments

  $checktimeout         = undef,
  $negotiatetimeout     = undef,
  $checkinterval        = undef,
  $checkcount           = undef,
  $failurecount         = undef,
  $fallback             = undef,
  $fallbackcommand      = undef,
  $emailalert           = undef,
  $emailalertfreq       = undef,
  $emailalertstatus     = undef,
  $smtp                 = undef,
  $quiescent            = undef,
  $cleanstop            = undef,
  $maintenancedir       = undef,
  $checktype            = undef,
  $service              = undef,
  $checkcommand         = undef,
  $checkport            = undef,
  $request              = undef,
  $receive              = undef,
  $httpmethod           = undef,
  $virtualhost          = undef,
  $login                = undef,
  $passwd               = undef,
  $database             = undef,
  $scheduler            = undef,
  $persistent           = undef,
  $netmask              = undef,
  $protocol             = undef,
  $monitorfile          = undef,
) {

  ### The base class must be included first because it is used by parameter defaults ###
  if ! defined(Class['ldirectord_start']) {
    fail('You must include the ldirectord_start base class before using any ldirectord defined resources')
  }
  
  ### STARTValidations ###
  validate_string($virtual)
  validate_string($real)
  if (($checktimeout != undef) and (!is_integer($checktimeout))) {
    fail('$checktimeout must be an integer.')
  }
  if (($negotiatetimeout != undef ) and (!is_integer($negotiatetimeout))) {
    fail('$negotiatetimeout must be an integer.')
  }
  if (($checkinterval != undef ) and (!is_integer($checkinterval))) {
    fail('$checkinterval must be an integer.')
  }
  if (($checkcount != undef ) and (!is_integer($checkcount))) {
    fail('$checkcount must be an integer.')
  }
  if (($failurecount != undef ) and (!is_integer($failurecount))) {
    fail('$failurecount must be an integer.')
  }
  validate_string($fallback)
  validate_string($fallbackcommand)
  validate_string($emailalert)
  validate_string($emailalert)
  if (($emailalertfreq != undef ) and (!is_integer($emailalertfreq))) {
    fail('$emailalertfreq must be an integer.')
  }
  validate_string($emailalertstatus)
  validate_string($smtp)
  if (($quiescent != undef ) and ($quiescent != 'yes') and ($quiescent != 'no')) {
    fail('$quiescent must have value "yes" or "no".')
  } 
  if (($cleanstop != undef ) and ($cleanstop != 'yes') and ($cleanstop != 'no')) {
    fail('$cleanstop must have value "yes" or "no".')
  } 
  if ($maintenancedir != undef) {
    fail('$maintenancedir is not valid in a virtual server section..')
  }
  validate_string($checktype)
  validate_string($service)
  validate_string($checkcommand)
  if (($checkport != undef ) and (!is_integer($checkport))) {
    fail('$checkport must be an integer.')
  }
  validate_string($request)
  validate_string($receive)
  if (($httpmethod != undef ) and ($httpmethod != 'GET') and ($httpmethod != 'HEAD')) {
    fail('$httpmethod must have value "GET" or "HEAD".')
  }
  validate_string($virtualhost)
  validate_string($login)
  validate_string($passwd)
  validate_string($database)
  validate_string($scheduler)
  if (($persistent != undef ) and (!is_integer($persistent))) {
    fail('$persistent must be an integer.')
  } 
  validate_string($netmask) 
  if (($protocol != undef ) and ($protocol != 'tcp') and ($protocol != 'udp') and ($protocol != 'fwm')) {
    fail('Only tcp, udp and fwm protocol are supported.')
  }
  validate_string($monitorfile)
  ### END Validations ###

  concat::fragment { $title:
    target  => $::ldirectord_start::config,
    content => template('ldirectord_start/ldirectord_start.virtual.cf.erb'),
    order   => $title,
  }
}