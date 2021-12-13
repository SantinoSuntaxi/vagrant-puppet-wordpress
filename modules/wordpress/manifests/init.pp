class wordpress {

   user { 'www-data':
    ensure => 'present',
  }
  # a fuller example, including permissions and ownership
  file { '/srv/www':
    ensure => 'directory',
    owner  => 'www-data',
    group  => 'www-data',
    mode   => '0666',
  }

  exec { 'get-wordpress':
  cwd     => '/srv/www',
  command => '/bin/curl https://wordpress.org/latest.tar.gz | sudo -u www-data tar zx -C /srv/www',
  path    => ['/usr/bin', '/usr/sbin',],
  
}


  file { '/etc/apache2/sites-available/wordpress.conf':
    ensure  => 'present',
    replace => 'yes', # this is the important property
    content => template('wordpress/wordpress.conf'),
    
}


exec { 'Enable the site':
    command => "/usr/bin/sudo a2ensite wordpress"
  }

exec { 'Enable URL rewriting':
    command => "/usr/bin/sudo a2enmod rewrite"
  }

  exec { 'Disable the default ':
    command => "/usr/bin/sudo a2dissite 000-default"
  }

 exec { 'Reload apache ':
    command => "/usr/bin/sudo service apache2 reload"
  }


  file { '/srv/www/wordpress/wp-config.php':
    ensure  => 'present',
    replace => 'yes', # this is the important property
    content => template('wordpress/wp-config.php'),
    
  }


service { 'apache2':
    ensure => running,
    enable => true,
    hasstatus  => true,
    restart => "/usr/sbin/apachectl configtest && /usr/sbin/service apache2 reload",
  }

}

  
