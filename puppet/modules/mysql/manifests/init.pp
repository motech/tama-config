class mysql {
	package { "mysql" :
		ensure  =>  "present"
	}
}

class mysqlserver {
	package { "mysql-server" :
		ensure  =>  "present"
	}
}