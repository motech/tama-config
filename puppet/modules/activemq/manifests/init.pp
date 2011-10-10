class activemq {
  include java::open_jdk


  package { "activemq":
    ensure    => "present",
    require   => Package["java-1.6.0-openjdk"]
  }

  file { "/etc/init.d/activemq":
    owner  => root,
    group  => root,
    mode   => 755,
    content => puppet:///modules/activemq/activemq-init.d,
  }

  service { "activemq":
    ensure     => running,
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
    require => [Package["activemq"], File["/etc/init.d/activemq"]],
  }
}
