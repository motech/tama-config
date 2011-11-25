
class motechquartz {
	exec { "createdbmotechquartz" :
		command => "mysql -u root -e \"create database motechquartz;\"",
		require => [Package["mysql-server"], Package["mysql"]]
	}
	
}