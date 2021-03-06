class ldirectord_start::config {

  $checktimeout            = $::ldirectord_start::checktimeout
  $negotiatetimeout        = $::ldirectord_start::negotiatetimeout
  $checkinterval           = $::ldirectord_start::checkinterval
  $failurecount            = $::ldirectord_start::failurecount
  $autoreload              = $::ldirectord_start::autoreload
  $callback                = $::ldirectord_start::callback
  $fallback                = $::ldirectord_start::fallback
  $fallbackcommand         = $::ldirectord_start::fallbackcommand
  $logfile                 = $::ldirectord_start::logfile
  $emailalert              = $::ldirectord_start::emailalert
  $emailalertfrom          = $::ldirectord_start::emailalertfrom
  $emailalertfreq          = $::ldirectord_start::emailalertfreq
  $emailalertstatus        = $::ldirectord_start::emailalertstatus
  $smtp                    = $::ldirectord_start::smtp
  $fork                    = $::ldirectord_start::fork
  $quiescent               = $::ldirectord_start::quiescent
  $cleanstop               = $::ldirectord_start::cleanstop
  $maintenancedir          = $::ldirectord_start::maintenancedir
  $service                 = $::ldirectord_start::service
  $checkcommand            = $::ldirectord_start::checkcommand
  $checkport               = $::ldirectord_start::checkport
  $request                 = $::ldirectord_start::request
  $receive                 = $::ldirectord_start::receive
  $virtualhost             = $::ldirectord_start::virtualhost
  $login                   = $::ldirectord_start::login
  $passwd                  = $::ldirectord_start::passwd
  $database                = $::ldirectord_start::database
  $persistent              = $::ldirectord_start::persistent
  $netmask                 = $::ldirectord_start::netmask
  $protocol                = $::ldirectord_start::protocol

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
  if (($failurecount != undef) and (!is_integer($failurecount))) {
    fail('$failurecount must be an integer.')
  }
  if ($autoreload != 'yes') and ($autoreload != 'no') {
    fail('$autoreload must have value "yes" or "no".')
  }
  validate_string($callback)
  validate_string($fallback)
  validate_string($fallbackcommand)
  validate_string($emailalert)
  validate_string($emailalertfrom)
  validate_string($logfile)
  validate_string($emailalert)
  if (($emailalertfreq != undef) and (!is_integer($emailalertfreq))) {
    fail('$emailalertfreq must be an integer.')
  }
  validate_string($emailalertstatus)
  validate_string($smtp)
  if ($fork != 'yes') and ($fork != 'no') {
    fail('$fork must have value "yes" or "no".')
  }
  if ($quiescent != 'yes') and ($quiescent != 'no') {
    fail('$quiescent must have value "yes" or "no".')
  }
  if ($cleanstop != 'yes') and ($cleanstop != 'no') {
    fail('$cleanstop must have value "yes" or "no".')
  }
  validate_string($service)
  validate_string($checkcommand)
  if (($checkport != undef) and (!is_integer($checkport))) {
    fail('$checkport must be an integer.')
  }
  validate_string($request)
  validate_string($receive)
  validate_string($virtualhost)
  validate_string($login)
  validate_string($passwd)
  validate_string($database)
  if (($persistent != undef) and (!is_integer($persistent))) {
    fail('$persistent must be an integer.')
  }
  validate_string($netmask)
  if ($protocol != 'tcp') and ($protocol == 'udp') and ($protocol == 'fwm') {
    fail('Only tcp, udp and fwm protocol are supported.')
  }
  ### END Validations ###

  ### START Create Configuration with Global Options ###
  concat { $::ldirectord_start::config:
    ensure => present,
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
  }

  concat::fragment { 'global_opts':
    target  => $::ldirectord_start::config,
    content => template("${module_name}/ldirectord_start.global.cf.erb"),
    #content => template('ldirectord_start/ldirectord_start.global.cf.erb'),
    order   => '00',
  }
  ### END Create Configuration with Global Options ###

}
