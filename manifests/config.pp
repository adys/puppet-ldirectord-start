class ldirectord_start::config inherits ldirectord_start {

  concat { $ldirectord_start::config:
    ensure => present,
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
  }

}
