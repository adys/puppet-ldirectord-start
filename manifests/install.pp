class ldirectord::install inherits ldirectord {

  #if $ntp::package_manage {

    package { $ldirectord::package_name:
      ensure => $ldirectord::package_ensure,
    }

  #}

}
