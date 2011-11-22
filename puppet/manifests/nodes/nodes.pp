node default {
 #include git
 #include hudson
 include activemq
 include couchdb
 include mysql
 include mysqlserver
 include java
 include tomcat
}

import "dev"
import "ci"
