class ldirectord_start::install inherits ldirectord_start {

  #if $ntp::package_manage {

    package { $ldirectord_start::package_name:
      ensure => $ldirectord_start::package_ensure,
    }

  #}

}
