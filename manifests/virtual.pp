define ldirectord_start::virtual(
  $receive = undef,
  $checktype = undef,
  $netmask = undef,
  $persistent = undef,
) {
  concat::fragment { $title:
    target  => $ldirectord_start::configfile,
    content => template('ldirectord_start/ldirectord_start.virtual.cf.erb'),
    order   => $title,
  }
}