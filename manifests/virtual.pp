define ldirectord_start::virtual(
  
  $virtual,
  $real,
  $checktimeout = undef,
  $negotiatetimeout = undef,
  $checkinterval = undef,
  $checkcount = undef,
  $failurecount = undef,
  #autoreload
  #callback
  $fallback = undef,
  $fallbackcommand = undef,
  #logfile
  $emailalert = undef,
  #emailalertfrom
  $emailalertfreq = undef,
  $emailalertstatus = undef,
  $smtp = undef,
  #fork
  $quiescent = undef,
  $cleanstop = undef,
  $maintenancedir = undef,
  $checktype = undef,
  $service = undef,
  $checkcommand = undef,
  $checkport = undef,
  $request = undef,
  $receive = undef,
  $httpmethod = undef,
  $virtualhost = undef,
  $login = undef,
  $passwd = undef,
  $database = undef,
  $scheduler = undef,
  $persistent = undef,
  $netmask = undef,
  $protocol = undef,
  $monitorfile = undef,
) {

  ### The base class must be included first because it is used by parameter defaults ###
  if ! defined(Class['ldirectord_start']) {
    fail('You must include the ldirectord_start base class before using any ldirectord defined resources')
  }
  
  ### Validations ###
  validate_string($virtual)
  validate_string($real)
  if (!is_integer($checktimeout)) {
    fail('$checktimeout must be an integer.')
  }
  if (!is_integer($negotiatetimeout)) {
    fail('$negotiatetimeout must be an integer.')
  }
  if (!is_integer($checkinterval)) {
    fail('$checkinterval must be an integer.')
  }
  if (!is_integer($checkcount)) {
    fail('$checkcount must be an integer.')
  }
  if (!is_integer($failurecount)) {
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
  if (!is_integer($emailalertfreq)) {
    fail('$emailalertfreq must be an integer.')
  }
  validate_string($emailalertstatus)
  validate_string($smtp)

  #fork
 
  if ($quiescent != 'yes') or ($quiescent = 'no') {
    fail('$quiescent must have value "yes" or "no".')
  } 
  if ($cleanstop != 'yes') or ($cleanstop = 'no') {
    fail('$cleanstop must have value "yes" or "no".')
  } 
  if ($maintenancedir != undef) {
    fail('$maintenancedir is not valid in a virtual server section..')
  }
  validate_string($checktype)
  validate_string($service)
  validate_string($checkcommand)
  if (!is_integer($checkport)) {
    fail('$checkport must be an integer.')
  }
  validate_string($request)
  validate_string($receive)
  if ($httpmethod != 'GET') or ($httpmethod = 'HEAD') {
    fail('$httpmethod must have value "GET" or "HEAD".')
  }
  validate_string($virtualhost)
  validate_string($login)
  validate_string($passwd)
  validate_string($database)
  validate_string($scheduler)
  if (!is_integer($persistent)) {
    fail('$persistent must be an integer.')
  } 
  validate_string($netmask) 
  if ($protocol != 'tcp') or ($protocol = 'udp') or ($protocol = 'fwm') {
    fail('Only tcp, udp and fwm protocol are supported.')
  }
  validate_string($monitorfile)
  ### End validations ###

  concat::fragment { $title:
    target  => $ldirectord_start::config,
    content => template('ldirectord_start/ldirectord_start.virtual.cf.erb'),
    order   => $title,
  }
}