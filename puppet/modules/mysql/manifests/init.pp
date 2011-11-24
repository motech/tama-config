class mysql {
	package { "mysql" :
		ensure  =>  "present"
	}
}

class mysqlserver {
	package { "mysql-server" :
		ensure  =>  "present"
	}
	service { "mysqld" :
		ensure => running,
		require => Package["mysql-server"]
	}
}