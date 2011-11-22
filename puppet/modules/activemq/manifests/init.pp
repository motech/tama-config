class activemq {

  file { "/tmp/activemq.tar.gz":
    source => "puppet:///modules/activemq/apache-activemq-5.5.0-bin.tar.gz",
  }

  exec { "activemq_untar":
    command => "tar xfz /tmp/activemq.tar.gz",
    cwd     => "/opt",
    creates => "/opt/apache-activemq-5.5.0",
    path    => ["/bin",],
  }
  
  exec { "rename_activemq_dir":
    command => "mv apache-activemq-5.5.0 activemq",
    cwd => '/opt',
    path => ["/bin",],
    require => Exec["activemq_untar"],
    creates => '/opt/activemq',
  }

  exec { "link_startup" : 
    command => "/bin/ln -sf /opt/activemq/bin/activemq /etc/init.d/activemq",
    user => "root",
    require => Exec["activemq_untar"], 
  }


  service { "activemq":
    path       => "/opt/activemq/bin/activemq",
    ensure     => running,
    hasrestart => true,
    hasstatus  => true,
    require => Exec["rename_activemq_dir"],
  }
}
