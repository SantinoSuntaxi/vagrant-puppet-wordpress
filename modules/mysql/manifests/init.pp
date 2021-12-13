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

 exec { 'wordpress-createuser':
    command => "/usr/bin/mysql -u root -e  'CREATE USER wordpres@localhost;' "
  }

  
  file { '/home/vagrant/wordpress.sql':
    ensure  => 'present',
    replace => 'yes', # this is the important property
    content => template('mysql/wordpress.sql'),
    
  }


  file { '/home/vagrant/mysql.sql':
    ensure  => 'present',
    replace => 'yes', # this is the important property
    content => template('mysql/mysql.sql'),
    
  }


exec { 'wordpress-data-base ':
     command => "/usr/bin/sudo mysql -u root wordpress < wordpress.sql"
   }

  exec { 'mysql-data-base ':
    command => "/usr/bin/sudo mysql -u root mysql < mysql.sql"
  }

exec { 'wordpress-usergrant':
    command => "/usr/bin/mysql -u root -e  'GRANT SELECT,INSERT,UPDATE,DELETE,CREATE,DROP,ALTER ON wordpress.* TO wordpress@localhost;' "
  }

}

