class dehydrated::domains {
  # Ensure domains.txt exists
  file { "${dehydrated::home_directory}/domains.txt":
    ensure => present,
    owner => $dehydrated::user,
    group => 'nogroup'
  }
}
