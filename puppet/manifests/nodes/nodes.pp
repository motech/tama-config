node default {
 include git
 include httpd
 include activemq
 include couchdb
 include mysql
 include mysqlserver
 include java
 include tomcat
 include duplicity
}

import "dev"
import "ci"
