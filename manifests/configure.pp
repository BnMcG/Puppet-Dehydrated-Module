class dehydrated::configure {
  # Ensure that the domains.txt file is present
  file { "${dehydrated::home_directory}/domains.txt":
    ensure => present,
    owner => $dehydrated::user,
    group => $dehydrated::group
  }
}
