class dehydrated::filesystem {
  file { $dehydrated::dehydrated_home:
    ensure => directory,
    owner => $dehydrated::user,
    group => 'nogroup'
  }
}
