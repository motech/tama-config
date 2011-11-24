node default {
 include java
 include git
 include httpd
 include ant
 include activemq
 include couchdb
 include mysql
 include mysqlserver
 include tomcat
 include duplicity
}

import "dev"
import "ci"
