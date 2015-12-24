class ldirectord_start::virtual(
  $receive = undef,
  $checktype = undef,
  $netmask = undef,
  $persistent = undef,
) {
  notify{"LDIRECTORD PROFILE ${title} ${$title}": } 
  concat::fragment { 'test':
    target  => $ldirectord_start::configfile,
    content => template('ldirectord_start/ldirectord_start.virtual.cf.erb'),
    order   => 'test',
  }
}