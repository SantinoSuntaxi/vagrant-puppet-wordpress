class apache {
  exec { 'apt-update':
    command => '/usr/bin/apt-get update'
  }
  
   exec { 'php-dependencies':
    command => '/usr/bin/apt-get install -y ghostscript \
                 libapache2-mod-php \
                 php \
                 php-bcmath \
                 php-curl \
                 php-imagick \
                 php-intl \
                 php-json \
                 php-mbstring \
                 php-mysql \
                 php-xml \
                 php-zip 
    '
  }

  package { 'apache2':
    ensure => installed,
  }

  
}

