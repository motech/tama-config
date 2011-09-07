class activemq {
  include repos::puppetlabs
  include ruby::rubygem_stomp
  include java::sun_jdk
  include tanukiwrapper

  package { "activemq":
    ensure    => "present",
    require   => [Yumrepo[puppetlabs], Exec["sun_jre_6"] Package["tanukiwrapper"], Package["rubygem-stomp"]]
  }

  service { "activemq":
    enable => true,
    ensure => running,
    require => Package["activemq"]
  }
}
