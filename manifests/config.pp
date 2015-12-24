class ldirectord::config inherits ldirectord {

  concat { $ldirectord::config:
    ensure => present,
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
  }

}
