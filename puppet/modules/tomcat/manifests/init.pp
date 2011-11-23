class tomcat {
  include users
  
  file { "/tmp/apache-tomcat-7.0.22.tar.gz":
    source => "puppet:///modules/tomcat/apache-tomcat-7.0.22.tar.gz",
    require => [User["tamasuper"],Exec["sun_jdk_6"]]
  }

  exec { "tomcat_untar":
    command => "tar xfz /tmp/apache-tomcat-7.0.22.tar.gz",
    user => "tamasuper",
    cwd     => "/home/tamasuper",
    creates => "/home/tamasuper/apache-tomcat-7.0.22",
    path    => ["/bin"],
    require => File["/tmp/apache-tomcat-7.0.22.tar.gz"],
  }
  
  file { "/etc/init.d/tomcat" :
  	source => "puppet:///modules/tomcat/tomcat.initd",
  	require => Exec["tomcat_untar"],
  }

  service { "tomcat":
  	ensure => "running",
  	hasstatus => false,
  	require => File["/etc/init.d/tomcat"],
  }
}
