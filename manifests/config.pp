# Class that ensures that Dehydrated configuration is correct
class dehydrated::config {
  # Ensure that the domains.txt file is present
  # file { "${dehydrated::home_directory}/domains.txt":
  #  ensure => present,
  #  owner  => $dehydrated::user,
  #  group  => $dehydrated::group
  #}

  # Ensure that the default well-known directory is present
  file {'/var/www/':
    ensure => directory
  }
  
  file { '/var/www/dehydrated':
    ensure => directory,
    owner => $dehydrated::user,
    group => $dehydrated::group,
    require => File['/var/www']
  }

  # Ensure that the global config file is present
  file { "${dehydrated::home_directory}/config":
    ensure  => file,
    owner   => $dehydrated::user,
    group   => $dehydrated::group,
    content => epp('dehydrated/global.config.epp')
  }

  # Ensure a hooks directory exists. Any hooks are stored here
  file { "${dehydrated::home_directory}/hooks":
    ensure  => directory,
    owner   => $dehydrated::user,
    group   => $dehydrated::group,
    recurse => true
  }

  # Ensure that certs directory exists
  file { "${dehydrated::etc_directory}/certs":
    ensure => directory,
    owner  => $dehydrated::user,
    mode   => '0700'
  }

  # Ensure that Dehydrated is executable
  file { "${dehydrated::etc_directory}/dehydrated":
    ensure => file,
    mode   => '0755'
  }

  # Ensure that Dehydrated is registered with the Let's Encrypt servers
  -> exec { "/bin/bash ${dehydrated::etc_directory}/dehydrated --register --accept-terms --config ${dehydrated::home_directory}/config":
    user    => $dehydrated::user,
    require => File["${dehydrated::home_directory}/config"]
    # creates => "${dehydrated::etc_directory}/accounts"
  }
}
