class tomcat {

  include repos::jpackage

  package { "tomcat":
    ensure  =>  "present",
    require => [Package["jpackage-utils"]],
  }
}
