class dehydrated::filesystem {
  file { $dehydrated::etc_directory:
    ensure => directory,
    owner => $dehydrated::user,
    group => $dehydrated::group,
    recurse => true
  }
}
