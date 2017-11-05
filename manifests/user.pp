class dehydrated::user {
  # Create a user to run Dehydrated with
  user { $dehydrated::user: 
    ensure => present,
    home => '/etc/dehydrated',
    system => true,
    shell => '/usr/sbin/nologin'
  }
}
