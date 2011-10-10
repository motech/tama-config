class java::open_jdk {
  #include repos::jpackage

  package { "java-1.6.0-openjdk":
    ensure  =>  "present"
  }
}
