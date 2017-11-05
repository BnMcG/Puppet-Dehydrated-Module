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
}
