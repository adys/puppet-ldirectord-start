define ldirectord_start::virtual(
  $virtual,
  $real,
  $real_options,
  $port,
  $service = undef,
  $protocol,
  $scheduler,
  $entrynumber = $name,
  $checktype = undef,
  $checkport = undef,
  $checkcommand = undef,
  $httpmethod = undef,
  $virtualhost = undef,
  $login = undef,
  $passwd = undef,
  $database = undef,
  $request = undef,
  $receive = undef,
  $checktype = undef,
  $netmask = undef,
  $persistent = undef,
) {
  concat::fragment { $title:
    target  => $ldirectord_start::configfile,
    content => template('ldirectord_start/ldirectord_start.virtual.cf.erb'),
    order   => $name,
  }
}