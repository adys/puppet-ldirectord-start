class ldirectord_start::config inherits ldirectord_start {

  concat { $ldirectord_start::config:
    ensure => present,
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
  }

  concat::fragment { 'global_opts':
    target  => $ldirectord_start::config,
    content => template('ldirectord_start/ldirectord_start.global.cf.erb'),
    order   => '00',
  }

}
