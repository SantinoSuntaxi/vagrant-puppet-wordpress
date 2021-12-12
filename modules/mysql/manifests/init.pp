class mysql {

 package { 'mysql-server':
    ensure => installed,
  }
  
   package { "mysql-client":
 	    ensure => installed,
 	}

 service { 'mysql':
    ensure  => true,
    enable  => true,
    require => Package['mysql-server'],

  }

  exec { 'wordpress-createdb':
    command => "/usr/bin/mysqladmin -u root  create wordpress"
  }

# $mysqlUser  = "CREATE USER wordpress@localhost IDENTIFIED BY 123"
# $mysqlUser  = "CREATE USER wordpress@localhost IDENTIFIED BY 123"


#  exec { 'wordpress-createuser':
#     command => "/usr/bin/mysql -u root -e  'CREATE USER wordpres@localhost;' "
#   }

}

