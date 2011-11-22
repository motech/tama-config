class java {
  exec { "sun_jdk_6":
    path => ["/usr/bin","/bin","/usr/sbin","/sbin"],
    cwd => "/usr/local",
    command => "wget http://download.oracle.com/otn-pub/java/jdk/6u29-b11/jdk-6u29-linux-x64-rpm.bin -O jdk6.bin \
		&& chmod +x jdk6.bin  \
		&& ./jdk6.bin \
		&& ln -s /usr/local/jdk1.6.0_29/bin/java /usr/bin/java \
		&& rm -f jdk6.bin",
    creates => "/usr/local/jdk1.6.0_29/bin/java",
  }
}
