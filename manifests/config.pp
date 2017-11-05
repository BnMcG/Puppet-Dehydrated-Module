class dehydrated::config {
  # Ensure that the domains.txt file is present
  file { "${dehydrated::home_directory}/domains.txt":
    ensure => present,
    owner => $dehydrated::user,
    group => $dehydrated::group
  }

  # Ensure a hooks directory exists. Any hooks are stored here
  file { "${dehydrated::home_directory}/hooks": 
    ensure => directory,
    owner => $dehydrated::user,
    group => $dehydrated::group,
    recurse => true
  }

  # Ensure that Dehydrated is executable
  file { "${dehydrated::etc_directory}/dehydrated":
    ensure => file,
    mode => '0755'
  } ->

  # Ensure that Dehydrated is registered with the Let's Encrypt servers
  exec { "/bin/bash ${dehydrated::etc_directory}/dehydrated --register --accept-terms": 
    user => $dehydrated::user,
    logoutput => true
  }
}
