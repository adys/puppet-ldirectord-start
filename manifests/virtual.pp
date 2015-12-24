define ldirectord_start::virtual(
  $receive = undef,
  $checktype = undef,
  $netmask = undef,
  $persistent = undef,
) {
  notify{"LDIRECTORD PROFILE ${title} ${$title}": } 

  #if ! defined(Class['ldirectord_start']) {
  #  include ldirectord_start
  #}
  
  concat::fragment { 'test':
    target  => $ldirectord_start::config,
    content => template('ldirectord_start/ldirectord_start.virtual.cf.erb'),
    order   => 'test',
  }
}