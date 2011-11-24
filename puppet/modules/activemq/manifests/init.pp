class activemq {

  file { "/tmp/activemq.tar.gz":
    source => "puppet:///modules/activemq/apache-activemq-5.5.0-bin.tar.gz",
  }

  exec { "activemq_untar":
    command => "tar xfz /tmp/activemq.tar.gz",
    cwd     => "/home/tamasuper",
    creates => "/home/tamasuper/apache-activemq-5.5.0",
    path    => ["/bin",],
  }
  

  exec { "link_startup" : 
    command => "/bin/ln -sf /home/tamasuper/apache-activemq-5.5.0/bin/activemq /etc/init.d/activemq",
    user => "root",
    require => Exec["activemq_untar"], 
  }


  service { "activemq":
    path       => "/home/tamasuper/apache-activemq-5.5.0/bin/activemq",
    ensure     => running,
    hasrestart => true,
    hasstatus  => true,
    require => Exec["link_startup"],
  }
}
