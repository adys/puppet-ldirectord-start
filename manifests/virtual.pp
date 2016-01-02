define ldirectord_start::virtual(
 
  ### START Required Arguments
  $virtual,
  $real,
  ### END Required Arguments

  $checktimeout            = $::ldirectord_start::checktimeout
  $negotiatetimeout        = $::ldirectord_start::negotiatetimeout
  $checkinterval           = $::ldirectord_start::checkinterval
  $checkcount              = $::ldirectord_start::checkcount
  $failurecount            = $::ldirectord_start::failurecount
  $fallback                = $::ldirectord_start::fallback
  $fallbackcommand         = $::ldirectord_start::fallbackcommand
  $emailalert              = $::ldirectord_start::emailalert
  $emailalertfreq          = $::ldirectord_start::emailalertfreq
  $emailalertstatus        = $::ldirectord_start::emailalertstatus
  $smtp                    = $::ldirectord_start::smtp
  $quiescent               = $::ldirectord_start::quiescent
  $cleanstop               = $::ldirectord_start::cleanstop
  $maintenancedir          = $::ldirectord_start::maintenancedir
  $checktype               = $::ldirectord_start::checktype
  $service                 = $::ldirectord_start::service
  $checkcommand            = $::ldirectord_start::checkcommand
  $checkport               = $::ldirectord_start::checkport
  $request                 = $::ldirectord_start::request
  $receive                 = $::ldirectord_start::receive
  $httpmethod              = $::ldirectord_start::httpmethod
  $virtualhost             = $::ldirectord_start::virtualhost
  $login                   = $::ldirectord_start::login
  $passwd                  = $::ldirectord_start::passwd
  $database                = $::ldirectord_start::database
  $scheduler               = $::ldirectord_start::scheduler
  $persistent              = $::ldirectord_start::persistent
  $netmask                 = $::ldirectord_start::netmask
  $protocol                = $::ldirectord_start::protocol
  $monitorfile             = $::ldirectord_start::monitorfile
) {

  ### The base class must be included first because it is used by parameter defaults ###
  if ! defined(Class['ldirectord_start']) {
    fail('You must include the ldirectord_start base class before using any ldirectord defined resources')
  }
  
  ### STARTValidations ###
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
  validate_string($fallback)
  validate_string($fallbackcommand)
  validate_string($emailalert)
  validate_string($emailalert)
  if (!is_integer($emailalertfreq)) {
    fail('$emailalertfreq must be an integer.')
  }
  validate_string($emailalertstatus)
  validate_string($smtp)
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
  ### END Validations ###

  concat::fragment { $title:
    target  => $::ldirectord_start::config,
    content => template('ldirectord_start/ldirectord_start.virtual.cf.erb'),
    order   => $title,
  }
}