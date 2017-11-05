class dehydrated::user {
  # Create a user to run Dehydrated with
  user { $dehydrated::user: 
    ensure => present,
    home => '/home/dehydrated',
    managehome => true,
    system => true,
    shell => '/usr/sbin/nologin'
  }
}
