define ldirectord_start::virtual(
  $firewall_mark,
  $real,
  $receive = undef,
  $checktype = undef,
  $checkport = undef,
  $netmask = undef,
  $persistent = undef,
) {
  # The base class must be included first because it is used by parameter defaults
  if ! defined(Class['ldirectord_start']) {
    fail('You must include the ldirectord_start base class before using any ldirectord defined resources')
  }
  
  concat::fragment { $title:
    target  => $ldirectord_start::config,
    content => template('ldirectord_start/ldirectord_start.virtual.cf.erb'),
    order   => $title,
  }
}