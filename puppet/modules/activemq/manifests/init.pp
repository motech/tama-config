class activemq {

  $tar_source = '/root/tama-config/puppet/modules/activemq/files/apache-activemq-5.5.0-bin.tar.gz'

  exec { "activemq_untar":
    command => "tar xf ${tar_source}",
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

  file { "/etc/init.d/activemq":
    owner  => root,
    group  => root,
    mode   => 755,
    #source => "puppet://${servername}/activemq/activemq-init.d",
    source => "/root/tama-config/puppet/modules/activemq/files/activemq-init.d",
    require => Exec["activemq_untar"],
  }

  service { "activemq":
    ensure     => running,
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
    require => File["/etc/init.d/activemq"],
  }
}
