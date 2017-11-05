class dehydrated::domains {
  # Ensure domains.txt exists
  file { "${dehydrated::home_dir}/domains.txt":
    ensure => present,
    owner => $dehydrated::user,
    group => 'nogroup'
  }
}
