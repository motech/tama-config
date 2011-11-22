class tomcat {

  include repos::jpackage

  package { "tomcat6":
    ensure  =>  "present",
    require => [Package["jpackage-utils"]],
  }
  service {"tomcat6" :
  	status => "running",
  }
}
