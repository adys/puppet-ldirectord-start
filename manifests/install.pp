class ldirectord_start::install {
    package { $::ldirectord_start::package_name:
      ensure => $::ldirectord_start::package_ensure,
      name   => $::ldirectord_start::package_name,
    }
}
