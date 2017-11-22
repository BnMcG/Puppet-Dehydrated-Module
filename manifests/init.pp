class dehydrated (
  String  $user,
  String  $group,
  String  $etc_directory,
  String  $home_directory
) {
  # Include the classes required to setup Dehydrated
  contain dehydrated::install
  contain dehydrated::config

  Class['dehydrated::install'] -> Class['dehydrated::config']

  # Ensure present in domains.txt
  concat { "${dehydrated::home_directory}/domains.txt":
    ensure         => present,
    ensure_newline => true
  }
}
