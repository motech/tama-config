class java {
  exec { "sun_jre_6":
    path => ["/usr/bin","/bin","/usr/sbin","/sbin"],
    cwd => "/usr/local",
    command => "wget http://download.oracle.com/otn-pub/java/jdk/6u27-b07/jre-6u27-linux-i586.bin -O jre6.bin \
		&& chmod +x jre6.bin  \
		&& ./jre6.bin \
		&& ln -s /usr/local/jre1.6.0_27/bin/java /usr/bin/java \
		&& rm -f jre6.bin",
    creates => "/usr/local/jre1.6.0_27/bin/java",
  }
}
