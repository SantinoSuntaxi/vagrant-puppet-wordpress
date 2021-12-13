class apache {
  exec { 'apt-update':
    command => '/usr/bin/apt-get update'
  }
  
 exec { 'php-dependencies1':
    command => '/usr/bin/apt-get install -y ghostscript'
  }
  
   exec { 'php-dependencies2':
    command => '/usr/bin/apt-get install -y libapache2-mod-php'
  }

 exec { 'php-dependencies3':
    command => '/usr/bin/apt-get install -y php'
  }

 exec { 'php-dependencies4':
    command => '/usr/bin/apt-get install -y php-curl'
  }

 exec { 'php-dependencies5':
    command => '/usr/bin/apt-get install -y php-imagick'
  }

  exec { 'php-dependencies6':
    command => '/usr/bin/apt-get install -y  php-intl'
  }

  exec { 'php-dependencies7':
    command => '/usr/bin/apt-get install -y php-json'
  }

  exec { 'php-dependencies8':
    command => '/usr/bin/apt-get install -y php-mbstring'
  }

   exec { 'php-dependencies9':
    command => '/usr/bin/apt-get install -y  php-mysql'
  }

   exec { 'php-dependencies10':
    command => '/usr/bin/apt-get install -y php-xml'
  }

   exec { 'php-dependencies11':
    command => '/usr/bin/apt-get install -y php-zip'
  }


  package { 'apache2':
    ensure => installed,
  }

  
}

