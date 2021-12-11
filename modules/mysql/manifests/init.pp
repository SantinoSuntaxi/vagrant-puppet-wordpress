class mysql {

 package { 'mysql-server':
    ensure => installed,
  }
  
 service { 'mysql':
    ensure  => true,
    enable  => true,
    require => Package['mysql-server'],
  }


  
}
